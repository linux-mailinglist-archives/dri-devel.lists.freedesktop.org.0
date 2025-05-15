Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715E1AB8E48
	for <lists+dri-devel@lfdr.de>; Thu, 15 May 2025 19:57:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A35D910E937;
	Thu, 15 May 2025 17:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XQ5d5qEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC0510E937
 for <dri-devel@lists.freedesktop.org>; Thu, 15 May 2025 17:57:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yR4GmloRLaeoMUPOf3Gp3yuWyqKtbNtu1BO2I5Zaq5JpXtv7HQCPUwmSC79+35nlVJcOzleDtr7JfNUQcRLQNo9Y/rFBCScvWCJQsMwb4Vz/tsgsrUANyQovqOFWMtqER1Cf+AEkLDgdi38A4Dv00TK9JzCuiXmXAIqEa5OCGvxPWvKzV/Cd/1ZCb9klrot205LAD7cSezT8xuH9ippHzRNaXWQUav9v9ufr8uXvEmky/odq4+Jyy1Flv1Dg514sHE+7TV0+KEIdyB2uhEjvxPSTAQlLAdWuYLdzvgIaEuIQhxD/sRhqrO0CS58k6DS2s9fR8FM8CjwFd0l515ArQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmscDZhVissENZpdZrKn0hM3VxjfUgwf4b5sGF/zM/w=;
 b=Ss2sBNBjKSNZmZhfJm/0alfCgyj2F3I6p+aMuvbACQWl+Trd6zyXXJFCVPq6lMAAxE86eJL63AJcKZ57jipXX3VTSl3u/kNMyMonD9lZZdPmMDbYveacLTpqhGm26vCWzC1WZlPYTYibPzKZqTlXeJQdvtAzzCHTEEg+jYhrQ9+FJE1TX+hS5Hf+g1vgSAH+P22Cu+WJcXespmnTcwt+VA0T8nScOS4abHiVOr00Hz1U4EWlrFNAO0tCQq+AztQ8axWk47Q4mDZ2A26dVsrg3xT7tTZbLCf7W67KCq7VN0EQXeZ0QzQAjtdpLZqK9+k+4EYykhe2eY+AR1UVG1/XMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmscDZhVissENZpdZrKn0hM3VxjfUgwf4b5sGF/zM/w=;
 b=XQ5d5qENQ8S1FcxINYxY0jYP7B2BtDeUZwt99Ub0W+oB36pFQhi8jE6cy1S0enq0G3GYlSQTJRGomLBP2upsL/O2/0Zmj2mZ0XqrJucEvpVGHXz6a675kTdqZljp0eqEUp6YIH4h2YmWSNaORVtA3lhkCGh0lCzDMnsytZJ6zRJOetqaxC5qFQWa4JWrenHV9ajgmPMFdn5ymPKSDjnz5eBsuyOYkhQpufmeKOcYE6o0WqbG+7wJOwciEjzpL9mQeTsdzamUm9r/+s+sq3JMbXF/MzSw1GD5mf5M+S2lTTLq6gGnwp3F1oDjrLbgxfFNkcl4P7y+VGzAdhlU1bdTFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BY1PR12MB8447.namprd12.prod.outlook.com (2603:10b6:a03:525::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Thu, 15 May
 2025 17:57:03 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 17:57:03 +0000
Date: Thu, 15 May 2025 14:56:58 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Alexey Kardashevskiy <aik@amd.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, pbonzini@redhat.com, seanjc@google.com,
 alex.williamson@redhat.com, vivek.kasireddy@intel.com,
 dan.j.williams@intel.com, yilun.xu@intel.com,
 linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
 lukas@wunner.de, yan.y.zhao@intel.com, daniel.vetter@ffwll.ch,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 00/12] Private MMIO support for private assigned dev
Message-ID: <20250515175658.GR382960@nvidia.com>
References: <c10bf9c2-e073-479d-ad1c-6796c592d333@amd.com>
 <aB3jLmlUKKziwdeG@yilunxu-OptiPlex-7050>
 <aB4tQHmHzHooDeTE@yilunxu-OptiPlex-7050>
 <20250509184318.GD5657@nvidia.com>
 <aB7Ma84WXATiu5O1@yilunxu-OptiPlex-7050>
 <2c4713b0-3d6c-4705-841b-1cb58cd9a0f5@amd.com>
 <20250512140617.GA285583@nvidia.com>
 <aCRAHRCKP1s0Oi0c@yilunxu-OptiPlex-7050>
 <20250514163339.GD382960@nvidia.com>
 <aCYQdDrYYZRAgsen@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCYQdDrYYZRAgsen@yilunxu-OptiPlex-7050>
X-ClientProxiedBy: YQZPR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:85::26) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BY1PR12MB8447:EE_
X-MS-Office365-Filtering-Correlation-Id: 59812a0e-9180-48a3-9ead-08dd93d9e5b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yVjs9LRBgGoururh8U5QhkD2ZUW3q0Z8Rmhnh5OuEmvyhBg1tjPyCJ/R0xiE?=
 =?us-ascii?Q?/sWvDVhEH6TnotgH0eDDyvgr58Lb9jk9nzo1i6Cn2vlj08c7gE8yfBOcbuPy?=
 =?us-ascii?Q?if1xVWJG+UUkBC1uzGxMtb4mS8awxNHJ1gMPfafYTgqoTlpLzG9vFAWdL6t1?=
 =?us-ascii?Q?P7FmNaKLrIFVHTFUAx6aUiQdU9NLNsdlstjGVTIA06En6pfr2Uu8p//6StKN?=
 =?us-ascii?Q?LAgIQU9PRAvnYr2U42drBVhqB3C2BrGI4xHXLTfHN3RwMIBqLX8llSIrwXVb?=
 =?us-ascii?Q?8kzUJebqaSfNBJuCfY8iS99w18jER0ce2pFk+4xo9KaHdPTrcId6wSLM/6mM?=
 =?us-ascii?Q?uTSbgvwGnP+NybaOBJgytLkUqLH7GOL3RZDB/lmS3dJhKao7Skc8WXzFyQdZ?=
 =?us-ascii?Q?brRvx3exDXKplNdrKevaEGfry5k52Tmm2ZEPkkzbaqqjHQw7QPpV9QGRC70C?=
 =?us-ascii?Q?ap/tcMi9LBCFzkakkMHE91d/PuzUo/lprQygPIzYWVd606CqVGftLiIPlhov?=
 =?us-ascii?Q?nj6s2oK9lLa1j7ku2IMwAX2/lOY+cbiYkXxtoXzMx/WnjrkdbznYB7co3XGC?=
 =?us-ascii?Q?Um93BYn3dEy7vNS9pnxfjHRymkB0mW0fcLUTJKxBpr2Yib27q7HxqsuyJDis?=
 =?us-ascii?Q?ylsTSlSVdcRDPX3D8NU588LiOfnwzF2FPK2qjL2qiyga6s8B2INZuGKO+UlV?=
 =?us-ascii?Q?/vVWojf4wXgJt8K6b8v3ddjc7FbqlYJqGPitRE1J4KYzd6BqRSVcGw1RB0Af?=
 =?us-ascii?Q?bfz268mErzvum7XJmMMkfDDVLEGN4r7/E22LdQNFxmo8oImQ0gC7miZGu9rM?=
 =?us-ascii?Q?d7HdH7lxmzYojgBaWiph708Gpq3X7duKmwtJ/Ds/rUT2L9UlsDmNU/TpNVWv?=
 =?us-ascii?Q?jXn7IV05Il+Rjph4RKxSY5vVD2x7JumSLkNVjvkOOht7AQfvvECjCM6bJrBj?=
 =?us-ascii?Q?0DJ1D7ew3eb0EECT+izOug+b99peL2P10CHHPQ0J0Kaixul8FaUVSWEkEi7W?=
 =?us-ascii?Q?Sx9xoibqLYhoR6FJfKm1WRzBbBdfDAnVrk8dOopv+oV2zTKEQYMBnW4z6YYY?=
 =?us-ascii?Q?fMW5dgQ04ymzv2Zcqu2enZi4LgzVM/fhogvqrnCRpqJhF1KynvEgy2kdM7sK?=
 =?us-ascii?Q?pHSyCJmdmsjh+jr4jhtBrwkl+TWZu9T6W7uIGVDN543lp23IeHi3m6NwS1yI?=
 =?us-ascii?Q?EnYW3pPYD3MdjWWE5IlmnAzE8lxIitN4BgLkuSGlJILrRuETO/YlCKHO+8fS?=
 =?us-ascii?Q?vimENdebN8MXkHAdDk5OlkNMa4V4SZY4weKG3fzfS2Vgsodscp6ru4DEDq9i?=
 =?us-ascii?Q?hCOB6Irw91gMcAM0U//Q6vC4Io6WclKUtmLyI0bpaq9FvDklfpLW0lNeS8pE?=
 =?us-ascii?Q?gTaR9Xx9Xtx3Kp317qKcNDlQRb0QIZ6RhyvDVqwri32FvyqWZjAumb3gm7bf?=
 =?us-ascii?Q?S/48trLo4kg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IBvxpCedJxPaGWjtCOjrMuGsefRmDCj7WNM1nrxwuX1Y9UgIos70PZuSjo3z?=
 =?us-ascii?Q?SqHzEdgplsV0fWUQCijCVPrPh+UL0Ywleor8Z3cjn/J/sWq/T9dnk04EaqNf?=
 =?us-ascii?Q?J+BF1djIQiU/s+SV83Ch8nmANSClIQBiG6hPvJk7yzsr2T9sKeHbcJXtfoIg?=
 =?us-ascii?Q?TVep0BLBr4Cpi83NXrK9KUBPmH8dZNPyraCd2mOR37ld4XfIO5NPO3Sysv2l?=
 =?us-ascii?Q?AywBwgEA9p0q5bodwj7CFFGy7Dgmv1AlKufHdmIrXOg56tIUV16QvfecnfiD?=
 =?us-ascii?Q?3+dShrcgnYwQGKXZyswrc8OYxl1KvTt5PvT7nikG6KEgD4OyEhwB5aOm/s5F?=
 =?us-ascii?Q?yM/SgAgUZau4rGGZwj3XtCSyFOQ9K6WhB861yFRB+v+SlYmdyYgGuaoOck2I?=
 =?us-ascii?Q?7MxmmzH2yoSolFSomi7jYRXBJq7wFTFBIV7nyTIrE7JFTkHPbdB4fCE/1EaF?=
 =?us-ascii?Q?6s/dikntyZ9DzEJwOdPH+VhqLin4U0Cw20Hlp7LCgT/3aQh8Y9oxT7iH9g5Z?=
 =?us-ascii?Q?zdR5S0cenWRZJKGbfm1Sqebchw3h/T46QcGHRcskxNTPPLKbJ7C5F/9oZ0DK?=
 =?us-ascii?Q?I0Ixm4Eyskv51SKctKdjW6ZiIQie4YYxlcWAHAWZtugLwomY4VqNc/JtUIrF?=
 =?us-ascii?Q?sOUDNl+OhkpkVbIFjHcOwEXB+Vx8ND/vQf73C9UofOPxLfw8VoKf9UJoTzCq?=
 =?us-ascii?Q?KHYB+Q+OMut9xVVN4yJRbjZIlfSju8ES7tRMDO1bKhmZCrrlgf7D1v0PQYYe?=
 =?us-ascii?Q?lYT6HHCnDdN60Up02QLoZvqNmFINDeoZsk6ZeYrJ/nbXunaFNviPFbOL/PVk?=
 =?us-ascii?Q?4wVW1gh5bUdK+22XMxgd2bh1iiIvKJgkz+EyvZNyB99yzI07H5ij96PXMUQc?=
 =?us-ascii?Q?qSbPA7cxT0gPm7CA0oDpGDFqS1ngUYk/BO8+ApIztqU2teU5tkyrsh+5HZPm?=
 =?us-ascii?Q?YLBpaR0FvFawkAn9GjPQs9c5EahSLs2f9P6jISmBpLGhfT6wAqsbQFw47yk/?=
 =?us-ascii?Q?ojwnJ9sQHcs+MKlRBrjot3HVng7Tf2rY69QNhCR1pWKnRN5Ln6T5ePViDiUD?=
 =?us-ascii?Q?cm5S9TMF/w7tYa2Fy1f4F3GYkMMDF6cruSIlT8vgruHe4hdD3Ua01LFOw/bO?=
 =?us-ascii?Q?1qjYr9dewVQHnM6l17FX2RdBUzyN5pmLgFT1FE5aw8tQxaiTGZsKct5+rc0O?=
 =?us-ascii?Q?XYcqD+ZhpId93Pq4OX7AEzRX3UtuiLwO6qabsKF53t1DIdL6ojdnzdIHwno+?=
 =?us-ascii?Q?OvghJU9yapZ0H9u9kzr0p/5x4zFiKZgSD7ALGz9EutPgPKXlk0UgEellQ0Yc?=
 =?us-ascii?Q?mwyknwmaeBvkFCcat7anNzmWnCpw0OUO45+mFMJ2EVspAW4dlqzflU4/nvxE?=
 =?us-ascii?Q?Y2PjbawcbS9CaHk5+na6B03bRs7BuIYF+xFo3QljKfdyi1/CEMYDwXI5DMzh?=
 =?us-ascii?Q?PC5iKyGVMdUwbvq4K/0zWgxZmaOhqbtL/uPintZZotVY4dQAUIWYzhBCdul5?=
 =?us-ascii?Q?/Y6JbOksXltShGJAAfXKQVInZ1Gn38dMwSDDVvs/PKEwWsTBPUe2thFDLaVs?=
 =?us-ascii?Q?kopXNKcu5YWnwt8CvsfcckUcFpyjO75TuZ0ZOdb4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59812a0e-9180-48a3-9ead-08dd93d9e5b7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2025 17:57:02.9269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iob54/9RB45wAXhAOBsdgDZfFw0pZndW2tm+KFeYquBNKiIsrG8qdr+G5TnTrAhp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8447
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 16, 2025 at 12:04:04AM +0800, Xu Yilun wrote:
> > arches this was mostly invisible to the hypervisor?
> 
> Attest & Accept can be invisible to hypervisor, or host just help pass
> data blobs between guest, firmware & device.
> 
> Bind cannot be host agnostic, host should be aware not to touch device
> after Bind.

I'm not sure this is fully true, this could be a Intel thing. When the
vPCI is created the host can already know it shouldn't touch the PCI
device anymore and the secure world would enforce that when it gets a
bind command.

The fact it hasn't been locked out immediately at vPCI creation time
is sort of a detail that doesn't matter, IMHO.

> > It might be reasonable to have VFIO reach into iommufd to do that on
> > an already existing iommufd VDEVICE object. A little weird, but we
> > could probably make that work.
> 
> Mm, Are you proposing an uAPI in VFIO, and a kAPI from VFIO -> IOMMUFD like:
>
>  ioctl(vfio_fd, VFIO_DEVICE_ATTACH_VDEV, vdev_id)
>  -> iommufd_device_attach_vdev()
>     -> tsm_tdi_bind()

Not ATTACH, you wanted BIND. You could have a VFIO_DEVICE_BIND(iommufd
vdevice id)

> > sees VFIO remove the S-EPT and release the KVM, then have iommufd
> > destroy the VDEVICE object.
> 
> Regarding VM destroy, TDX Connect has more enforcement, VM could only be
> destroyed after all assigned CC vPCI devices are destroyed.

And KVM destroys the VM?
 
> Nowadays, VFIO already holds KVM reference, so we need
> 
> close(vfio_fd)
> -> iommufd_device_detach_vdev()

This doesn't happen though, it destroys the normal device (idev) which
the vdevice is stacked on top of. You'd have to make normal device
destruction trigger vdevice destruction

>    -> tsm_tdi_unbind()
>       -> tdi stop
>       -> callback to VFIO, dmabuf_move_notify(revoke)
>          -> KVM unmap MMIO
>       -> tdi metadata remove

This omits the viommu. It won't get destroyed until the iommufd
closes, so iommufd will be holding the kvm and it will do the final
put.

Jason

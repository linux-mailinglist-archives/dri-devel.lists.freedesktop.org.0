Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62227ACF293
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 17:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45E310E08D;
	Thu,  5 Jun 2025 15:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r+Dek4k5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A53D10E08D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 15:10:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=One5hzuPoxfdrRSC0jZoQpVbAzSVUQE+4H2oab61a5blancCv8rjU+b4uAr+le7XlD182pl4TxdFzUGbaxSOJDXEyRnj4VYmmMqdzmGnUL0oIgwOvqQKGctmFoi27ToLwQVK22nvQcNiycF5sVAXiPmdPCdamgIZG+8SGFZCJ5089Ri6UG0C42LLHkicNpyy7cYv004a0+iUW94E7KJ0j6r2vn5Bby+q93SNH42ah3LS7sUzRsiSIAAcrptIsz+C7Pt4VUzCLpZHv/B+Hn6o5wFDJ56tGYizDWdAXM03GYW9/V0xNBzvdkWdV2MChCLbSMxEdw8p9DLIHoXUil4IZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sq5BBXoM8W602IWL88Q0nT3aeD/x47Dsd+4p6D638PY=;
 b=wKiHh4Dew3JjWWYe7BJQ2kk6GaxQDBlkoRlQ0q3tR1S3S8Ih4CqOq36r5nB2yIeBebrsS4Leg+2EGktAm8fdse9j+oUszVLvwHsR1803HKOVuH+2UILPF1kv9+uvZ9Bp+pemhdDCZWw6DPllPB3596UgH5CaMwg6zXhiSOekWo+vvXyCDH440sVF341pYISiS6dykJ0yOrIMn/czOZStZMZgeglR/tXPGLfqCW+Bh8ZNH0cmbcNK8vmvnU4siE2MgPkxoLPRh99ncvsf8QBED+jL3U/QzXhj/H9G3wBMuA0nLSyNP2mTm8LpexVl4lm47hO/tzIih8mS6PrjW4zxzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sq5BBXoM8W602IWL88Q0nT3aeD/x47Dsd+4p6D638PY=;
 b=r+Dek4k5y5qcJWUDbVYieCFNr2cY+xIhwJDr5U0wLCoSO0vFCcQBFt2FUIZCU+qTbyqIu+WMIvI6bDKFqRcg8uORFkcbr5Ru6KW08j/L2Ecfq0UdaeikrB8F0aOmISx+LuJXV3TV97OCLJR3tNz+ZYFpIM/uKTj5XklQpzQpQN2YyXsHkG4Td1cwx5LFl3mXAcq3TOAVxYlG3TCGLxdGqpspIEp+A+NmAB9BY4sCwJD3QDUEqBnknl+sa7jUT7/CfFk/Z4rhzuKktyj4kmPOG3uAgCLXMfygMXuns4xsHdJvh9gYgSwhoz0j4ntHkDQGMC3VUdQe8GI2ey2rNje8tQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Thu, 5 Jun
 2025 15:10:31 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%6]) with mapi id 15.20.8792.034; Thu, 5 Jun 2025
 15:10:31 +0000
Date: Thu, 5 Jun 2025 12:10:29 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 dan.j.williams@intel.com, aik@amd.com, linux-coco@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com, linux-pci@vger.kernel.org, zhiw@nvidia.com,
 simona.vetter@ffwll.ch, shameerali.kolothum.thodi@huawei.com,
 iommu@lists.linux.dev, kevin.tian@intel.com
Subject: Re: [RFC PATCH 19/30] vfio/pci: Add TSM TDI bind/unbind IOCTLs for
 TEE-IO support
Message-ID: <20250605151029.GC19710@nvidia.com>
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
 <20250529053513.1592088-20-yilun.xu@linux.intel.com>
 <yq5ah60u8kev.fsf@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5ah60u8kev.fsf@kernel.org>
X-ClientProxiedBy: YT3PR01CA0112.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::30) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|BL1PR12MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a09373-8ae6-4193-25da-08dda4431cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jZt0TaGoBwgG5ls9yVYzgNt/LaSYXqtKqGWPul3Cv0keOImZzcKuE9abDggF?=
 =?us-ascii?Q?ghfrjIzsFVMlgSR1JFYxkjOneeLY6zUGOiJNH+ljQdtN2jTXVafTQ3D2KyrG?=
 =?us-ascii?Q?+uDSq5Wb3GkEiK74144CIcFciHXmTT2yKu9G0y7UA39Rc6Ii77SRzp2czfJl?=
 =?us-ascii?Q?iLxMpshFD+DI+F8HxuWIvcWJ9/4OnWS8lZ/LNl0aV2ZVZyGWgShXuBa/rW4P?=
 =?us-ascii?Q?/9UKe9RmLJglQRBAhZKtVKEJVjfNwUrcTYgQ+t7ePqt3/gDAZUNjfB+Ctv/K?=
 =?us-ascii?Q?rU1j5rCPWbDqfI+ZAUQ60LEWgUI9pZdmxYIM+T9v5m0PTfS7WHSaX/nO82kD?=
 =?us-ascii?Q?8ZG5PPI8IwoTx7/KQ0E96bEHGKIjik8e9uKBPqrLHIWs8lpdqAMu6KJ8ZDlg?=
 =?us-ascii?Q?GAXVUWLMHjnI75tJD1AvoJvEZkDVBnWMDxCeQ4VLFZAneO6fgCM4GhthndJl?=
 =?us-ascii?Q?saO4I+Oo4cnUJXZIaAnSWjhMyPx2fISrKzSCUkC04UDQiPj2Hv0dIzLjoL7l?=
 =?us-ascii?Q?wHnNKrKYloHZUR3f2yvLR/75v9E88Bv9GsMAQCQHveE16EzyzFVkPGOxqEAs?=
 =?us-ascii?Q?2PIXA5d7JBmXg1koLT9ZreOSTpB5+PEstgH83MoL1gYE40VKOTGinn9dVGBP?=
 =?us-ascii?Q?Ip4pBpPkTOtqTMliJhhhLCAuRfN9eZOPejzKWZP3ReZcocXADi+adZgCF3Q2?=
 =?us-ascii?Q?UGIb72y9O39LE7V/uUDU7Y9jI6dHjSrvAYnaZsxYB8YuqRK23aGDAp8GHPVo?=
 =?us-ascii?Q?qD17NsrsHNSKSSH4EouX+jip5q4EGU6B30e3Oa5V9vjFr7r2vbywiY6fTU2B?=
 =?us-ascii?Q?uuzqVbbIopET3s18ZyFw8ypZu7tXOmWBCEcpv8liwe4UE9jzGmZ4/dkxwy27?=
 =?us-ascii?Q?iz5ji51KbX6XcMhlxDXfxNc2jIUNW18BJapkGbLm5G/KjjzHF8hS3a3LQ1EV?=
 =?us-ascii?Q?fZI/dDteE7/wjIoRfg7bkmvV/9iuV1KL7IX7ZMyZTni8FJmliM3K6E9rcUrN?=
 =?us-ascii?Q?ckycPxQH90tHWou1pevUVU0M1PtecC7Iyr23p3tnusLqXSDanFQvdw40Y5Wv?=
 =?us-ascii?Q?RTUC8bT6ZZ6RYnUkf4pcrLzabfQY5tngGokDaP5T2msfjmzsBB/fRuCRBnm9?=
 =?us-ascii?Q?WFdctwYDcnaksBtYl/JuPhCVeLJjnVY6V0P6IiUJs7AtL30HcFqZWZLaq2HL?=
 =?us-ascii?Q?xsaX2RX7xXsYyh7vhcqqWMsJNPo0el7THA+MJb42tx8hPpSs56lrz/D84BFL?=
 =?us-ascii?Q?7e8XIf4AXXJ5ruLHmTRy15559hqcTbcpUTSX+yH1lneQLcEs5yzMqMWgBtI5?=
 =?us-ascii?Q?Psgpx2dUpbaIPCKMMhMxsm0tc2KNAp9yushVdCP3q4Bz7EPcyait+avktJAS?=
 =?us-ascii?Q?s5REsAYkuBPKhvUnzfzuAzhuu/dOtlOkdYNf+cWwPbqnZ87IvQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yGteoiXrdfCRUBqJFZKMIrFIhfR7FAPFRP6d93wKuN21AE715xNmLaG0Sa0b?=
 =?us-ascii?Q?9hnG6Z6RxtYGKixV7GZ3dOZUi6ox3gX77GbYNncO2ImVXNEDBKQrZBo72+Um?=
 =?us-ascii?Q?CKq5iGMRPgILDwZyQUUXN++oPFWZnrYJso2YgX2BGXMm73F9MqX/o/gl4Zu3?=
 =?us-ascii?Q?KvgljXcSWFbZ5hr6Z4uHp4qlTiAwClifdwfvZ3B41KD2/JUFZQquzUGxkCH6?=
 =?us-ascii?Q?EJEwA+AsbXsgGGejSQtoLX0AjRkQZ3XM7mc66AnvXBhqNbKz9Jx2c+9P/ytu?=
 =?us-ascii?Q?Z4pPUoHCR7B/I1q4XKZIxtrOO+/bpq2Ijh39MuUG0GzvHjSeDQrwfCqaLVst?=
 =?us-ascii?Q?iT0h2azt6tVWZ87KmVsqZmdEUoAwCpYND6yZed3A4H0MJ1D17UN/B0+ldae0?=
 =?us-ascii?Q?UWjutLGC8twmRcLsQ0JOh0Gj4uls2ssWWz6wmJT4U9OV+WF52cnFMKfzwb0G?=
 =?us-ascii?Q?TCyvU87NoV6j7b9wDZKKEbsS/y2LTTkiIaY0uoSYLhJyZVKBfDr9PuhBDGk1?=
 =?us-ascii?Q?3+5GR2JwC6MjPcj9TVNQGOx5mefp8WZjvTaY91v8knvaGylxGbn5rttMCNEc?=
 =?us-ascii?Q?mogdNuAVDGXARl/5ujbfew3+FXi6yT3amo3uvC+fAmeTFp0Aw15bdKWVjFrW?=
 =?us-ascii?Q?ySSyRGKaP/qUWKebiTxM02zxXrUMkyvfJz/xgcVp10BOqaH/Jh43/2+T5ZtE?=
 =?us-ascii?Q?Qu6Rn4OqsxxL8XuoZUNW3dmRICsb2pWQEE0zRkELi9OlbQJXCHG9fMUiQoRJ?=
 =?us-ascii?Q?BrhwEnvXS6rqruoJEzFPgRnZ4BSLeEjwCb/4O2L+RWZgmhqXq/akHBzUN3V9?=
 =?us-ascii?Q?YZf3TU7aV5kHkwX56zOhBJRZr2KbLETKa4LhLbyC4YglkqCuSmdEyckOKmNa?=
 =?us-ascii?Q?Hu/tK5DOZa5ZDQSZn+3lsQl85HK494BAeQWRJxjvMmQA93BjI5oac7Anza/M?=
 =?us-ascii?Q?Lc+xdgv0gUNgRvJTg26ZMgfLa/JRgiGvqxXjxkSNbo+EoXH3lZ3Qa3RW9kJi?=
 =?us-ascii?Q?U2XkW6OLmQNDx/9+ObCG1U5zYwXP/3BN8gs/+4H0criKe32bFFJSuH62PZTk?=
 =?us-ascii?Q?3PDPzqlSCJEJzGNGVLoqzD55ox7+qxcvL6dCg0ps0S8sb+VRixsZLWn6+fv9?=
 =?us-ascii?Q?+N503AQUxTsSgSaEN1wnHDyD8tL7I7YTwZHfx+sI1/hFI5/MzHaTR146dWK6?=
 =?us-ascii?Q?pPcOL1dfPSDTZMQmV2GcSW8nz/sEr39uvqGPJf8tJlXQ5wKwladeH9M4G/zu?=
 =?us-ascii?Q?bWt6shl8recAbr6Mb2aPTEeNZMXLdBDKVS/nyoYMqfFc4VYrNaPCz2NdRLw/?=
 =?us-ascii?Q?VZnJSOpQtoUBfCRxkQDk3Io+oYl/l5gxOcnZywQwDrQSKOnKeqXMC5jCnpFc?=
 =?us-ascii?Q?OzW35gtvBOMIlkkHd3eQaKO/8HHxlDzHkeO1dV2pumWScmkmMaQEGnnXpvtF?=
 =?us-ascii?Q?dH8BQFFZn1LFAn9e+fO0jpkGLIRIE0My4GfdFGSiFsv9W4fHcLBnMm7TQVyb?=
 =?us-ascii?Q?lnsnjcqWTeJhvLNneCi4mjTg4G76TaMj1HJU6aWOlzkRdV918nBnEQF2dsTp?=
 =?us-ascii?Q?IN+U8tCi6H6IGG1dDypX40iwU5em2l/eIReLPPq1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a09373-8ae6-4193-25da-08dda4431cc8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 15:10:31.0713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9EQiPkEgXPRFVmuuyh1hYrmFZWuB+EB4Oh++6BBEEXIq3lhlZUjUVjTgdali5Uaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5993
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

On Thu, Jun 05, 2025 at 05:33:52PM +0530, Aneesh Kumar K.V wrote:

> > +
> > +	/* To ensure no host side MMIO access is possible */
> > +	ret = pci_request_regions_exclusive(pdev, "vfio-pci-tsm");
> > +	if (ret)
> > +		goto out_unlock;
> > +
> >
> 
> I am hitting failures here with similar changes. Can you share the Qemu
> changes needed to make this pci_request_regions_exclusive successful.
> Also after the TDI is unbound, we want the region ownership backto
> "vfio-pci" so that things continue to work as non-secure device. I don't
> see we doing that. I could add a pci_bar_deactivate/pci_bar_activate in
> userspace which will result in vfio_unmap()/vfio_map(). But that doesn't
> release the region ownership.

Again, IMHO, we should not be doing this dynamically. VFIO should do
pci_request_regions_exclusive() once at the very start and it should
stay that way.

There is no reason to change it dynamically.

The only decision to make is if all vfio should switch to exclusive
mode or if we need to make it optional for userspace.

Jason

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A299606021
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 14:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C1910EE2F;
	Thu, 20 Oct 2022 12:26:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2089.outbound.protection.outlook.com [40.107.243.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CA610EE21;
 Thu, 20 Oct 2022 12:26:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFIWeUQIzWL4AT5KzhG4nz9AxSGmaz1Ebntansbdu3muP8E7zdX3eyitkRKS/BXjVufleRd5/pGZ4q1wwAd3sAn3JFhzOza/0P6d3Qurzoq6AmEkXyTsx7vwfalkdFbZ9q4T4D1OItSO/0WGO03WGSpwBAbjgPBp3cj6Nz69xAIYWzqm8oExeQBsYN7ZAdCPmJPYashmqFKlPUSW8p41Yke7osHLsPC0BGFjbNbARH1RAD7gbWGDzmASCVL+Qw3mfJVF9TczVjQr/ye7g/EqoFxvi8uxJkJRKUPbrBKYF0eAafVAhULTcg1it843JuUBc9wvs/tuIivzMo8YAy5MeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwvS8aL1DUZ/JHgDrwRKcIKtXmC95b5x/uVex0bu09c=;
 b=n05q8OP+xT8JHZCj8axyIhLoXa9lUmhQL7BLLI72xzGWdtiuLq3NqYTibe3Rr2hZSflMV3JCr7KtG8u4jxtFdOhAfvQLJ8C1EnZKrlzNBo7faQPFicarF3XnAJePk1GKbj9DYMN75icevwD/KDPOdCK0ych+7ujlOX8w16km60YqBLwYnPRYWl+q1y2oXi6Wf2N7AYeTTSJ3JUsdATBPPwJXUZRxw3XLikP0T81+c1HTN+rWVkxEeehPSXIhc0E3HA8RDekUdDO12qNrGXgoZt5apnFXuVWytZIeRDxy6fpqgW/7CY+QvAA6QmWGyuGJYI+PzoBTXTRHB7Nx2yMRdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bwvS8aL1DUZ/JHgDrwRKcIKtXmC95b5x/uVex0bu09c=;
 b=GKnBhw12FvIMjxy9X1juf9lPWAd+EcdMYH+3qzvjzu6p831b+Aj/wOTmus6gxaWsCwxyB5iWXOVurDs+LDkXxHmAn+J0l4w86S+h9+33BBRiZnE37KA4dNO60TCZVfrN1e4nEkkXYSvbILOOQ/7cUHeyaXx5J0P8T0gujd95wUWG0eA/MLoSW+UgtlhImKhrkd8rwQPb4u8FiWvA1JjhekBlypEYEZ8XOoE49pnkuRN7NJwZzrjgWA8kkaygkVK8YC5wt3U8e4vPWcf7Lcky5PPqcOQL+JoUBKXxWxJKfZYB2PEEkARCoE00EXOoZENCxrlyHKsCSGI0IfPkco2aSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by MW3PR12MB4441.namprd12.prod.outlook.com (2603:10b6:303:59::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Thu, 20 Oct
 2022 12:26:49 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 12:26:49 +0000
Date: Thu, 20 Oct 2022 09:26:48 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [PATCH v1 6/7] vfio/ccw: replace vfio_init_device with _alloc_
Message-ID: <Y1E+iEkW3GgKyYIi@nvidia.com>
References: <20221019162135.798901-1-farman@linux.ibm.com>
 <20221019162135.798901-7-farman@linux.ibm.com>
 <Y1Awsh56Ur/cDrHh@nvidia.com>
 <44b6c9d164b1ba02483ed23a89ec843f18f1cd63.camel@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44b6c9d164b1ba02483ed23a89ec843f18f1cd63.camel@linux.ibm.com>
X-ClientProxiedBy: MN2PR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:208:c0::46) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|MW3PR12MB4441:EE_
X-MS-Office365-Filtering-Correlation-Id: f3f561b4-dc2b-4aec-c427-08dab2965c37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TO2JpyCE+8wKhBfqAIGIE8Z+qim8Rn9tVYfeD374pYAzOUVtDXYIKgtY5yZqD0hHSExfoRLZjpVD1TiBQLjoiyhf4VQBIa3ldSHEujOLI0dSVq8aosv91YnhRPPu7JETzRmLGhegtbLGVvV4QodwEv2kJqwy0evtWFGdn8f90lbbS9NeG9eTLt4zkHOPDswYRQO4KDM8NEAGKe0H4pyW2TIHOePr9lttgaWgA/bdbmRJK3HZdSsJdgo3QiOI7HQHGvwvpC74zS9d9gqiLCANbA60eEgLRowrO3Crj3dpp+yO0DibbFjErxDfgTPSy3hkZd/6eE6PJBZQ8s27uV5gon4nzZZZzf6e2WiyJPi+cbkElXUW9l52NTydFWE1p3QROd3PhlP/UIa45B4xwQH2ue88B4RHAzWYbVMWv5nqpZWHcudgje/rnH7UxTGK1TM1IcM/2CHioG1IxgeTvs9qOKCrM9RzkZvlZ5xqsqbIbrJIZUoKfH6BzZ6A2cBobQ0XTbwIvUVtWiOuJBsaFPQ8pO61UlSA80yBvcQEqgMePC+pWvlXP5vDyvPS80pkS9iZ8E0hcQGGqICObPOpIO8Srit4FiYYl9AVNsYtrCELtey2DZhcS3Du244ldLiusbEDWUh+uvy5EnxOH3iA3jhRW5r1OXVXv5pnHY7GJRXwq1+qGqnANk00y3NxEpaPAbJnx7IVNx/Hy/SNw2VZV5o7fAzJPWNCHWwTWYyqNxzrA8A0GhqihhcXbgXYcs2NUXhd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(136003)(366004)(376002)(396003)(451199015)(38100700002)(478600001)(6486002)(6512007)(8936002)(186003)(316002)(6916009)(41300700001)(54906003)(66946007)(86362001)(36756003)(66556008)(7416002)(2906002)(4001150100001)(8676002)(2616005)(6506007)(26005)(5660300002)(4326008)(66476007)(7406005)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?azNkYitHdkdtenNHQ1hob1M3S2xZenUrR0FDWHRZcGJIZUVkY2lyeEd2ZURm?=
 =?utf-8?B?cUMzaG5wMnRFM3lXZ0M4b3ErVE9kdzB4K3hUOG11Q1lhMVhJVzFFQUJveFJ2?=
 =?utf-8?B?aXgydEVPUTlpTzVzMFJHNXJZcGMya3ZyYjNhRHJGN3ZLSHdsQlpqb2lxd1Rp?=
 =?utf-8?B?T045cVEwM3hmQUhpa1hoODV0by83aTQ0UGhTZXlseTNyTHBBcEdIUGtVY05X?=
 =?utf-8?B?QjlpdXEzeGNXLzFGa2JqUFE5ekxRb1RCMFJxMHFnK1dsRHZCUjZEQUhONTFt?=
 =?utf-8?B?WUVmMmd6anViNE5FRnc2bEJqR0k5eW1aaG9KSERpSnpzVjBLcXQ5anFFZFNT?=
 =?utf-8?B?TlZlc3grbjNKVzl0ZG1tWGlKQXBKdlV2YUxmQWpsdVF3eHBVbEVzbHRGbkwr?=
 =?utf-8?B?Q2JBVVN4WHVIRU9CT1lkSnQzNGI2UE0wREZFNkM5MFVlcktqTWtKNFJaMDVD?=
 =?utf-8?B?M0VpSDJSZ1VmWjh5SmIyT21hQkhUZE95U0xiU0xmY1F0VHRxQmVPdFUxaE1W?=
 =?utf-8?B?WjVMSWZYYVQ0Z2ZpaE9ZSGRvY1JMejhsVCtvcFFXVlZXVmU2dFJCTDBnY2Vz?=
 =?utf-8?B?SHNGeDVhL2pKNWxlOGw1cjE1NjdrZWNpSmp6MlNIbWtJYnZLSStCWG5ndmNa?=
 =?utf-8?B?Mk1lMFROTE1kbjZ4N0lMcDZJenhhMjVJZ3oyUDNldHpsMjFJUzdCV3BORExW?=
 =?utf-8?B?QWF2TWM3blhURkJoL3FjK1FSSC9iQTZNbEpwWlJFZ2U2S213MjkveFdqSmpr?=
 =?utf-8?B?ZURhY0p2VnhyM05uQTd0dFBDcFd3dmlNTjY2UHNmQzdrMnF6TkFPdnlzakVI?=
 =?utf-8?B?eGdmVmNYL2lCS1B3RUMyQVJibktTejNyd2swcHBxYkdFUEZ5ZnZ0TnY3UHVH?=
 =?utf-8?B?a3hxQ2F0Z28zZmhkUGt5L3ZrV0Rnek0xS0l2RHpraFRIb3gzeU5BZ0E0UUtv?=
 =?utf-8?B?dm9PR20raUVOODlRK1BFZ3Q3dlRZOG9GOENJTDlURDlJNGFWcHVvcFFWZzBB?=
 =?utf-8?B?ZDJLUk5zbmhScGhRTFlscG9HdmxORXlkZnp1eStIL1RhcWhibXplRTlqeDNB?=
 =?utf-8?B?ZVl1OGZ0cUpIZHU5bFJ6T2Q5eWFhQ0ozN2ZJVldWTUR5UVdyVWhzNWVuRjBB?=
 =?utf-8?B?bHZUdVZoS1VqWXg3UVVlSGl4NG5PTmxMaldTVyszalVUOFY0K29kL25Qa0NW?=
 =?utf-8?B?dUNYQ0JPL0tJdGZybUZaZGxKd2wwMTI3TUxDa2lIb0tFV3NFVmRReXZYOHVR?=
 =?utf-8?B?UkJEMlpiUDZPcnE0VVE0SDBBUmJvcFJESjUvSmo3eFZSVG03bDlkZ1g1UFlD?=
 =?utf-8?B?ZWx2L240LzNJT1dyU251SjJLUlBXMW4zbi95MVkwMWEvU25ZbVM4cDdGVzRX?=
 =?utf-8?B?WmFtbWlqdzFONEFLNjZBYmJoWXkybkJKS3MrdTZhSW1YUjFMdlhkWEg5dnBC?=
 =?utf-8?B?OWZUMno5aEpnT0tNNTRXQ3BqeGt4cDNsVkptV1ZWUzUrQnpRY21CNjBaUElI?=
 =?utf-8?B?MlFxdFc1TWEyQzNWUHdGMFB2Ym5ReUdBdVRLcm4xMUpkeUQ4OVZVa2FEanUz?=
 =?utf-8?B?VlY5RUNDT1V0c3NMVGhRWGMrTURJa3dEODZTckN4S1hlVDFFY09hb245TjRj?=
 =?utf-8?B?OFFpTHNIWHA0Q01MQXZNb2M4c09zNDZLNVpnVytpQW91MmR3bUFiUVBYYWQz?=
 =?utf-8?B?TkIvVWJMS1FuMW5UQ0VlYVI1MlQyeTIvSEp4VkpadnRVR09Mb2NmaE9WS3Zs?=
 =?utf-8?B?RGRBZXB5VmthWjNSZUhjNEo1ckpiUDJLaXVtL1B3NHg3WjYrMEFnb3BBeU03?=
 =?utf-8?B?ekc1cGZlWkpnRTM1K3I4MmZQMjFONkRFUXFiM0VJd0hGbU40RUVwZEFISG5j?=
 =?utf-8?B?U3V1TjRiL3psYkdnZ2ZOcEJTWDhRcVRYWGN6VkV3aVNIM0NYZGl4M202S0Z5?=
 =?utf-8?B?MGRGL3pVbTRoRzI1WUdjeVNrTzEvZENsVjVQcERTeTFkWmpkTEFvWFFNQ29J?=
 =?utf-8?B?SW01aVJiL3Nwdk1xWFhNK21EVWZHbVpFTVROZjBpVEZIZmU4U2hrSklydGZa?=
 =?utf-8?B?SWN2UGV6dUZrK0Y5emZxZGN2UzliM09mV1dsTi9Cc2ZaZHpaN2g5cHlIdTI4?=
 =?utf-8?Q?F3zc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3f561b4-dc2b-4aec-c427-08dab2965c37
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2022 12:26:49.0546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yoVIokIo35gi1RDBMPy8mkdlIPuWrpT797QfVbMWfQ97MPaVAdh6BdC1HRsixBqm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4441
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Yi Liu <yi.l.liu@intel.com>, kvm@vger.kernel.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Kevin Tian <kevin.tian@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gvt-dev@lists.freedesktop.org,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Abhishek Sahu <abhsahu@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 01:57:41PM -0400, Eric Farman wrote:
> On Wed, 2022-10-19 at 14:15 -0300, Jason Gunthorpe wrote:
> > On Wed, Oct 19, 2022 at 06:21:34PM +0200, Eric Farman wrote:
> > 
> > >  /*
> > >   * Initialize a vfio_device so it can be registered to vfio core.
> > > - *
> > > - * Only vfio-ccw driver should call this interface.
> > >   */
> > >  int vfio_init_device(struct vfio_device *device, struct device
> > > *dev,
> > >                      const struct vfio_device_ops *ops)
> > > @@ -422,7 +420,6 @@ int vfio_init_device(struct vfio_device
> > > *device, struct device *dev,
> > >         ida_free(&vfio.device_ida, device->index);
> > >         return ret;
> > >  }
> > > -EXPORT_SYMBOL_GPL(vfio_init_device);
> > 
> > Should be made static as well
> 
> Agreed. Only reason I didn't was there's a prototype in
> include/linux/vfio.h to satisfy the call to vfio_init_device from
> _vfio_alloc_device, and I didn't want to get into moving things around
> if I didn't need to. I can do that on top, if you'd like.

You can just add a one line forward static declaration at the top of
the file in this patch.

Jason

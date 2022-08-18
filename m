Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B2F5983E7
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 15:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4746B0E83;
	Thu, 18 Aug 2022 13:16:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AAF97E88
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 13:16:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OfYGyJ4WEz9+xNtqyt88gthUhG8FF38LHg7N1bQhGXs2fx8FWFG326FUfVzppP2/9rjeBaIgHf3SwGYMWmP3qLQG5QNPkJH76vG7exdyr6NVT9x6FqKmWdshxrURXILpEA7Pm27mq3zODhO8BETb4AXFb7oz+Mz4HgWrFPMHSKNFUfyglXL5a/Ul6xlW3e13kJPuaR6zEv6uBu5A8WbWY35/Xh2CWBEAVNeKsPlfc8HLjFbsqE39DREccBXWKUt7Gop1tWh4A120ZKpF2MNA91RufsxQM5057P7zSpXsNEWKdrhGnlsDbB0G/BwEDNM//j09ngsUhRYZUVBvd2o76Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=28VhYa5QunRXQkBBnMZMo/T9V3EeOeRmCT+Y7T+enls=;
 b=MCDNSCSWznYsLBFVRaTqFIBNkcu9yGBnmfJ2l7TKC3ZL6vJRhp8NR4Mf1nVTPJrOd26Xs9DK3D+LdvUWwp7Kl7JN23vEyvdZDkcvFVV7/VUv0LevL0WGi3MPfZAU5APBdK2M19kUM38Qky++VCNCmUu7q6A6ipSEulRfx+xu0EKq/e7ARAe1PmQiSII5pnOwy6DNay7V8e26Yd89NNw02tjAdUev5ovHtGo+TkODeQ2g9umLVNOsjgC05QYrDgNyQhmypW8e4q+yTGfnqZLrHWRwHqkba4VCrF/88Q+bHi3QQHQbNpo+dQuFKIEvE0Aepc81OfsZ29vMGLB6agTH2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=28VhYa5QunRXQkBBnMZMo/T9V3EeOeRmCT+Y7T+enls=;
 b=V12GjMOkQ2PLCZWC2LJGL1lI2ARwuWUC3MGfcmfLh123IioyLjvh8AKcTb9Csea58QCGfl1T+JPOd/zMphn943yUDWtdVZwZP7MH/y5KMW0rLjPElHkhIGdSRizwed91z96JGeGkCIrs0vnRPuWDoJ4kp0/6a+jiXwd8nHa1E+LPakYVGIIRwNGgaDbwCTyACPqFCqnyp/NNIpI1GypIhcb/wHVWU9hmJ09KR6OP0gOz3+xLSGvcOoalJSmPxMDeSXT/6UhmqEIEk8QBcZk6v0mXQPNAJEXp3aYVtGHeK5ClOUW8AJBgTvPNCN36l5lSq+MGKFjzQjDaOaFzS1l8Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by PH8PR12MB7025.namprd12.prod.outlook.com (2603:10b6:510:1bc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Thu, 18 Aug
 2022 13:16:08 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%6]) with mapi id 15.20.5525.019; Thu, 18 Aug 2022
 13:16:08 +0000
Date: Thu, 18 Aug 2022 10:16:06 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH 0/4] Allow MMIO regions to be exported through dma-buf
Message-ID: <Yv47lkz7FG8vhqA5@nvidia.com>
References: <0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com>
 <921de79a-9cb3-4217-f079-4b23958a16aa@amd.com>
 <Yv4qlOp9n78B8TFb@nvidia.com>
 <d12fdf94-fbef-b981-2eff-660470ceca22@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d12fdf94-fbef-b981-2eff-660470ceca22@amd.com>
X-ClientProxiedBy: MN2PR12CA0027.namprd12.prod.outlook.com
 (2603:10b6:208:a8::40) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13ede1b0-315f-4770-3a56-08da811bcfd4
X-MS-TrafficTypeDiagnostic: PH8PR12MB7025:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cMQEts3JrozPyuFh0j56SLEd9XYjUaT8imCp7+51eT9hQ9Eemk1HsJIgO2N+zXm0kTHHjrBGRFDrK0V4v2vsJA5KM5jlRHqdT1UiZLqToUxVPE8zPirvSEV5a/OqgOHR5qu535VLOMh+gI3JEm/EhtTb1kL7N1gX6/nf9OdSwiAeiSHdHgI0gZZTANwzNFaeLjxR0GaN5ZrtrK6KwtHy4i0QLrenryXSEvdxdpxmZSb8nreqL/Pn+5Lm2YwqTpZyODjBlai6+Il7rb0LWhabciwB6Zb746jLpu0UnKlGNzrPT1R+8E0qg4yV+yCTRcVDYVOhXHwNThO36tZnKBMAm6x0rki+GsBcnwnAjJbPBH92bCbnoJB6WTW+spN3r17Y8wvqih1eNfbh1waMSxJ2cimYOw32xUlIzE2TFfQ0mY8+M88WjvaYXa8pXD/ErureSbi5kktGyzu7Dus9BVpsViZc3f9YOEJLw0KFYn43tntLfyY4R0hxywgQve44Pp4dp80ngDxnhHGMfpblNHkMfAuHRfLvGk2uhOmktds9vabUrVKgWO6Dkq/bChPuY/Pd31dTBRGuYSZju+RR4nW/FDvsixi0qQIKavr1/yQ/TT2uXhEAueRLrT1rKn6ctuAoqzw7SOZKtkAli+XZUN5xAaSMBYuGUPgXg4gXSp3dB5h/RNKiK/WfJl8VbIdkGIkxWir+9tv8UoPfhfGC2uVNug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(366004)(376002)(39860400002)(346002)(66574015)(86362001)(2616005)(186003)(4326008)(83380400001)(38100700002)(66556008)(8676002)(66946007)(66476007)(36756003)(316002)(54906003)(8936002)(5660300002)(7416002)(2906002)(6486002)(41300700001)(6506007)(478600001)(6512007)(26005)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QythYndwUS94eGplN2l4Z3hFdmxQbkJ1c0hqUWFvVExwbWQ0L0FuNGRpWklj?=
 =?utf-8?B?UmxWRUd1NVU3cnVZUEFhdDdlc2xFdUNDZGU0bzVZN3h6QkdxT2Y0U3VqdTEv?=
 =?utf-8?B?aGFLNlZvanFDQXpnai9EV0lEUTQyK3VOMmxUZS80ZCtqRkNZeU5QS2VXUHFG?=
 =?utf-8?B?V1FWQTN1SmFsY0pJbU15SlRwaEpHRUVyZG1RSkpWby9rVnV1UGI5Mm9XWjNN?=
 =?utf-8?B?N2pMeHkzU1BkaHo4VDVFQzBNQUhldDFQbkhsYnlXdWRTY0V5QXpJYy9OeHlv?=
 =?utf-8?B?RG95UDU1OU85b0lHWnpRSU9JQUo3QWNQeUMzNFZkUWxwd1dadEdlQ2hjaGFV?=
 =?utf-8?B?QmVhY2NRMGlYOE5admxnQnZ5ZEsybEYxQ2p4QVVkMnBsVTVLN1NHNjhYUlF6?=
 =?utf-8?B?WWplajR3a1RtSm0yTjVvUlZ4YXUzR0lMdmZVLzl0UUQ2anBaemJpTXFpbnhI?=
 =?utf-8?B?OTV6eEJwWGdocHR5SFJZcDlMMGl4NUh1ZTg3UWF1T3R2U0dBdEtaU3QvRHkr?=
 =?utf-8?B?czYyaEdwcGtQY2NLU2NKeDRhQVpFY2FQc0VCQ0praG4yOXRETi81ZStTUUFu?=
 =?utf-8?B?R0REcE43YXdvVFN5VGVjZndWU3dENTBsaFVTQ1FXalBNbm9hWkZlUUpXWCs3?=
 =?utf-8?B?dnl3UTFWOHFYR2syYXBLUlcvOFJSby9kZEhmbUFBSmVreVIraTNBekUyNkwx?=
 =?utf-8?B?STBrU2x6RHJjVjdPa0JNWUhOTW5NUmhVbTF0SWRhTk84NC9GZWJnVm1jT3h6?=
 =?utf-8?B?RjlIMHY1UW9Fby9sQlQ4b1NzMVhXdSswQ3ZzT3Y5QzdtSitrd3JhQXFpYk5U?=
 =?utf-8?B?Qm43cy9XdWpPZG8xaWlFcjkzNnRrb0dYcVV3Z0pxd3dPZHlHK0JibWN1dUN3?=
 =?utf-8?B?MzZDd1diQnZMdk1UaGVXOXlhL0hCYTNSc0ZLOG1nalJLWWtYM0NHMURtTkY0?=
 =?utf-8?B?M0l2YjdyQUIxNlJpSWFlWXdjYWgxSm10WGE5YmttQklVRzhneE9UMWpPTkRW?=
 =?utf-8?B?WkVwVWN4b2VoNG1DZHYyUkZQeUJ5dTl1RlZETGwzNG1rY3FVbUd4NDFzQ2pF?=
 =?utf-8?B?eTk4clBoREVvcnVrWkRoN3Z0S0U5bzFRbUtSUzJtWmVReXYwTWpqd1NFYVBL?=
 =?utf-8?B?ZXNuT1JzOW92SDdkd2hSa0NpY2kvWjdqcE4wOXBCRnBpNTRCOHlmalhnQ0o1?=
 =?utf-8?B?RVZBUlBNM0laQnR1TmRuK0tkQ2c2bUpTQmozUHdSRWlRU3RQSnJ5REs5SkJX?=
 =?utf-8?B?WDJsMGxHNFg5c1hBYzZBTXpSSWlld2hjQUw1aU5pVmNTNWNPRkJjRm1hOGdk?=
 =?utf-8?B?dHFuUXM1R1JUSTEzbFlERUZkM0Z4L3VLaWFxZlk1ald3c0FHSzVWb0xWZlRR?=
 =?utf-8?B?dkozM2hUc1lZSHVRQWtqaUQ1Q2xKYWFiQlluWm8wYVR6b2pONkhMYUxXOEZu?=
 =?utf-8?B?ZjFnb04ycXdWR3A3MGd3QW5WY2QvQ3ZUNGJuZFlqaGkrRmJad0RJOWtUQjI2?=
 =?utf-8?B?b2laS2pzbVJiY3Z4S3pUalZnUE93L0VzdmU3dk96S2YvRDEzT0UvRFg4d0d4?=
 =?utf-8?B?SjNGMUlwR3I2Qm91SnNiTktzTVNycWRSS1g1QlRnZ1YzakwxMU5WK2dsMDRF?=
 =?utf-8?B?MjZkOWRncmI1cUJQVjhvUWZPejN0blh6R1FveU5lSzRUaVdsVWZIajBNcUlj?=
 =?utf-8?B?Nit0NzlNSWp0aHhkYzJXUklLOEFmSkdjT0lyYTcwZDVVSzdleUZDSDdWZStk?=
 =?utf-8?B?RDR6WmlJQytMY245eGpyNEpMeW1NVDJNVU1yNmwybDdoNE9TWlUzcWJyMHdL?=
 =?utf-8?B?WTNqVlRObnNTUlMyZW5SMzNRVXZrYnV0NG9lOHh0M0NRbkJHVk9ZUzF1bHpT?=
 =?utf-8?B?OXo2UytCUHJML012RldXalRUZERVYlVvMk9ERDYyTVF0UUVjM29YOW4rcXdX?=
 =?utf-8?B?M1Bidm1uazZnMzBaVFg3eTU5MHllYXFtc1d0dzNaV29RN1BWWjQwT3YydFA4?=
 =?utf-8?B?TXZiSUc3U0IwQXllTkxKU1NaQS9KaHY1S3NwL042V3BjenhnNDRBVkQrVkVl?=
 =?utf-8?B?MFpMYkxsY2F5eUlnTGUrNVFnVU5tam5HbEpoMkhNM082cytzU0UrUVdVUjBj?=
 =?utf-8?Q?NugEBAhd4IK/5ITfEliaVM1Eh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13ede1b0-315f-4770-3a56-08da811bcfd4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 13:16:07.9269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OWhRUz29UZTAaBRZAED1EBbE7uXXTxyKKIP/ImLlvZTEAO09oQnEd6BkLzRfHvdL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7025
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
Cc: Leon Romanovsky <leon@kernel.org>, kvm@vger.kernel.org,
 linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Cornelia Huck <cohuck@redhat.com>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Alex Williamson <alex.williamson@redhat.com>, Maor Gottlieb <maorg@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 02:58:10PM +0200, Christian König wrote:

> > > The only thing I'm not 100% convinced of is dma_buf_try_get(), I've seen
> > > this incorrectly used so many times that I can't count them any more.
> > > 
> > > Would that be somehow avoidable? Or could you at least explain the use case
> > > a bit better.
> > I didn't see a way, maybe you know of one
> 
> For GEM objects we usually don't use the reference count of the DMA-buf, but
> rather that of the GEM object for this. But that's not an ideal solution
> either.

You can't really ignore the dmabuf refcount. At some point you have to
deal with the dmabuf being asynchronously released by userspace.

> > 	down_write(&vdev->memory_lock);
> > 	list_for_each_entry_safe(priv, tmp, &vdev->dmabufs, dmabufs_elm) {
> > 		if (!dma_buf_try_get(priv->dmabuf))
> > 			continue;
> 
> What would happen if you don't skip destroyed dma-bufs here? In other words
> why do you maintain that list in the first place?

The list is to keep track of the dmabufs that were created, it is not
optional.

The only question is what do you do about invoking
dma_buf_move_notify() on a dmabuf that is already undergoing
destruction.

For instance undergoing destruction means the dmabuf core has already
done this:

	mutex_lock(&db_list.lock);
	list_del(&dmabuf->list_node);
	mutex_unlock(&db_list.lock);
	dma_buf_stats_teardown(dmabuf);

So it seems non-ideal to continue to use it.

However, dma_buf_move_notify() specifically has no issue with that level of
destruction since it only does

	list_for_each_entry(attach, &dmabuf->attachments, node)

And attachments must be empty if the file refcount is zero.

So we could delete the try_buf and just rely on move being safe on
partially destroyed dma_buf's as part of the API design.

Jason

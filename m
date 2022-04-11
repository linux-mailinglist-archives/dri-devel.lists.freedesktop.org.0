Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD7F4FC246
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 18:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6002110E96E;
	Mon, 11 Apr 2022 16:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2059.outbound.protection.outlook.com [40.107.101.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0996C10E687;
 Mon, 11 Apr 2022 16:27:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P06KCZxE8pOHHEgL/EPIY1op7gi3PaAzXr61d/zQx4wp1gxqcg/qk+Fhs/cTzoUVN6Ly8Bnt6oqcRxRfTkKXetS8cqLYwsFiO9ZGiU+lBESkHnX9aPgf5Xxm2XM4YxkZFVy4A8ZjOHWqzvjNhCvo3FtOKal5OTfBhEOOf0HbQIU6nhUuDWGhiMfXjESN/ywobHabzu1+1BHAv2mFJhVgLhesa7Q4ZneckrSrrymUXaDG7GSoNvr5GuDubv12UIq03P1czakkzoMJ3QXs9lF1ikYn6cCmWukbaYw+DR5nn7cLrPKMlGtDE+2oFrU6LD3I/1VJz141WBzRkJerdTbxqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlOr6+kMIwa/VO1Ar2I7c9RqVDXR2DfWQEnql5EtHSs=;
 b=kz0W2nUMTxBfI3H36v+HFzMpM85rX5G9tPRJqUtFMlk0260atcIIMoWunSudJl3HyJ3CiHUYLvUZGx8z+Xy7+DAFJ3L3Qi5yYlCkBIi99PVzYLsNJ5zJ82MFeImJYYB6QwegvCeddGAwWSpZKI6z6K3J9uMXAjfHHP+l2NRKz6uVb1TU9YxIg+KLsdfBiugrVa+PEHtkqjl8nttrBRdIV/SSsd9k99SACEWZuzL/b1InsT3sAYMs2l9uuOaUItCKxRGVxYGZb+BnwE+Zi7WmpG9vRGDjVumSDEol8n+PxfzsiwQLmODCR3Ey1ya7fm3ycKyks4vZVwljBL+T4ZEaTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlOr6+kMIwa/VO1Ar2I7c9RqVDXR2DfWQEnql5EtHSs=;
 b=ohwADku3GqvyI3R5U8qA+aX4B4seyw9tFkbrE0DzXUYBwdMn9nm7c0Un/AJucOxrKwIwZjb3gzD6q1HdXC38EweS4YLg+sDuywOcSDC5bc4wdHV6+f4GnuOi04H+dCh/AhA2CVN4tD475sowmfffPIDD3KovzmiiLQjaKNyTgJnQ8sdUKXnPX4fG96x2Yu9mZWF8k9f8rw1cy+c5T72kVkIx2XTwNL7zcOWgHjCoqAMgvzg63CS326a+UC+//1Ny/VQhwfumpyhRZTN4UgRBblLJS3HoZB8gQQdUdVfHoAHrrk9yuNhC+JRpKZ7Swm9TDLdKY5MOgg7qK4Xk1hdQlA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by CY4PR12MB1654.namprd12.prod.outlook.com (2603:10b6:910:3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 16:27:29 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::cdfb:f88e:410b:9374%6]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 16:27:29 +0000
Date: Mon, 11 Apr 2022 13:27:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 15/34] drm/i915/gvt: devirtualize ->set_edid and
 ->set_opregion
Message-ID: <20220411162728.GQ2120790@nvidia.com>
References: <20220411141403.86980-1-hch@lst.de>
 <20220411141403.86980-16-hch@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220411141403.86980-16-hch@lst.de>
X-ClientProxiedBy: BLAPR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:208:32b::35) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4a922e93-01d6-4e4d-9c1b-08da1bd82c28
X-MS-TrafficTypeDiagnostic: CY4PR12MB1654:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1654ACA16A2092DF72629993C2EA9@CY4PR12MB1654.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K/wUUCKrPMRz9SHcV4kqakNx9Gpw1I9noDemq+EWPLE8bunFtQRoIY3mJb2f+21OJGcx+/7EKAtqBOwAVOPV6Pxz8EsuEc8t8mxDEOiyBRQ3MR/u1KWsPmqR29DqoLx9KauzZTw40VAFfYxuP1F3ClJJYEhgyK85/+qh3LtpeoO/YI36ezuoVyTGtQE2S0ieYnssA+7WrUPeGB+T1NuvOy5HUHG8/9QUFfG5nZRyMU7H4+4YpcdlVgKsuLSJSpKbvDnAn3VKoZVxIC9r8jcYd3FtiqgkaoZddKflYLQktGC+o2WDt4Q1YqE2vNEJtWD+SY4icLFZownLWOd2dQaACej1WlwedsU+jfaoYGyX8p79LoJQk4MzBw6QHLWm9JVhSEkGzRmYqyJbF8qcp+p9zpQSl+I+m/8IAapD5ANi7+bwO5TpASGK4KvR35umM2165zESsXbdw2qj6JSPW2hzjtXXRB5mCrWpmvXcGDGpyJunWQL0Vs4PuiUFylFQefvM8MSECjXiwa+6Zt6XVvj+Cw1VSYSopkuZU2MkRTsHsJ5HQynB2PczE29bax2c2EmGPB0OIYqjKpebOlLVNfPuoFzT9ve1j68QJvT8jpmXmmGmlxD1+nd3vX7rynCDU9irFDzFshSmX42cC8H824KNrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(8676002)(54906003)(6916009)(2616005)(5660300002)(36756003)(508600001)(316002)(83380400001)(6486002)(26005)(8936002)(6506007)(4326008)(186003)(2906002)(66476007)(66556008)(1076003)(4744005)(66946007)(6512007)(33656002)(38100700002)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5LTt4MclHPPY4jB9TkMEgvt50lWI3BhAupckwuGD3D8sCeUBTBNx9t4WCFIV?=
 =?us-ascii?Q?pbasPWSKAbboUPA4L7ABWXW/4ZM0ejrPc8BP7IHMlWGjTjPw3giStdEGMfLP?=
 =?us-ascii?Q?s5ztg3SbRPCeNuBuVHb4e/FV3SCinn0w6CDgHw8sOv0iipbfTw6l8P0Tcwjw?=
 =?us-ascii?Q?aQcQUnjtRYZ+a0VrTcgJT9pvgpGTBrsgttqdW2nSHIW5a/0uYPDj23ArF7RW?=
 =?us-ascii?Q?yRESuFDic2ZnhDLU7foZ2RXct/O+t13YT00Fkix0jQV8In2VbJWE6kQtH7gG?=
 =?us-ascii?Q?lj6AZZ18LPIZazM/e4kwpk9chJ+mPAJtcxQ3q4QWikE7U5rpXjBSlE4rvNDB?=
 =?us-ascii?Q?dqGq5QICXsfDSZSk0ruDfSyHb5mq42cYPPWCUo9BEysS8kSBCOz0kMzHEjLK?=
 =?us-ascii?Q?oNv7OJGmLcUwwfoOZ8RbFi5jTLVgNe0yPYIVcpSmLEnhPaUHSGUQuaMHcPMj?=
 =?us-ascii?Q?bYtaKZfgrgE9nN/9igEQd/cfxlmrBORenDrFkbetK0414r0S0vyr2K7ld6tz?=
 =?us-ascii?Q?HtfeokYmBG2NUFtOYMm9gPruLtMmqJKzgPTHB4rGDZhil3Haiiuo28F0jPYE?=
 =?us-ascii?Q?HEjTM3k93lPO/ivsrrRFN3+A86bogi5o4HRfAZ6L678hkOJdcm8ECMvjk/qd?=
 =?us-ascii?Q?KP3AV/kcyoVr7Xi89swHntQCfhK7zd4d+jLZR/u0aKWegx+/FDmivZQkgejC?=
 =?us-ascii?Q?nnLvTOng+e9XcSOeAiYNG7dTL0CiUrOvBALerjZUKxUDnXxHA2HZPcH54WGm?=
 =?us-ascii?Q?VxjY1qdnp91HYpCMzBUbWHlS0SeiF7/7f9+JHZpc4YSqECdLY7YX3Cw2sMzU?=
 =?us-ascii?Q?m++VJx4T17m5SLdpOB0NUTGsDv4i0d8apVXnsNO/1HoozbFb1GhhiWxUjdHq?=
 =?us-ascii?Q?rJ3kUuGqYSYrlwqlSP92Nlv1X+vhfbzlIQcozIO0Y4uJdDMuv/zEOPrMLZPa?=
 =?us-ascii?Q?udBuXdxbk4+eYpVZzhV4jEVaDXJ3EocZDYU99SiKi1oSdCDjFhh6LAuks8n+?=
 =?us-ascii?Q?Ohtq4oEazOCqVTlvN182nojHI76ShNUYgq0W0KVcNH3Hbauqb/FiFCKOSkoU?=
 =?us-ascii?Q?s+3GrPJSOQjXOy2bLBv6DSEKVCa7iECE9kEIHDIYSGj9r7I6iaw7RpD6uykc?=
 =?us-ascii?Q?LA/AVFtIXVz7Y8sNJEu4sG+hUuQfnsGiLI5Qdm5Pgr2Ui9UFkpLi+ohcVmJH?=
 =?us-ascii?Q?r0XH9Pw1CRn/iKZf/3Wv044G4AyoJB68qhNgBmcnWmp270gP0QHHHq+S4KpI?=
 =?us-ascii?Q?d4m6E4e6SzMOAuTCkGf9kDsoMYZz+bW9fNaFBr1v/Qa5szcNEWR3oRmqKTMd?=
 =?us-ascii?Q?/IVhr22S44Phj9yTAX4xYctb+4YxqY2QAdk5FLGaarxlV+7DMae+dHMJkj8d?=
 =?us-ascii?Q?VNLcHWQHlzDnhw29BL3LXGKzCLr5KgVU8z2dguv2taDbv5AgQ7fDGb9NSidq?=
 =?us-ascii?Q?SFx/6JRhhUYHuAgWzc9I5ldI0A5Twu9u4I6XpqabFcDUdkednmr8hx2nGmJp?=
 =?us-ascii?Q?fx/Dcs0rsXaBiibBHNqQTfilzhRjcktzXskAQ6OkzyKONHAzRlSyQueuKNay?=
 =?us-ascii?Q?fpCpGal4Wuujr6BpJIF2nufx9DM/DljlfuPKlN0qYnHXAOwnsBdTY3tKsIow?=
 =?us-ascii?Q?rA1UBGz+Hv/ch1o353DYjcdb3++9UpIue73p25RAoU/5Z3Roaq+gAitjd7wm?=
 =?us-ascii?Q?aX+M2RFk/Lu5lVP9q2mV1xkEoQgzKXH+6pRsbUauHasWTTw00s86iPLpglbX?=
 =?us-ascii?Q?OsBwBegT2g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a922e93-01d6-4e4d-9c1b-08da1bd82c28
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 16:27:29.5497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTnZVd3znhPbpoTMtJsk1vprf+l4P6w4WZTFOMrkZGHz/pEIxCKUoFpRrN3uQvL1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1654
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 11, 2022 at 04:13:44PM +0200, Christoph Hellwig wrote:
> Just call the code to setup the opregions and EDID data directly.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h       |  3 +++
>  drivers/gpu/drm/i915/gvt/hypercall.h |  3 ---
>  drivers/gpu/drm/i915/gvt/kvmgt.c     |  6 ++----
>  drivers/gpu/drm/i915/gvt/mpt.h       | 32 ----------------------------
>  drivers/gpu/drm/i915/gvt/vgpu.c      |  6 +++---
>  5 files changed, 8 insertions(+), 42 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason

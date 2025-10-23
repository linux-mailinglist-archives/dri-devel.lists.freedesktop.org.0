Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4660AC03D95
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:33:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507FD10E99E;
	Thu, 23 Oct 2025 23:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rNZJQ5XJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012054.outbound.protection.outlook.com [52.101.43.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4420E10E9A7;
 Thu, 23 Oct 2025 23:33:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccSpS7xlc+Kih3DBjPGMstqElyWWiZv7OULg3TAlYNE6N5eXHW3yw87ZePISNCY1inLBD/p+yOZ42bDMvNWoJM6Bjbujf3z5Z0fIC1d1H5Yff0eMkO8uZeHy9vIm6Y6TjG7ndi2OHFFITKL+B0dZAi4QA35y9UcafiffF8rE/TU7UMmWx4UAzAhmRMeA8NHQVH52DJjZUWpGTuAkZLsuB8Vw6shyee/L+S0MCOfxhOX6ILOdKODhAft7Wi1n0yJaKj8/iu75jYgw792F+BT6+jClUFNupKtwj4k6hInxFhbM7DP/kH6EUrLj9SZq5FLM/weDUdcVCnywnJw7Hah9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwhrai6bA6jsyYRx7jplFlB7RKXp0qg8dCum5uU1kIo=;
 b=ZwsF+O8dp0PwrtY7FfHkUfYx/20EWhnBhQmJIJCFe5OYukXtPwBMMTgTll7zyo6WPwXIkie4TCJfwD/dfsfnweSePwtd7vFQbRq643bz+E+eKnwnsXXoqKFTzGYUSSaI4B6py8fttOjyEd5eY97sncu2FLFpi1cZdG+7EuqdkwW16uabEBtQ77neA+VkrQEOrew5sfBOBeiUdDgqwn+sfbO4SwQxVpIsRojKLW3/Zalua0T3TO3vEHPP06OcGofZ896zuZWkIhiHTRMsQaYBmW/a7CYK47ZJXApRvw63uQK0HkoebwDR9ZzGzHE2WHDTDbrdCJ6g0aa/4dzEZrOl9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwhrai6bA6jsyYRx7jplFlB7RKXp0qg8dCum5uU1kIo=;
 b=rNZJQ5XJgSw+J51aMaZYACb4gQWEkhUbuxTy+vtkeJaHP7OCfH5A8SDh5ySUwHUnp5earRraslxkimwis7SRfBeyP3tegLG2A0ppolySYnQeOoYabyqsVcRUR4czTXIjnWYgcTnJj/3b+WbtCaSi4wZAWj6g61wsYv1RxuFpe77UlM39uZNZ4MDEcW4sVVOxJJE6drcsqoER0wQqKhhXPdKMyoOXLuvxBkTkUPkT+7srYrfklQHPlL25yOjI8QPnV9YR/IsNw0DHlNxiEsnNrXhp2fLuDebM7/GwwzoRGZmYMfmXz/T7Vi3lB65tgl2eeljlXK+xIlJ4J2ljSy69qg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:33:44 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:33:44 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Pranjal Shrivastava <praan@google.com>,
 qat-linux@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Cc: patches@lists.linux.dev
Subject: [PATCH 14/22] vfio: Require drivers to implement get_region_info
Date: Thu, 23 Oct 2025 20:09:28 -0300
Message-ID: <14-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0007.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::20) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f7f9a96-e354-4ec7-1725-08de128c9b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9NtfcPyWuxLcFjWYrVmFSuqQ9AAYfEhd8mcdIfQW5xHWcM4NsKW4jlSPR4Fo?=
 =?us-ascii?Q?16GXwmm/3mCV4gFyXqsPiPzC/i0fq1fUsECFYpo6GJG6uwcPxB0s/G/+8O4/?=
 =?us-ascii?Q?r7mPIXUg8mTUGt+FXJ2S2XasxLuJBuenDceqQCeFhXmnBSNPIiQEoZQ2vAZu?=
 =?us-ascii?Q?S4w5AiFJIZIFCETxFY1Tn0zYvpX0czftnxu158fIS7Pi4Uf72XaMxK7FtUf0?=
 =?us-ascii?Q?3UlmLEFmS7lwyjj6zjkdYap/exBNzuRB3VoFvnSrCI2JfNt+R3S+wgLUUmww?=
 =?us-ascii?Q?AB2zCzy72HktjK3Cy57yRctDRcza+SMx3ZD5Ozmoh7SuLaJqaQbTpgodLsP9?=
 =?us-ascii?Q?p3ydViZy2l/Yxbt2xigNWDOs5FME+dRW/4BaW5cd99HK4hkW+TWWuJeXMmxl?=
 =?us-ascii?Q?4ucG66VxEW83zuhJ8cS9sez2WFUwn3Hkb6DQXx49IdPlqdGnqWIA1SQZLrjy?=
 =?us-ascii?Q?UlSpb2NPGtT0mKJ/8HTRie4LMADVPBfuGtHzcd4JpnpMOtTzLPY7Owzmk8Cf?=
 =?us-ascii?Q?aXofrXJzXjc0ss1qyM31jKpsgkGdbNW3ddUYacYmOK6iKfJx2Rd5dtR0+JNQ?=
 =?us-ascii?Q?y2NmX1+CZaiMae4XAAaJA5CxVcqVH+XcV480PRoZQGUyXSr0bORooAefpwhc?=
 =?us-ascii?Q?D/zXQTyvuNIbFNZbTx2CXgR/gb0hgm+181zxEnc6EohbSW97o++g04qqesmq?=
 =?us-ascii?Q?SdOFsonAp0Q3TxkHOyNZa7rN3yifOr63rxGwYmEfktWVadZ+Dqn9r4JQ715l?=
 =?us-ascii?Q?g1zdP5SUe8mHjFHdjpxMu+PxP2jgCgc8Ei1eJhSv3f3+3bwePk9UeTXhSezt?=
 =?us-ascii?Q?nToHL+aUzgDztm5jRHQA83Q+xqwjSXoTh0gCkU/b9BaZ0Ah+wtQAvPgMUUtg?=
 =?us-ascii?Q?O0uNNHgBdRynKjHI2HlQceuo0iPWkTOMN7KlVe1jfaemU4Uv5Z7PfOfkyQkF?=
 =?us-ascii?Q?L71Jd0T37qS5FBirrHzUMExlvstWQ26PQMVL3Xy1Yqv+OsQMN+20snURsJV9?=
 =?us-ascii?Q?y/xcbGl1hYjiLIUfytsoTUj0KXTQtpNyyfObvbXvtHqo+nY6VtKd9HhJfCjG?=
 =?us-ascii?Q?93vaK+PUjuly5X8Tj9hSLogtrcODYzPEIxr/gDyHeXu2C71o2irFDR6xrw+i?=
 =?us-ascii?Q?HMwwdatJ5crx7mAzlGBkKKSROVgyIR7ERhf642Qn9VhLeh+H+5qxc4bjAlif?=
 =?us-ascii?Q?zHRaXMt0UZsLJ4d0/23v3Or5ZG5ide2GzXm4cgzayFQ1t0PCqQgN/zZ3vVpz?=
 =?us-ascii?Q?Pyunfvhg2zrOiyO038KxpV8UVY8whm51Snwy2WZqONrOPhiNxJ5NufgDlPeV?=
 =?us-ascii?Q?OkZNGlL8jSEGq56BVgDnZHb9i9nI1FegIBUXc7j5BpsYZ64daOe4IENtmVMk?=
 =?us-ascii?Q?TvMnGl96R8mPpnm0ovuvkJjnlXkRXcKdj47BQo4pf3PwTj/8Ul5TFZrCNfiy?=
 =?us-ascii?Q?tnvN+6Y60yN2afd5kuRZ7diwPCU5L8oKYzvBeC8odSu2XaN00EBmdZNu/95A?=
 =?us-ascii?Q?gDpm/Th3gs20v9k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xI7JJ+nmh9ysoi30eE4oTNNMmysQOqwtfvfkm5wwcVo+lKq8jlCeLTuCeDCF?=
 =?us-ascii?Q?UPkGOzHZORER3nfJnxhVpaSOayCixoV4cMQr7yAoyO6GQepD5lzU7iX01reo?=
 =?us-ascii?Q?VL30mdfE5zYMxEhiUYJ0b+Svlo3iQKJDiGMFsEYY82zF3QkZ5ixCXa69R5DE?=
 =?us-ascii?Q?4dxlYxwl5bRZuC9QwW6QCamneJIyJimSiUMeudj0Zh6tqvHI/RzVP9S6kvnC?=
 =?us-ascii?Q?jX+jEGyUnMl7TeW5rUR+p9m4eJup+59iR53IRjpEyV8nQX77Y0JwWfeFFY5t?=
 =?us-ascii?Q?P93JdUumOk1+HwcKME/Tt4SQHQAN1VggcuARXt2xoh8kKJICksjrrU6uuw6g?=
 =?us-ascii?Q?xIAyjDP/xBElbSgOVOeIusNErWyezQeNqHyu2EnkvLJVTq99pxCFCd8NraCP?=
 =?us-ascii?Q?YF02xQ9SolesSxFphkGcy1HUQP3VhDPnxOHM6z+7zYDi+Im08Xh26/encPqi?=
 =?us-ascii?Q?CRG3N10MnB/UXNLKeV5R31YjQuV1NKiSgQHdr/xb69eCptjgzAn4kCzN6SIf?=
 =?us-ascii?Q?HdvSPbqNcdormWQJSesKHbrXwJ94QEHrIcwvYcrMLKwAYtvRwvSmVUZxoO6X?=
 =?us-ascii?Q?41tFjstt4i0dpW6TzZjkapE4v/zLGSTsxjWLkDLK/59s/DjpxapiUym7GlKp?=
 =?us-ascii?Q?Dc+4FTIHG0Od2meCuH+7uON8MdzJUP00RawgKTK9EtSnHbTbCNMPIJtldf/o?=
 =?us-ascii?Q?XkNycIqYUK/0IUbUDdJLzuG6XWrqWHwOq0WQ0kiLQKu7t20c3UB/am5sFOGb?=
 =?us-ascii?Q?zFmL7yqL+nReeIXaRTuoTAZftlpB/KavX1UmDKZifU+DS1ZZfbDYZZ2rj46G?=
 =?us-ascii?Q?1Y1pr7XVViNXnYeIoXQfY4MdxjwlPdo2TflBFN45bB14qyaMsDpkISPBjZrm?=
 =?us-ascii?Q?Wh1F0/j/eaFOQokFFxwqnHY2Fu5nDiB2rXDl+GhOu+Ybp+g9lpMwf93igYo3?=
 =?us-ascii?Q?ia8o4AcRF6zgWVFQUzw9eqfqVUdiwNUUlyle0jT1h+lGV5g45RygsOAmICH1?=
 =?us-ascii?Q?hV+jstRPE9EkArFDtQylntZIxgdf+7jE654rVITc2Ji35jpbvpsab8PEiWAJ?=
 =?us-ascii?Q?+bWZ9aJJoUxAL/umVcca6VFgt4quuZ0xIkdx6K8Vr4vq7w86BwC0c5cSLrrK?=
 =?us-ascii?Q?4KrFPU+lFigAi1i9JJ1pqbAAL4uy09b+Mq73fBn3gCe78dpepvFn/J2WpklA?=
 =?us-ascii?Q?VomJK4EUqP/sDWxQO3F3z007f93LCxYzZaEH4EVtiQK4SumaVg2NI1+SyW8b?=
 =?us-ascii?Q?HIX/wDedMPdNQfs9F7XOfHLPx8rn/5sMYZtwBoFP2mZES9AA7aYZqe/AF2zu?=
 =?us-ascii?Q?4ZdQofvXH9ACiRuXlDEYcqgXpreT6G/G5meMb5R6OLETMPwGia4Wul91+X+R?=
 =?us-ascii?Q?O0bjPp+GZr2XLBOogpbkRibU7x2dzxiEfO+rKq866f0J5H38nb1EezT+Voq4?=
 =?us-ascii?Q?oefMsKKNbsnnjXT1FYoM0mL9T8lK1hef3HjT4OFyIeQU9ixJOAImngnZExKW?=
 =?us-ascii?Q?5Sclu7vXraxTjzdY3zREfZPJuBNHudIwSle9tH21xwBDNWDj+td0KargXKGp?=
 =?us-ascii?Q?zKeJjUVzlp13kSdWGNsGRV0tIEzjVWFMvwBxzGU2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7f9a96-e354-4ec7-1725-08de128c9b29
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:33:44.5998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGrv1IYmsi6K5vZRhPtNe7v8rDGd272T98zOFylbTMvYYhTMXNlb+E6fDR9nGrOa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943
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

Remove the fallback through the ioctl callback, no drivers use this now.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index a390163ce706c4..f056e82ba35075 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1297,13 +1297,13 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 		break;
 
 	case VFIO_DEVICE_GET_REGION_INFO:
-		if (!device->ops->get_region_info)
-			goto ioctl_fallback;
-		ret = device->ops->get_region_info(device, uptr);
+		if (unlikely(!device->ops->get_region_info))
+			ret = -EINVAL;
+		else
+			ret = device->ops->get_region_info(device, uptr);
 		break;
 
 	default:
-ioctl_fallback:
 		if (unlikely(!device->ops->ioctl))
 			ret = -EINVAL;
 		else
-- 
2.43.0


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42114C78F33
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 13:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F7510E05B;
	Fri, 21 Nov 2025 12:11:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="C7Q6LamD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4820310E05B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 12:11:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bfEJGEo165MX+oYUscAmITnEmSt4yl/AM0pq3ZDUfsULeSXK5mmFtSCQHiIw4VZNi5iikaqoXOYB/0lrcdoJK0f7+GWBNHit6ZbU5DN7Ha0iEEUnpMx5hefdKQoqGGxAX2a8wfeGYeZlpohkwa5jL3xYtmafH6tTbcsF7qff39iMQpLg0qP8qcsZHE9Kp951t/dIAbDMq0qF0k+ofiNAPqWbZ9uPKlaytqxsHFrgON5aqxE/qmKIzb+roA9ZAsswKSDHeH7XeuUd3DsKf1IeITpm0Se6lNkNuviAabEtg/VXVULWBZmVVjoqwTcXogIh+xP13LWygMZuIxkBctmi9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VOEygUEA/Win0vFf+XqYiKIiG+d8RoiK1JRlqeTYcg=;
 b=w3vM2fplRl9UV3g6ETZAXpODC8rabfxeWzKR6QaXZhomPaYY9wLvKo1nga9f8p2h2thCfb+gaMmQ5yya1vNqAFG7nIbs+s56g1F3vFzD6HUyMuthtgJS1PddPsleG/YgyDYGSI4fRFStFVlXhXIz/E6rAraZ6PYHpJ60v3W33jLjXv4+Tsby67f+KlctEyx/+8aJW4NsK4wo4/v2EJZ/8SR8zQnzNtdri/+cM61V1Vb+ra3pSHxU9t78lvb8ugik1xdLbOIXpKI6wzzbhIKs3YKkKxonrmkEB7GzAuvXvx8WSVvi3mB5v/BabUw7SygNRB14jIi2iqFVQcDXmG37Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=suse.de smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VOEygUEA/Win0vFf+XqYiKIiG+d8RoiK1JRlqeTYcg=;
 b=C7Q6LamDTry1o1vT3lMJKyko49Bc28CWd8tJRPBJA9lnCHTh3KCx4AbCALaYhkMHLYMG62djghM1K1QtllqIHscgX2grP+Ux5bAQbWgH3hKDHXOC5gMfr/qTJNIXOQlgW5+Nyvk1bQcHeRdd1ktZlYm01zEBytIWn8raMAyn2ME=
Received: from BN9P222CA0006.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::11)
 by BLAPR10MB4849.namprd10.prod.outlook.com (2603:10b6:208:321::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 12:11:22 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:10c:cafe::9b) by BN9P222CA0006.outlook.office365.com
 (2603:10b6:408:10c::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Fri,
 21 Nov 2025 12:11:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Fri, 21 Nov 2025 12:11:22 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 06:11:19 -0600
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 21 Nov
 2025 06:11:19 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 21 Nov 2025 06:11:19 -0600
Received: from [172.24.235.208] (hkshenoy.dhcp.ti.com [172.24.235.208])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5ALCBCcL1246404;
 Fri, 21 Nov 2025 06:11:13 -0600
Message-ID: <56c4fcff-4f8c-4221-a390-77bc3837321a@ti.com>
Date: Fri, 21 Nov 2025 17:41:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 5/6] cadence: cdns-mhdp8546*: Change
 drm_connector from structure to pointer
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC: <Laurent.pinchart@ideasonboard.com>, <airlied@gmail.com>,
 <andrzej.hajda@intel.com>, <andy.yan@rock-chips.com>,
 <aradhya.bhatia@linux.dev>, <devarsht@ti.com>, <dianders@chromium.org>,
 <dri-devel@lists.freedesktop.org>, <javierm@redhat.com>,
 <jernej.skrabec@gmail.com>, <jonas@kwiboo.se>,
 <linux-kernel@vger.kernel.org>, <linux@treblig.org>,
 <luca.ceresoli@bootlin.com>, <lumag@kernel.org>, <lyude@redhat.com>,
 <maarten.lankhorst@linux.intel.com>, <mordan@ispras.ru>,
 <mripard@kernel.org>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <s-jain1@ti.com>, <simona@ffwll.ch>, <tzimmermann@suse.de>, <u-kumar1@ti.com>
References: <20251120121416.660781-1-h-shenoy@ti.com>
 <20251120121416.660781-6-h-shenoy@ti.com>
 <082379e2-2d00-4f2f-82dd-cff93d2867af@ideasonboard.com>
Content-Language: en-US
From: Harikrishna shenoy <h-shenoy@ti.com>
In-Reply-To: <082379e2-2d00-4f2f-82dd-cff93d2867af@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|BLAPR10MB4849:EE_
X-MS-Office365-Filtering-Correlation-Id: 26a2c678-968b-49a3-6fea-08de28f715da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cUhJdlp3NFFXMzBGYUxCczI3NUttWHdOeTZhei9jVlAyYmVDZlcvUzBlTkJ0?=
 =?utf-8?B?d1lQRG4vVVB4T3lMR05DaVpEUkM1YzhmRngyK0IzWkR0alFlNVdtb25hTm9E?=
 =?utf-8?B?TWoxVjhoSjBFdDRhWXRNV2RkQVdScnZXWk5OdU0zQlZURkVVWmRxMXllRTBP?=
 =?utf-8?B?Uk5hQWM0YnMzT3NaME9rNTBKSm1TeFd2VWl3cnE2VDV2dmVXVk9IMHRoNnNR?=
 =?utf-8?B?V29oSTlRR3dPanlJalR4ZFdJRk9scHVxRmJ4YWpnWmVoSCtPSG0xNE92SVRP?=
 =?utf-8?B?Nm1qZHhBV05oSjd5SEVDY2dDZ203ZG9rdUJIY2ZaQlRYYlU3KzFPK3VZaUt3?=
 =?utf-8?B?REc1b2JSNzVwcEtCd2ozQkZNOE9pa1MzZEZVUXMwS2c2SUVubTN1ZUNZT0hK?=
 =?utf-8?B?Z3NLQ0JOZUdGRk9CbEFUMkZRTWJ5RVJ5K0RIaTdKdzdhQ3RlTGpXTENWSmpB?=
 =?utf-8?B?TExSenBhVUlRM0p5YjRvWGw3N1VoMlZjZW9BK2M1bDQ4YWE1V05HQkt5eXBG?=
 =?utf-8?B?RWoremMrZFRPMTZmd0NjMjU0RG03WDVWV3pURHBrQkZjZWhieFgxRzVlbEJu?=
 =?utf-8?B?cG1EZitleVYxYW0ybnY5U0hJK0J3Y0RkWXdLOFFFS3BhOWpNL29NdklFZmpB?=
 =?utf-8?B?VTRrSHZPaVU4TXVLWVplV2gySTRjZytoNytuaElDcWJBMzE4RU1SN2ZKb002?=
 =?utf-8?B?OUxHNHBVWmtCUGNnRS9GVFhoSkJJVmNrUEgzb2I3RFVpeCtaNWo2UGhLTW5O?=
 =?utf-8?B?Z2oyUC9adTYxMHdLVmxqWTRXeDhKNndHRDVkVEJKbEc3Rko0RENkOHFrbVN1?=
 =?utf-8?B?d1kvN3BYbHUzOXFvMXdhS3NubUxQRnAxcnFTcHloL2xOdGUrOFd0cWhYb1BK?=
 =?utf-8?B?c3lnVG1nVTZlY0p2RnFTZjhwWFBOSDdjcjVYZDhpVzRNR3VMK3ZZRTlEb2JQ?=
 =?utf-8?B?TUd1WGdOSCtYcVdjRmVOeWxWWmFIM0p2R1hiUTBCNEZ1WU1OTHZkQXZVaEpW?=
 =?utf-8?B?dzdSUC9xTUc3aWhTVjdSUEF1TVdVNmVrQmNTK3BramRSUm5BRzhIbHJHbjE2?=
 =?utf-8?B?TG1vUW9WbUxyVVljSlh5NHdCUnh0MHNKL0FybmZGUXFRRnJJZGZUNk1KN3E0?=
 =?utf-8?B?SGZUOXplM0lqQXFwd3VlV2hQdFh5eXBrOGFSeUd3dFRocnBWMGtzSDFTdkp6?=
 =?utf-8?B?NDBYbHQ3VU90ZExqOTMzTXR0cDlYbklEZS9mb3hwS3RQWG9vNE5XZEpibllR?=
 =?utf-8?B?TGVMQ1dBM0V0cWp4WWp0aUFtQWVja0hacVh5bVR0dExqSDREYVlMOUZPb1Jj?=
 =?utf-8?B?em5Ib3dsR09RNjdOaERHZWZKVFB2dmFWYmxHTUlEOHorY1UzeHAyOXNRNXBn?=
 =?utf-8?B?cGgvczFGeFc4ZHgxRndYNk9uNTVYMEhpRDlocWE0d0FpeWUrcFJ6UWg4K0lk?=
 =?utf-8?B?cVdWdTV5d29ySzRIYkp6K1BJZlJLa25HUkRHb2FZdU9Xc0h0c3BBRUtpRm42?=
 =?utf-8?B?bUtZTFMvTEpmYUhLWjB6dVdjUE4rV0VmQVE4N3RDTUpGR1FpY2VHenB6Qytj?=
 =?utf-8?B?UEYrYkppaWc0OS8rdTJ4aHlPTENDVnhUL3dHL1hzQldJSWgyUXJaVlNuaWpF?=
 =?utf-8?B?anZRVWlsY2VaWlZvdEJKeGEySU1TNElyVDNiYTFuTlVMNnNnSXlTK0FzQlNl?=
 =?utf-8?B?bDFaL1c1eGJPMmRqYUlZRW54eXVkeHZwYzNsdVpCRGUvNE5Idk15SVNNOS90?=
 =?utf-8?B?V2JJNDQ1M1dIZmp3MlJXbVd6Y0E3c2lTSm0ycERSOG5DVEg5NGt4WnR6MjFO?=
 =?utf-8?B?TnhkN2Z6MTZnK0RXK2dUbnFxOUpFQUNpeVpoYzdJakNQMFEvU3F3R1hBOURC?=
 =?utf-8?B?VWlDMEZPei9lRGV5V2tRMkVJVFNVaGtGUFgzVXJWdk10ZzQrdVhuNXgrR3h0?=
 =?utf-8?B?ZVd1VUdoWVdBMHJOWFRqWkxSOUVuNnVMVXNzdVhpVVA1NW1wNHdibVVCalRy?=
 =?utf-8?B?cC9xL3RWZFhyZEYyUE0xMnZSc01ka1VCQnIyRDBvdVhUenNsK3N1VjdNaUcz?=
 =?utf-8?B?SlA4NkNZMFdhemxTL1ZEM3JndGlSRGlpQkRvQzJ0bWEycHJoRzdPZjB5VmJO?=
 =?utf-8?Q?PlNs=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet200.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 12:11:22.0661 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26a2c678-968b-49a3-6fea-08de28f715da
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.194];
 Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4849
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



On 21/11/25 17:32, Tomi Valkeinen wrote:
> Now the code looks fine, but you didn't update the description, which
> now looks to be quite wrong for this.

Hi Tomi,

mhdp->connector is still a structure before this commit and changed to 
pointer in this commit, we had introduced a extra connector pointer and 
variable for fix and kind of got renamed to 'connector' from 
'connector_ptr' and added checks in HDCP , will tweak the commit message 
describing these changes.

Thanks.

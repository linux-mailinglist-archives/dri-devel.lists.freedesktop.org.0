Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6242CA912
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 17:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037096E86B;
	Tue,  1 Dec 2020 16:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B8F6E5A4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 16:58:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h1hskbXzh8o0DddXLFMyanYxCUHs/znddrSXuqWiHHjgVtFQWnI58Y3gxClEpw0GJQgqHNS1jvHN4gnA1lcszgt547KUAjNRg99v69sSNMzjFB0addsowfBCa8NHUDuBBixkZijvDU3tQHLATpko0tR4jFwR3SqYacdiuO41c7qFYG4mEnWp6i3KAcNgIeb6wx0RPdQIzA05tekDUHUallUaQ1q5c/rbeb43KZPlIU2mlvzTDZQc2eLopXLTuDBTmWb5x0XmskT25AYPMMVj1HPQDHFSFH0zJAY6KEGOgTPWZOzQJU4vNKKLDCqbBPBXj9fVM2a6/2rHR64/BUktYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKyigziMvZf34VEI5jB0yC/KHXCmq2nwB0dxPkWyoqw=;
 b=I8F4mKkAQVmDP9nfT8Ynu994UDq7uYBKQyLgeLMv33fLsbo6RFYFoZRTSP55s+nI7zhrY3mFsPQs40OievehujHKoAhTRy1ZHVSURxCYh/OEciBsHbGxIYKOmjAyfrFd2IHud1I0bP+slGaVyYLhzbT5JuvYGPykJbvMirzhFtTCYplu5J78hOBAYz5+COOi7UZJ24y0WWnTkjkct6vxQuIGPeAG3SIat8HQ41trKBLkF9P/A2zocSUpM8LIN41pi6K3hWVTuADdTxLoM9iKrvfo9gQRT4V2LI1PVmG0zB2QQQqHxfSdYslcdAYL8jiyetyoBrnFTWdfZopd3rA2FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nKyigziMvZf34VEI5jB0yC/KHXCmq2nwB0dxPkWyoqw=;
 b=O2LMYvoCUXaQiAruic0Zb/J6veqNC8FxKyQRUFbeCsDKUaDQL5wsEnAHFo5RD72NU20jemSPcrgGYmMnQhZwIL/tGltHzhXNgf49F9cYFSTHhOUfSGP5f04+OrnD1ZH+qniSRAtATUAMQw6wOrgK9KyFmtSFUeAb9vkmJpDz+KU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4358.namprd12.prod.outlook.com (2603:10b6:208:24f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Tue, 1 Dec
 2020 16:58:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 16:58:24 +0000
To: Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Subject: Dim blowing up in my face
Message-ID: <3a1d46a8-cefe-cebb-2ab9-7bee1dea1d82@amd.com>
Date: Tue, 1 Dec 2020 17:58:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P192CA0025.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P192CA0025.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21b::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Tue, 1 Dec 2020 16:58:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d56f86e3-08e5-4adb-6bf7-08d8961a50d6
X-MS-TrafficTypeDiagnostic: MN2PR12MB4358:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4358900511A8FB16C00E13FC83F40@MN2PR12MB4358.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iJMYoPFBwmq5yh3icO16TDzlejeKNRLn8iptTx9sbfI7owaMbbU3+IqibDOOpqyF8j3mDQWnyG4WLViRcdGyipCGtlQHVCDdQXKASd4wqnHS3tSrKevHhPB2wqKlbfB/BB4ILNspqmcnYdqDVrAXxXCJXBFA0NCg7vP6OUprTE98B1d5GP2nMvGAOpfU05iRyRD8VFTMC9EAfCef+nmJHrqWfUTGmrh0pppt7vsEKLZ5YPXDrHGo9gdG0l7EdfKWid09K9B6DjOGkobGH2NH6yJZfC1+fclezf0RjlWuC2IUr1C95543Djj3AZBLKtQthGt7mYNNY2/T98OQR83lys0JvPQXQ+fI0z7cE1gNK1OjwUJijca1n9a6+X7XhcS4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(86362001)(5660300002)(2906002)(66946007)(66556008)(6486002)(478600001)(316002)(8936002)(66476007)(52116002)(31696002)(8676002)(110136005)(186003)(2616005)(16526019)(31686004)(36756003)(558084003)(6666004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eUdVMk95V1VqcWhNSjJMWW9GbHdrNWRoY0FJWit3SWdsb2ZIMVQwbWJXZWxq?=
 =?utf-8?B?Q0xUNjlzVi9rU2RnNWlGSmt3UUt1bFp3WG1GQTBJck40Y0VFc2VNZmxmaTZr?=
 =?utf-8?B?ZnRjYUI3ZXlrN2NvYkxpdTBWZU1WL003bG9HNTJaZmJaTzdJQitSRDE0Nk5v?=
 =?utf-8?B?aHJocUhSc0VTZkdPdmlUOE41Qmh5ZEFITEJCY0F5d0RudVZ3VWFJMWpMdldu?=
 =?utf-8?B?VGFLcU0rWjIyWkRZZUZlcWpwMWhuMzRrK0NsRm1wRVlTM3ltWk1pVVFLbFcr?=
 =?utf-8?B?TWY1T0p0MEhEdVl1aXJJaXhYaUx3Y0NaR2ZxZ2luRG04bUpTcitrNXlKZnQz?=
 =?utf-8?B?WVhhNDhZTGhuYmFIQ0oxT1lOU2dwSHZnTnQycFBtbDlvOHZYRHFSaXgrQURK?=
 =?utf-8?B?MC9mUWpIRXg5Ly9XMnZuMHFrbk85QjcrRmxCaG1seGYxWXNMdjVXOU9UVyta?=
 =?utf-8?B?TzhzUXNsUmp4d3AzMGMzZFpWa0lHekR6bjRscVRpcEVxSUIvL1E0OFdvS0E3?=
 =?utf-8?B?UGJWdlBDWE9FWEtodWZxSW4xUUFIWGdNUmhvSis3RThoRGJySWd6QWJqYUIz?=
 =?utf-8?B?L05DSmtOS1hrTXdVemdnZlBLSitDRXAxdi9FNUFUQWRET2tBOWVCZ3JibkFq?=
 =?utf-8?B?YnhsYkhHRGNGRWRCaGlsdXJqVnhOdHN3S2NxVmg3WU9rL1ZjTlVWblFpTTV1?=
 =?utf-8?B?b29hSndaM25Fd29HeFlqa0pwUTA0VVk3bGFTWmtDclpXY1doL1liMFpNU2Iy?=
 =?utf-8?B?Sm5pbUs3NTB5YWhSVEh4SGRoSnB6dTRpbXZxQ3RsRnVzR200L21XUjNOK0lP?=
 =?utf-8?B?OFFaMzhFYnFWOXBCM210U0h0VmtrN0xFVGg5eHBkRmRYdi9lbmlwaGZnbEk5?=
 =?utf-8?B?ejEwb0dmekQ2bnl3Y0FMcjJpUFo3NmVTMTFraDdqNExMdGl3eVhQN1Z4L0NM?=
 =?utf-8?B?SWlvdGZNUkk4U245QTdSdWlhdVVZVkpTVWNIakZmNDlkbTJxRVV2NU9wcDJn?=
 =?utf-8?B?QSszU3FRTzMxSjVUais3cnFSQ3JTS2ptN25DcCs4VEpTUHkxVjNyUWNJWXBH?=
 =?utf-8?B?T3pZREk3eEppZlgzbGpqSFBnQkl5OTBNVUZuSGNJb0t4eUU5SDNHeEk2b1ZB?=
 =?utf-8?B?a2oxN201YkI1K01kUm9jMzVWQVVyamVCbjIwU3c1dEZ0UklCei9PdU1PN0pK?=
 =?utf-8?B?RWhDRTFIaCtqeiswRXBXeVJKdlVXSkNhanhXS01tN09Qd0IxRmk3aWg0WGJp?=
 =?utf-8?B?aW5DUjdDaVV2d0FlcnhQdDI4bHBJek00SGUzZ2h6UGhuTm53QzhhWWUxaFRN?=
 =?utf-8?B?MmwxVHhoZW9mcUVYZXpyRzhjczhXdG5tQndzam5xOXlSS2pHeWM4blZKTFJI?=
 =?utf-8?B?T3pQNHdaQ0lDSy9TWkFKd0E0TDRXRnBXZ2RzYzRITnp6ZjdxK3BMM2x5U2V2?=
 =?utf-8?Q?fauxoSTL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d56f86e3-08e5-4adb-6bf7-08d8961a50d6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2020 16:58:24.5449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2OX9z9i7Vas9tciDUiaXYZ4qNQ/XK6RojrMl0z5/Wtk+qGmdny9VSkC70DOhiOc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4358
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

I've just pushed a minor TTM cleanup and dim is complaining that 
drm-intel/drm-intel-gt-next merge into drm-tip failed.

Investigating that looks like something completely unrelated and I don't 
know the Intel code well enough to fix it myself.

How to we proceed?

Thanks,
Christian.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

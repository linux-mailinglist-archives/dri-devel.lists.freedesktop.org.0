Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9C22CE660
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 04:18:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450646E13C;
	Fri,  4 Dec 2020 03:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2082.outbound.protection.outlook.com [40.107.100.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA0DB6E11E;
 Fri,  4 Dec 2020 03:17:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nBSNoToOcihqccHj+9HW/vZC8pZ5CXgLsx4AGRzso4Qq9Om9Fm6LNRKbT0zIyintkiXQXgHe51g5GgIjM1vPdrfWoQwH2UejHcTt76t42D7ZAFJkpHouYSvHJ9ldjzPJPJKP6YAS2fy7X9xMbqIGn/KH5Y7fwq/RLnpgRVBP2Wvp69ww/N6iStlsJAf+O0OMJxFCWMDO21eg1ajKQ3rvAyHcKEpgbwKHh4RAqEHQB6u+Octa/8c3DeGmyURxh6iPi+X45GsD1bnFB2d9gM/eSlifeDq+tZprtclUtzrbr+XXg05yMLx1MNxO9LLjEexZHB4qs/Pm2EwE7cGYhDKONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppAQKMcsLOS80Go0S+lNgD6fQjcf2iDHMLKzQOeFxJ0=;
 b=iyPEWTN11LtRJJhYJd2InfLSBoMiiVOl0YAUGlQikEp6yhxZRLW4T03vi8fRy3a+hUl/v1GovY7FBDx2+39WKMPY8AhUfpuLUT/xfdMzdo5Suuwbk9GXHov8xTQ3ktGIOWK64Y82IIswk5y/5WPmKD32rPG45aA6f3lcQYnPmyXytgv6u7kDhYEVh2sgY35m1LPU9ujJUW76D8Ck5EdtapcMFrvk6jmdFPlYmo7wRo5tgGrEkwBpkx9qC/v0e4QbwJBbHOZtYalkhfAj+W1ubhAWfZlvZVPY+jPC1b+vKZ6Cng6ed6r+czwKVrzR00v23RD84ETkTxq43fspHUHkPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppAQKMcsLOS80Go0S+lNgD6fQjcf2iDHMLKzQOeFxJ0=;
 b=t9ItXb2kNwX5x445rXVivRmQBwpB7n2szpoMuDtogkHrqSKLUmFQSBXMn6GYA1wqJXid+/iscoLkixVqSdouqQuLhJF/e/TuU6Zwy3Eg98VjrT4RhIF9xoJCED8Ajk1YvKKDn7ym7HJ5Mm+3U2ZjGmPn4vgZ8hgyA9slQs4OeKc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4043.namprd12.prod.outlook.com (2603:10b6:5:216::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 4 Dec
 2020 03:17:37 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::d055:19dc:5b0f:ed56%6]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 03:17:36 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] Allow to extend the timeout without jobs disappearing (v2)
Date: Thu,  3 Dec 2020 22:17:17 -0500
Message-Id: <20201204031722.24040-1-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.29.2.404.ge67fbf927d
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: CH2PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:610:4e::36) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 CH2PR02CA0026.namprd02.prod.outlook.com (2603:10b6:610:4e::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Fri, 4 Dec 2020 03:17:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 394715a4-9dc8-44db-be99-08d898032645
X-MS-TrafficTypeDiagnostic: DM6PR12MB4043:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4043A06FAC44ADA73CDD843C99F10@DM6PR12MB4043.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gzMcNBBUXbA3e5oxKdql08w+EsQd2yr9RGNtkchBXgGBNuRnfh/KfjmZCc74CNKMQn8Yd5slixgYSVv/a/ODAixZjdRYqSuZLnv7R96RJVNya0hSpjeOq4Tiu4Z9xK7GcOb9QPr0pJti0pRVd5+J/ZIcqRSDElgO8xwC5WTfBylpq/9hag4Yny21O3xLjfTshAGY7MzAOeMNYrudNbS22SKYz71qdHSNb11NEf4r1ToBS53wi8nowDA9gXc9EAE7+KRaINDtC7+vpzIiuZPhX14l/+T36Ujny/tJU/xACkSc1PyqOI1CmtKyw+++4CEI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(366004)(346002)(136003)(396003)(16526019)(5660300002)(66946007)(956004)(1076003)(6486002)(2906002)(66556008)(66476007)(4326008)(6666004)(2616005)(83380400001)(186003)(36756003)(8676002)(86362001)(8936002)(26005)(44832011)(54906003)(7696005)(66574015)(52116002)(478600001)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cENrcit3dWs4K1d2OWtiWnNELzk0L29BT0Jnc2xnTU44Q25ZL1IyT0MwS3Y3?=
 =?utf-8?B?TVMzOVJ5a2k4QjJwMXc0ZStiS3hoVjRNbVI3YlVqTEhJL2JpNWNlaHJuTzRD?=
 =?utf-8?B?VHlvUTN5cjZNN2tYRUs5UDJaUUE2Q3BjNEZPZnpTN3RxWTBONmpjWFM3OHk4?=
 =?utf-8?B?VnUxUmp6bFdaZjdKSVAxemRiTTNOU2RCSzRLRW00ZktPaElpTVBUWUtVaFN1?=
 =?utf-8?B?U2p5KzNFVEVJM1E0YXVwdHRWaUdObzlLZXFERjFKKzNodk1aZXZIVXJpL2FM?=
 =?utf-8?B?c0RZUGxOdm5jditHVWwrcGRoTCsvZDlDZ2tMNWloNEhXRnlQNk9ScmVqY1RN?=
 =?utf-8?B?a3JzUWJka1BlUG9YbStQbnJGWVkya3BpcHpQSzhLYm1tTGFya0JBYzhrTHJY?=
 =?utf-8?B?aVErVHVRanZyV3YzRWtlUGZYNWZIbW15eVJFTWxYTHJTVm81TnZXQk9maFJT?=
 =?utf-8?B?V3NSM05nVXF0UXRlS1RQSFFhQjFnVCs2Ujc0azZvSFF3UldwUDhlMEViMWQw?=
 =?utf-8?B?Nys4dWJybGtsODQrNEtTVXd3bFhtL0ttOTl3MGhCNTBiVndWbnBDVCtXeXZ2?=
 =?utf-8?B?Z0h6RzBqZ1poUzZrT3ZJbXA1NjhVbnFKSjk5SkdmRVZ0Ni9hRzQrRXFNcURP?=
 =?utf-8?B?aXlTMkVpRlh1UldySndCeTk1MmtNZnh5WU1qYnRGR2JjZm92cktEazNSQTJM?=
 =?utf-8?B?YjJ3SzN0UnVHK2VsUGlCeHV3Q0xWZnBvWS9jM0tVV1MxTXg0by9oWHRUU1Fw?=
 =?utf-8?B?TUxwMUU3OTcwZ3N6blRNbVN2VGtsM01KbFUvVGkzdjhMcUoxNnJrKzVNeEM5?=
 =?utf-8?B?RXZVTERPeHNLZFRZZzJaZjExeklTMmtkMFQ2YVZrbGptc1ljOEw3cENua2Fj?=
 =?utf-8?B?VmJsWWx2UitVd0pYOC9MdTR1ZWpDOE1weU41cTl4S3FYSXp4S2JrTVpMWlM4?=
 =?utf-8?B?dmcvZTVEYmJUYkVoZkthbmI4NVAveWJVZHV3R0krMzFPRVNmaTJlYjVhdURq?=
 =?utf-8?B?dWNhU20rR0N2eGs3eDlESjVCanN3VHM3WGswOUpSOHlEVUYzZHVzVWoxOG1C?=
 =?utf-8?B?YWxjNW5XaDlmek5zRGpGK0hkcDBCdXo2eVZBZFN5cThNakpLL1ZzNTA4b0Mr?=
 =?utf-8?B?QjEveTB4V29iZUFBQWlJZEFYcjNRMjB5TXhCelF3SUw3dkMraFJKV0tRL2FO?=
 =?utf-8?B?OGdsMWdEYW0yVWhvcWIrMFYrdGZkZnVqR3padmJ0VVJMUnBqLzJvTDFxaUcr?=
 =?utf-8?B?aTRPcGx0L2FVTkVUS3paT2VuQVdrT2p1SW5KZE9TaVNneDNuWEZ0L0dBWHlI?=
 =?utf-8?Q?hphP4NwvhwBjhbZ2BPC0whUcP5FpT5Ep3k?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 394715a4-9dc8-44db-be99-08d898032645
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 03:17:36.8893 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6VfvkBLKV6oET7I72jYN7yot/B60HjciSkvnzIEcGI2RGuMVnHzt5RHZw9mv+aUJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4043
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgZ3V5cywKClRoaXMgc2VyaWVzIG9mIHBhdGNoZXMgaW1wbGVtZW50cyBhIHBlbmRpbmcgbGlz
dCBmb3IKam9icyB3aGljaCBhcmUgaW4gdGhlIGhhcmR3YXJlLCBhbmQgYSBkb25lIGxpc3QgZm9y
CnRhc2tzIHdoaWNoIGFyZSBkb25lIGFuZCBuZWVkIHRvIGJlIGZyZWVkLgoKQXMgdGFza3MgY29t
cGxldGUgYW5kIGNhbGwgdGhlaXIgRFJNIGNhbGxiYWNrLCB0aGVpcgpmZW5jZXMgYXJlIHNpZ25h
bGxlZCBhbmQgdGFza3MgYXJlIGFkZGVkIHRvIHRoZSBkb25lCmxpc3QgYW5kIHRoZSBtYWluIHNj
aGVkdWxlciB0aHJlYWQgd29rZW4gdXAuIFRoZSBtYWluCnNjaGVkdWxlciB0aHJlYWQgdGhlbiBm
cmVlcyB0aGVtIHVwLgoKV2hlbiBhIHRhc2sgdGltZXMgb3V0LCB0aGUgdGltZW91dCBmdW5jdGlv
biBwcm90b3R5cGUKbm93IHJldHVybnMgYSB2YWx1ZSBiYWNrIHRvIERSTS4gVGhlIHJlYXNvbiBm
b3IgdGhpcyBpcwp0aGF0IHRoZSBHUFUgZHJpdmVyIGhhcyBpbnRpbWF0ZSBrbm93bGVkZ2Ugb2Yg
dGhlCmhhcmR3YXJlIGFuZCBjYW4gcGFzcyBiYWNrIGluZm9ybWF0aW9uIHRvIERSTSBvbiB3aGF0
CnRvIGRvLiBXaGV0aGVyIHRvIGF0dGVtcHQgdG8gYWJvcnQgdGhlIHRhc2sgKGJ5IHNheQpjYWxs
aW5nIGEgZHJpdmVyIGFib3J0IGZ1bmN0aW9uLCBldGMuLCBhcyB0aGUKaW1wbGVtZW50YXRpb24g
ZGljdGF0ZXMpLCBvciB3aGV0aGVyIHRoZSB0YXNrIG5lZWRzCm1vcmUgdGltZS4gTm90ZSB0aGF0
IHRoZSB0YXNrIGlzIG5vdCBtb3ZlZCBhd2F5IGZyb20KdGhlIHBlbmRpbmcgbGlzdCwgdW5sZXNz
IGl0IGlzIG5vIGxvbmdlciBpbiB0aGUgR1BVLgooVGhlIHBlbmRpbmcgbGlzdCBob2xkcyB0YXNr
cyB3aGljaCBhcmUgcGVuZGluZyBmcm9tCkRSTSdzIHBvaW50IG9mIHZpZXcsIGkuZS4gdGhlIEdQ
VSBoYXMgY29udHJvbCBvdmVyCnRoZW0tLXRoYXQgY291bGQgYmUgdGhpbmdzIGxpa2UgRE1BIGlz
IGFjdGl2ZSwgQ1UncyBhcmUKYWN0aXZlLCBmb3IgdGhlIHRhc2ssIGV0Yy4pCgpUaGUgaWRlYSBy
ZWFsbHkgaXMgdGhhdCB3aGF0IERSTSB3YW50cyB0byBrbm93IGlzCndoZXRoZXIgdGhlIHRhc2sg
aXMgaW4gdGhlIEdQVSBvciBub3QuIFNvIG5vdwpkcm1fc2NoZWRfYmFja2VuZF9vcHM6OnRpbWVk
b3V0X2pvYigpIHJldHVybnMKRFJNX1RBU0tfU1RBVFVTX0NPTVBMRVRFIGlmIHRoZSB0YXNrIGlz
IG5vIGxvbmdlciB3aXRoCnRoZSBHUFUsIG9yIERSTV9UQVNLX1NUQVRVU19BTElWRSBpZiB0aGUg
dGFzayBuZWVkcwptb3JlIHRpbWUuCgpUaGlzIHNlcmllcyBhcHBsaWVzIHRvIGRybS1taXNjLW5l
eHQgYXQgMGEyNjBlNzMxZDZjLgoKVGVzdGVkIGFuZCB3b3JrcywgYnV0IEkgZ2V0IGEgbG90IG9m
CldBUk5fT04oYm8tPnBpbl9jb3VudCkpIGZyb20gdHRtX2JvX3JlbGVhc2UoKQpmb3IgdGhlIFZD
TiByaW5nIG9mIGFtZGdwdS4KCkNjOiBBbGV4YW5kZXIgRGV1Y2hlciA8QWxleGFuZGVyLkRldWNo
ZXJAYW1kLmNvbT4KQ2M6IEFuZHJleSBHcm9kem92c2t5IDxBbmRyZXkuR3JvZHpvdnNreUBhbWQu
Y29tPgpDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCkx1YmVuIFR1aWtvdiAoNSk6
CiAgZHJtL3NjaGVkdWxlcjogIm5vZGUiIC0tPiAibGlzdCIKICBncHUvZHJtOiByaW5nX21pcnJv
cl9saXN0IC0tPiBwZW5kaW5nX2xpc3QKICBkcm0vc2NoZWR1bGVyOiBFc3NlbnRpYWxpemUgdGhl
IGpvYiBkb25lIGNhbGxiYWNrCiAgZHJtL3NjaGVkdWxlcjogSm9iIHRpbWVvdXQgaGFuZGxlciBy
ZXR1cm5zIHN0YXR1cyAodjIpCiAgZHJtL3NjaGVkOiBNYWtlIHVzZSBvZiBhICJkb25lIiBsaXN0
ICh2MikKCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jIHwgICA2
ICstCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMgIHwgICA0ICst
CiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfam9iLmMgICAgIHwgICA4ICstCiBk
cml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X3NjaGVkLmMgICAgIHwgIDEwICstCiBkcml2
ZXJzL2dwdS9kcm0vbGltYS9saW1hX3NjaGVkLmMgICAgICAgICAgIHwgICA0ICstCiBkcml2ZXJz
L2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgICAgIHwgICA5ICstCiBkcml2ZXJzL2dw
dS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyAgICAgIHwgMzQ1ICsrKysrKysrKysrLS0tLS0t
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdjNkL3YzZF9zY2hlZC5jICAgICAgICAgICAgIHwgIDMyICst
CiBpbmNsdWRlL2RybS9ncHVfc2NoZWR1bGVyLmggICAgICAgICAgICAgICAgIHwgIDM4ICsrLQog
OSBmaWxlcyBjaGFuZ2VkLCAyNTUgaW5zZXJ0aW9ucygrKSwgMjAxIGRlbGV0aW9ucygtKQoKLS0g
CjIuMjkuMi40MDQuZ2U2N2ZiZjkyN2QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2AE3587EC
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 17:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34ED36EB2D;
	Thu,  8 Apr 2021 15:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2054.outbound.protection.outlook.com [40.107.95.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9BA6EB2C;
 Thu,  8 Apr 2021 15:11:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kw9CW8xmO9ufrFG+wE65ThY20+0To885yzMoqumDHzuErXNIV8qYid6BsIYXYa0b5a57tcApxStnmQX1aS9iP7pZ5Iw7sHeZ/ry+M6Crc7TgLIwcOSyLzq1eFz/zSeipHI575oXGBGMnwtmP8z6EJEIeecnnC4h4AcI62t+GpnSDkBOZHsmhoVoOBPMiYA9kBJNKCuudSSbaMre6+q+8+cwfuRJEAzTGAT0TVtLlykgwalmhsyEl0BvWitdkvC7hf0PqNmCnc87MDnkWjyrzQKTp0Mzoxdg+iZVzJ4+/cGdSgfNi0tzETB/vcL/+aKPORflkyKDeR+o3DxW+tYez/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEDudmDxznwu/QS3+gTMAekKjDVqgV0dxthgvD4/eks=;
 b=G5GhdTccH8w0zq1NBIaL8gw4n4Kdt0pGpQXS0HTTic/fmcuY8MaQDFKdfIl3nd1g8HA4siecibYC/yxwkKrGQB4rniU4nmsOWDSqlHjucl+FytQhbDRe8U9C7ZqzotzcP9FXZsZB4iHQd0bgABuHpNnA9NE4PgSNaPmbbuUezIT1QrP4EkTLVmQGQ/0LWixaKrvAdEmDJb6fF+Z8kF9gZg6r0XUTDuWjFvGy5zjSHptS2ekSD9U+KrqH5bP007T09nZvAGIlDIcrXiI3GtNB909cevZzU9Sr39N75aKBVMhikEyfrSLluhbm7V/UUN0hAkyXtIzoK67Br9QXRTU2xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oEDudmDxznwu/QS3+gTMAekKjDVqgV0dxthgvD4/eks=;
 b=TiHN3p35zRFYkIsY1AlIlV36KYD6n21fwwBpG848YG24jjFSCTjq10DzrhGVZLsE1msEeienzQkUydZhxrMsJYJgSR5FK4c56vtWOVlTCPtvKJbcWIlTNVO/1Te0wz2zXWypqRF4lTUK90Z+9WXFtJahQS502ECfGyd6VFwdsSU=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4111.namprd12.prod.outlook.com (2603:10b6:208:1de::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Thu, 8 Apr
 2021 15:10:59 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 8 Apr 2021
 15:10:59 +0000
Subject: Re: [PATCH 00/34] Add HMM-based SVM memory manager to KFD v4
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
 <20210408150212.GC227011@ziepe.ca>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <02f4f577-61bf-033d-d396-5947a6e28457@amd.com>
Date: Thu, 8 Apr 2021 11:10:56 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210408150212.GC227011@ziepe.ca>
Content-Language: en-US
X-Originating-IP: [142.116.84.209]
X-ClientProxiedBy: YTOPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::18) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.84.209) by
 YTOPR0101CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32 via Frontend
 Transport; Thu, 8 Apr 2021 15:10:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4bb04880-9fc0-4bcb-30ec-08d8faa08401
X-MS-TrafficTypeDiagnostic: MN2PR12MB4111:
X-Microsoft-Antispam-PRVS: <MN2PR12MB41119CBD7BB8551421A4748C92749@MN2PR12MB4111.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B9QFKBQ702BvJ/oHA5OkaLTJ+VhiZjDqtJWdh00dz+7gWplB+90OWb7HGEAqJXrkD7M7ExQISz10jqY35yhOUGu/NkymqrrcczkUtU3l+qGDwk8KmfIKMHhb3BH7H5XQ+My4OFVd86iKHWpQamjWFsVIoDReQ+lPN4CGoUQrBXMjoh9UPY9OAiCLzo2ClCIpjhmJOK2fUzC1rJnUKfW6Kvsjqyd/YZlTYi9ZygVr5amS2XbS7PtljNa3bJiSCL9SUYe2U5irG5Us+DbbS5uLgmwGZzLmQRcm06CLPR1d18FDIsiXyFotT6ka39PXViO3w56qxlrIvq+cIZ4qaIlC5VQ6DQYbw9i7My66sQ95dPseaGuVyu0XORukQCWYd45Yn2taqbXkfPaWLRKT3Hf4YrllkRxJZxwihEClK1j5vlvnth9PtalIHgSYqwWzavRNJD9BikV/ogYO4IHBOUm6PtV2t3namXIsiW2m59Y+JNl/WN/RIbVUwMTrwEedpvIwF16hzpdpb3pxU06wsnaNbLJ6My8Xijp2VB9QhV6lbno8eEyFouyNS3JfjhYVPZZh7eYbDEMxchU2lDK1gUm9Za3Hdl5C52pTyepnpYUH26dtF/GCTN1TKIcKv9y8tfIPGokQTXzJX64VbJlJg/xonnop9bBObg/RhoUbGHe87mf0sPJ8MkfZ/WYimODcl3jlGntv+6vUadsTLBHwqhUqnF5ni5DUw85LEIdTJ2bABmJysOLzeYL+u2q0dAJ0faR86B9MGwcabdCbIDFOENRZz4AmcjWo62AZssh+E9ZxD5E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(366004)(396003)(346002)(39860400002)(36756003)(31686004)(66946007)(66556008)(16526019)(956004)(966005)(86362001)(478600001)(186003)(2906002)(31696002)(66476007)(26005)(66574015)(44832011)(4326008)(83380400001)(5660300002)(316002)(8936002)(8676002)(6486002)(2616005)(16576012)(38100700001)(6916009)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?YlVDaDFRN0VuZUpwcnFDSzcveFZTTTFQSmZqUmh0OVNock9rNmgxSDgvc1ZM?=
 =?utf-8?B?Zm1nWkhkem1CakhkM3lKcmIxTUpnak1vUEFVNUVudWh5M0RsRUl3bFFOTXZO?=
 =?utf-8?B?ODhTNk5EcFROaDdhQU9sS0JCTnFvbVo0REhEZ0QrOTQ0SGhRUHArUThXRWVs?=
 =?utf-8?B?WGJ2dk9Jc3plcVVtUFlJNmxoUnJaK01US3p0NXJsRVhLeVZ3RGd3YlFsNTZy?=
 =?utf-8?B?QUEvUHhPTlBaT203QzFOaXh0cGoxY1BhejR5R1RUVk9yOGY1cEEwVUNBdkQr?=
 =?utf-8?B?bEd3LzBKYkhuWHd1ZllDSUp4ZzhwZmNVczF0OXVuaXZHNmJSM0F2bXZZcDYv?=
 =?utf-8?B?bFlQTFJuai83U3hIM1dMRlhXTjBRNUdQOUhWQUw3TEliYkxvMEd0N2xmRThP?=
 =?utf-8?B?cWtlL0NkZlBQTkpGd0JFaWVkL0F0MG1XalFsM1FCemNQSVdYYWpYQkhyMnRP?=
 =?utf-8?B?WnRFS09ldTNWZ3ZMMDl6UGpicHRCOXZpamNTV29DeS9yUi9iSTlYR0FBUU9n?=
 =?utf-8?B?WEdQYWNPMzY4bG9DV045WjVJWGZHd085dEgwR0VNWGcyZWVXRFVHbEtyYUtr?=
 =?utf-8?B?NHFkRzJmM2RSYUZadEtNWEwxdXNUWDNvWEJDS2hCeFRLU3pSV1A0MENDYVQ0?=
 =?utf-8?B?dDFxRUNCZUFRbjhEd2ppK2pycnRMTm1YcGN3T1Q3aFpTZVdLZERDWTFWMnFE?=
 =?utf-8?B?UWlWQ084VWJEVnU4elgzRkdHQ0pRdEVWZmxmQUs0MTZha01vTXUrMDczdG1U?=
 =?utf-8?B?Rk8zTEVOVU1NS3NudlArNDlxRjZhMGkzcHovQ2xzRGYza3V2TFRVQmNSNVN5?=
 =?utf-8?B?d0gzbVBUTlV4QkhocisvMXRweUJRMmRkblNuMSsxTXJZRFRJdUp4UUxGMXNo?=
 =?utf-8?B?akU2cC9mYThOVjNKWUdPWXIvSDU4cnJ3OHpDVlBYYm95eUVFQXdQRXhJSmhn?=
 =?utf-8?B?UkhkdTVmMHp5M2Roa1NTdzhDOVUzeVErczdHc1U5cTdkak1EeThIS0lVZFRY?=
 =?utf-8?B?Z0tMNmFFRHRLWklyME5yZVRKR05XMGk0aitWYnBNZE9tbGJLQnppd0lUYmlC?=
 =?utf-8?B?RmtadkpwRFM5bUJ5Z2NvRkRJeVhJVTluekh4QW9vUkMxWFdKUVlZOXJwc2ZL?=
 =?utf-8?B?K01Ld3dyM1ExUlVTTGMxb0FxcFpGMWxnYVdyTlplWFN6bjROWnBIc2N1ZkEz?=
 =?utf-8?B?dEtKSXhHYW85ZUVZMFRKOUJOWEFFS1BScTB5d0d1ejExTTNvallnUVhSdE9D?=
 =?utf-8?B?dlFVd0pYYUJ1R2VreE1OeG85OVhVSWhGS2taT1JzbUlsLzJsRWM4RFFnRndI?=
 =?utf-8?B?bVBQZ3pXTW1lczBYM1RLdElaTSt3aHkrSDhzYlJsRCtTSEhRWnNyQ0VzOGQ0?=
 =?utf-8?B?WHgxVmliWFI0eTNaRk5ta1NOM1hybXZBdkN3bGs0N21mS3pCRDZXVlk0YmQr?=
 =?utf-8?B?Q3YwaC92dnE5UUVYNm4yb2w3MDJPVW12UUxUTmhpdEZIOE1Ha3ZIUmpKeFZ0?=
 =?utf-8?B?MmpNamhXeEszcVRtQ0V1cEJwNXBYdi9VUUs5Yzh1M2EvRlRaczdnaUY3MzRJ?=
 =?utf-8?B?MmRySkpaOW85cUhxc3VIOFpja0dNWjFBc09CMHZUMnRPSjl0aThscHdCbmZ4?=
 =?utf-8?B?eXVhTEhZWnhHeVZRMElMRlFscWkzeTZydTRkYVBrSndqMkRXb3hHTnVtUS8z?=
 =?utf-8?B?TUxqMGczNTY2UHFhMnNUdUQzam00MWlKUlBxaFcrWUFTWTZDaVVpV01DejNM?=
 =?utf-8?Q?wx6NzPvv+iYwdCW9NjY+QORiZyS8XeiOYrJ/8rR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb04880-9fc0-4bcb-30ec-08d8faa08401
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2021 15:10:59.0830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CCOyukS+NuTptC6/nGXE1KbPMx9/tmvteKzQ3Y8DVbIJ2nLe0fwyta0TdHHuRwEYLuO+bNJRYDmDGOc1zRE2hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4111
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
Cc: =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNC0wOCB1bSAxMTowMiBhLm0uIHNjaHJpZWIgSmFzb24gR3VudGhvcnBlOgo+IE9u
IE1vbiwgQXByIDA1LCAyMDIxIGF0IDA5OjQ1OjU1UE0gLTA0MDAsIEZlbGl4IEt1ZWhsaW5nIHdy
b3RlOgo+PiBSZWJhc2VkIG9uIHVwc3RyZWFtLiBEcm9wcGVkIGFscmVhZHkgdXBzdHJlYW0gcGF0
Y2gKPj4gImRybS9hbWRncHU6IHJlc2VydmUgZmVuY2Ugc2xvdCB0byB1cGRhdGUgcGFnZSB0YWJs
ZSIuCj4+Cj4+IEFkZGVkIG1vcmUgZml4ZXM6Cj4+IC0gRml4ZWQga2VybmVsIHRlc3Qgcm9ib3Qg
d2FybmluZ3MgYWJvdXQgc3RhdGljIGZ1bmN0aW9ucwo+PiAtIEZpeGVkIGEga2VybmVsIHRlc3Qg
cm9ib3Qgd2FybmluZyBhYm91dCBhbiB1bnVzZWQgdmFyaWFibGUKPj4gLSBGaXhlZCBhIGtlcm5l
bCB0ZXN0IHJvYm90IHdhcm5pbmcgYWJvdXQgc2VsZWN0IERFVklDRV9QUklWQVRFLgo+PiAgIFVz
aW5nICJkZXBlbmRzIG9uIiBub3cuIChzZWUgcGF0Y2ggMzQpCj4+IC0gUHJvcG9ydGlvbmFsbHkg
bG9uZ2VyIHRpbWVvdXQgZm9yIGhtbV9yYW5nZV9mYXVsdCBvbiBsYXJnZSBhZGRyZXNzIHJhbmdl
cwo+PiAgIChzZWUgcGF0Y2ggNikKPj4gLSBGaXhlZCBQVEUgZmxhZ3MgZm9yIFhHTUkgbWFwcGlu
Z3Mgb24gQXJjdHVydXMgYW5kIEFsZGViYXJhbiAoc2VlIHBhdGNoIDE3KQo+PiAtIEZpeGVkIHJh
bmdlLWxpc3QgY2xlYW51cCBvbiBwcm9jZXNzIHRlcm1pbmF0aW9uIHRvIGF2b2lkIEJVR3MgZnJv
bSBkYW5nbGluZwo+PiAgIGludGVydmFsIG5vdGlmaWVycyAoc2VlIHBhdGNoIDE2KQo+PiAtIEZp
eGVkIFNWTSByYW5nZSBsb2NraW5nIGFuZCBpbnRlcnZhbCBub3RpZmllciBzZXF1ZW5jZSB1cGRh
dGUKPj4gICAoc2VlIHBhdGNoIDggYW5kIHJlbGF0ZWQgdHdlYWtzIGluIHBhdGNoZXMgMTAsIDEx
LCAyMSkKPj4KPj4gQWRkZWQgbXkgUmV2aWV3ZWQtYnkgdG8gYWxsIHBhdGNoZXMgcHJpbWFyaWx5
IGF1dGhvcmVkIGJ5IFBoaWxpcCBhbmQgQWxleC4KPj4gSSBiZWxpZXZlIHRoaXMgcGF0Y2ggc2Vy
aWVzIGlzIG5lYXJseSByZWFkeSB0byBnby4KPj4KPj4gVGhpcyBzZXJpZXMgYW5kIHRoZSBjb3Jy
ZXNwb25kaW5nIFJPQ20gVGh1bmsgYW5kIEtGRFRlc3QgY2hhbmdlcyBhcmUgYWxzbwo+PiBhdmFp
bGFibGUgb24gZ2l0dWIgYW5kIHBhdGNod29yay4KPj4KPj4gTGluazogaHR0cHM6Ly9naXRodWIu
Y29tL1JhZGVvbk9wZW5Db21wdXRlL1JPQ0stS2VybmVsLURyaXZlci90cmVlL2Z4a2FtZC9obW0t
d2lwCj4+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9SYWRlb25PcGVuQ29tcHV0ZS9ST0NULVRo
dW5rLUludGVyZmFjZS90cmVlL2Z4a2FtZC9obW0td2lwCj4+IExpbms6IGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODU1NjMvCj4+IENDOiBKw6lyw7RtZSBHbGlzc2Ug
PGpnbGlzc2VAcmVkaGF0LmNvbT4KPj4gQ0M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNh
Pgo+IFRoaXMgc2VyaWVzIGlzIGh1Z2UsIGJ1dCBpdCBsb29rcyBsaWtlIGl0IHN0aWxsIGRvZXNu
J3QgZml4IHRoZQo+IEZJWE1FJ3MgYXJvdW5kIHRoZSBBTUQgZHJpdmVyIHVzZSBvZiBobW0uCj4K
PiBDYW4geW91IGZpeCB0aGVtIGJlZm9yZSBwaWxpbmcgb24gbW9yZSBzdHVmZj8KCkl0IGRvZXMg
YXZvaWQgbWFraW5nIHRoZSBzYW1lIG1pc3Rha2VzIGluIHRoZSBuZXcgY29kZS4gSSdsbCB0YWtl
CmFub3RoZXIgbG9vayBhdCB0aGUgcHJlLWV4aXN0aW5nIEZJWE1FcyB3aXRoIHRoZSBleHBlcmll
bmNlIGdhaW5lZAp3b3JraW5nIG9uIHRoaXMgc2VyaWVzLgoKUmVnYXJkcywKwqAgRmVsaXgKCgo+
Cj4gSmFhc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

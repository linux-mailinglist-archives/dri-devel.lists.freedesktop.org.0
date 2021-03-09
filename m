Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7D6332C13
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 17:30:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0E46E910;
	Tue,  9 Mar 2021 16:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F366E910;
 Tue,  9 Mar 2021 16:30:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRx1VOQgAN/VHzjofDDI1hLHL04k2Pi3HbH0WDooQSIfmwhIDOpsrjovfrgVe92Kx5x69Qemm0XOyuba7MzeeuxcJCGs98btG8PoJwLw9bdeMVLiE5Omz5GIH5SCg1uRd4qFLD/j4LfFwF5sPndyfvie3SiA0AvlJcQdrhU15v7z6buL8OzhsS4qP26gim9hs54wfLwkrdoQaCdJ/5CeBJg+SmvwCgAgvQWof2PdzC6AtFUfWnHBaEbZ5ASo783RD/PWZRSrr0xRygY2NzUqWGMXW/cRam4vUrWQdfzDuoDxilJNuqHh4qzXGsLV4rChqcis2nQ+/AnqOuPe8CM+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJLCzuXadJD5Cb2xjauTr+bDtMGEJWLUdpxGeol8nBo=;
 b=leV3yWfwMNkiOAw40FQ2FYhxGQFbcXyCHuynV80IcEyV/9zNuaF9M68WRGeFqumdFE8TIyN89c0WIpH4Etc/amLhG1hPcuCNCFw43ej2/WmS5Bk1dLl34MjkNVFwhDWYOrvMnkSE4VcO8us8wkLYeDc9wfSuYIBdA9EXUYr1XaiaS8PsYxElYa96Epu9/wTA4WO0mxJ290lbfSlQK4Ht9tWEVhDGYcFdGp8wrteH7lZEB7JLw0cNyzNTNZ3kzptzemLXS2TjZNe/DwaKHCuuTrkgjzL3W4gMY0NyY8HmaHhsxB6vv1f2qG1gL5OOAZ/XfV0jyD+ItFMhI2eI3Fn5qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rJLCzuXadJD5Cb2xjauTr+bDtMGEJWLUdpxGeol8nBo=;
 b=1lBokpzAe38FOk/NtOMrqcJDsDl2PgBmIlIIMCe1Q2q1E+eBbXLXs4acUE8OWFtdPhPeBMZH+k3uAvFVmK/UFPWsbN6gfp7157Yd34QJJKsCWSj93rPQaNhLhE5nyOzLATVH41mOs2WiAjLx+5mXLxoMdvno6rf8tYSarmf7XWI=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4781.namprd12.prod.outlook.com (2603:10b6:208:38::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.19; Tue, 9 Mar
 2021 16:30:21 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%9]) with mapi id 15.20.3784.031; Tue, 9 Mar 2021
 16:30:21 +0000
Subject: Re: [PATCH 1/1] drm/amdkfd: fix build error with AMD_IOMMU_V2=m
To: Arnd Bergmann <arnd@kernel.org>,
 "Suthikulpanit, Suravee" <Suravee.Suthikulpanit@amd.com>
References: <4c692eff-9d57-278e-8da4-36bc2c293506@amd.com>
 <20210309032356.20800-1-Felix.Kuehling@amd.com>
 <CAK8P3a1EeHimbufajcHzV+-bBarWtLHzzFSsa=qdUDsip=Wz_A@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <8023bb6b-b6aa-230c-afa5-871ce32782c6@amd.com>
Date: Tue, 9 Mar 2021 11:30:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAK8P3a1EeHimbufajcHzV+-bBarWtLHzzFSsa=qdUDsip=Wz_A@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YTOPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YTOPR0101CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.26 via Frontend
 Transport; Tue, 9 Mar 2021 16:30:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: e361e921-b05b-4fc9-5320-08d8e318a234
X-MS-TrafficTypeDiagnostic: MN2PR12MB4781:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB47817FAD261B705F7F0C0BED92929@MN2PR12MB4781.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hC7vQedGpXtxRy2apAoI/6kDRrjImiudEWGWeNFL5qhQci9VY1kNN5Tb7j/ay7JSoeYdxr25+4vJXG4ozMPw2jwYAPnF+iBDfazw35x2eihtXmjCrebLvHjuHpbAWDtRHVwoe3Ixj8TkFE27SYl8902RQwBaNPc5iRal4pDgDmi40cV1aFKWPvbE6RG/eewE8eWFlEoyd87MnRzSg74BEUeJqK6Za3hcNY1HQkOb2nM9G4R2GQcZZReeWvZB7GDKqQRWVGhsbHi2kD0j353QdXP8Zq1AA37qNDI7kyO+47GYIfec0im6GNdZ5a5wqww4UuhAfxgxegQ4O+pxJBETu0kb1O5ldoinjn2Qfijo9FsdcB8be7SMNpAhrTASwBUt4COoojt7V6FEQCQTwUJHQOtQsL9sVBShetPYdxZlq1G79jZorIzMIeY5UoqT/DKAwsSXPhIDbyuByvYoZBgiuKhKYolr6ZEnnKZGU8av43fhZ4WKN4bqUpbFJbrmgzkS21M8vgLxCkFF8f225mR2wqm/2lC+dy7kxU1fMNLx86NVeASui3Es08YGUSRBrgfRzBWClOeBLPp267sIWDGZqL/atNehNNtSnmZ4akMVg/U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(6636002)(2906002)(86362001)(4326008)(31696002)(6486002)(8676002)(36756003)(44832011)(66556008)(53546011)(956004)(5660300002)(31686004)(66946007)(26005)(316002)(52116002)(16526019)(2616005)(8936002)(186003)(110136005)(83380400001)(54906003)(16576012)(66476007)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Zkd0bGZmZGlBZTdLZDgzVGNpdllnYVJKSW9qaFJ6ZTh2ODI1eGRTZHdmbnVJ?=
 =?utf-8?B?OVNqYkROTm9kZWc3Uy9vYkVHUHpnOHNRYnNCTERzQnVRZTN1VVN6L2hJZnp2?=
 =?utf-8?B?azNoY2doTEowU0lqaDI4eEg0RW5kODJiQWRDMjVvdnZTcytpSkZnSGRsRUt0?=
 =?utf-8?B?Q0dsb3JBWjRtZ3ZFYnlYa1psQ0VhejZ4SU50Yzh6SGhuMW1hK0Z4Uk84UW42?=
 =?utf-8?B?eUtFL1B2ODNkVDdHTnNnT1N6YVJoVlVBYkpJa3p5R0lQMVdiaWs0V1U0akZm?=
 =?utf-8?B?VXFQSng4Z3F6OXFDUzFRbDFtR1N4bmQ0WjZzT09tU1oxRm1kd1h1WEVkTkEw?=
 =?utf-8?B?OFp5R3JFUDZKTTl6SDBBZFlZN1hxRVV5aTd0a3dSdlRTR2Q4ai9sUWprV1Qr?=
 =?utf-8?B?VGVJRVpwZDZ6VTlKQzN4UXlVWGdDUTJFTzZIUzFoTWlQaStRL1Z4c2tUWkxW?=
 =?utf-8?B?WWZ5VTRWMTdNSXBCU2tKclVHQ09JMHc5dW5iTDJ2R205SS9FQ0pLNVdCV2FE?=
 =?utf-8?B?dTNSNTVQdFF2Qnl2SVhzVWcxZEhqOFZHUkYxUGw5Qy9FdkZ5Y1VlS0dvZWk1?=
 =?utf-8?B?aWpBQ1FGYndjcDI0V3RXRElnaERLU28zT3VoUjhaQ3ZXSm55Y3BPUWp1K0t0?=
 =?utf-8?B?dWxTUkhlWG94QXZWb3lmaVg5ekJUbnJZMjRzaERZYWFLWVgwRTc3dTFkanR2?=
 =?utf-8?B?S2lmUVd6REVBSWY0eXVBV2RoZGNqTXpNN2c3Sy84OVV0cHgrVEd4cnN0VldV?=
 =?utf-8?B?dVJWL1h3MkE1QXVvWGRRaDVsY1grbzA2dy9YVjhHV1VGUXlNZVNEd056bnB1?=
 =?utf-8?B?TXlTdHNZeDVrSGpOcUJPVEpsZWhFVG0rZ2hqVENuZzBVTTRGWjF4V1Y5dFR3?=
 =?utf-8?B?Zy90WC9BUldIbU04MyszSWp6b1FsejlraTBlRGxqZVRJL0k0K0NpR2k4eE05?=
 =?utf-8?B?blhIemFvVFFsNWw4RUs0RzdTeFo0d0xhVEJzNmNTcGFQaXl6QkFxSnRyUUVU?=
 =?utf-8?B?UVV2V1J6ejRVZWFld016RzhqUmtkM2VJdmowM1EzelowNDQ3TlEwTUJmdTcw?=
 =?utf-8?B?aG9TelNSQlI1dDhoRWYra1pxdnVhSnpQUU9FRXN4QzRCcUtnQmNqMHAwbWFJ?=
 =?utf-8?B?UnRUN2txbVNwUGE2Y2xwaENmT2lZYVdOT3RKVnBtMFhwYjZ1S3gwc3FPVEhN?=
 =?utf-8?B?T3FOallsZk1CbEJmNGY1Zml2aDVzMW9TRGQrWklqRWxoa3pvL3labXRqSkM3?=
 =?utf-8?B?YXFFY0dqTWFvSTc2eHhGZTNHZnoxVm1MOHMvT0NQbFFQWmxBQTgzUS9XM2dv?=
 =?utf-8?B?dkRaVy9nQnVlcHVocGNUVnh6QkdEb29OUzlyQ21neitIYmluZUZyYnZoeU1z?=
 =?utf-8?B?VkxvNGhhT2VjVkFkUFJnS1pKODU4cnI2ekJpM3hrNnpPai9HVzhxLzRmZUV6?=
 =?utf-8?B?NlJHQVplSEdCUjhIOGNnREVic1ZUUkdSUjBwTUh2TFJEUmtDT2lsSkRNdzJE?=
 =?utf-8?B?R3ZqVlFMUnlJak0zcjE0MHdtUWlvSWFuV0xjS0owUTVmeEVqMEJYY09YTE0y?=
 =?utf-8?B?aW1mL1lKTHZabGZJcGplRnpVYVhCR1BZQ0xtTFUwc2Y4bHdyUGthWGRFcXo5?=
 =?utf-8?B?STdlZmRtQXhuWUt5eTczTjJRcUJmK3pIbzBwazNXNE5GT08yN1dHbXRnQWIr?=
 =?utf-8?B?Ym50eDJybXE0MWdZWjE4RVp5SWpqZ2tvQ0JTS3ljN0FQNkVmVU1kN0hzbkRj?=
 =?utf-8?B?L2VxLzQ5SEw3K3AvRy8yc3lETlczVXZndjRURno2Zm42NThxNCsza2RyeVNJ?=
 =?utf-8?B?NkZweTUwaVVhVmluaXRxQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e361e921-b05b-4fc9-5320-08d8e318a234
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2021 16:30:21.5303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RtVaESFokEJmqoA3qqAgppYAj91zi9F8SzJiN6XVgiuV5PfcZbwXpa2w54FlPPDCPwZMDfItX8z+7QslFowfEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4781
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
Cc: David Airlie <airlied@linux.ie>, Joerg Roedel <joro@8bytes.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Will Deacon <will@kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wMy0wOSB1bSAzOjU4IGEubS4gc2NocmllYiBBcm5kIEJlcmdtYW5uOgo+IE9uIFR1
ZSwgTWFyIDksIDIwMjEgYXQgNDoyMyBBTSBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdA
YW1kLmNvbT4gd3JvdGU6Cj4+IFVzaW5nICdpbXBseSBBTURfSU9NTVVfVjInIGRvZXMgbm90IGd1
YXJhbnRlZSB0aGF0IHRoZSBkcml2ZXIgY2FuIGxpbmsKPj4gYWdhaW5zdCB0aGUgZXhwb3J0ZWQg
ZnVuY3Rpb25zLiBJZiB0aGUgR1BVIGRyaXZlciBpcyBidWlsdC1pbiBidXQgdGhlCj4+IElPTU1V
IGRyaXZlciBpcyBhIGxvYWRhYmxlIG1vZHVsZSwgdGhlIGtmZF9pb21tdS5jIGZpbGUgaXMgaW5k
ZWVkCj4+IGJ1aWx0IGJ1dCBkb2VzIG5vdCB3b3JrOgo+Pgo+PiB4ODZfNjQtbGludXgtbGQ6IGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1ka2ZkL2tmZF9pb21tdS5vOiBpbiBmdW5jdGlvbiBga2ZkX2lv
bW11X2JpbmRfcHJvY2Vzc190b19kZXZpY2UnOgo+PiBrZmRfaW9tbXUuYzooLnRleHQrMHg1MTYp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBhbWRfaW9tbXVfYmluZF9wYXNpZCcKPj4geDg2XzY0
LWxpbnV4LWxkOiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGtmZC9rZmRfaW9tbXUubzogaW4gZnVu
Y3Rpb24gYGtmZF9pb21tdV91bmJpbmRfcHJvY2Vzcyc6Cj4+IGtmZF9pb21tdS5jOigudGV4dCsw
eDY5MSk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFtZF9pb21tdV91bmJpbmRfcGFzaWQnCj4+
IHg4Nl82NC1saW51eC1sZDogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11Lm86
IGluIGZ1bmN0aW9uIGBrZmRfaW9tbXVfc3VzcGVuZCc6Cj4+IGtmZF9pb21tdS5jOigudGV4dCsw
eDk2Nik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFtZF9pb21tdV9zZXRfaW52YWxpZGF0ZV9j
dHhfY2InCj4+IHg4Nl82NC1saW51eC1sZDoga2ZkX2lvbW11LmM6KC50ZXh0KzB4OTdmKTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1kX2lvbW11X3NldF9pbnZhbGlkX3Bwcl9jYicKPj4geDg2
XzY0LWxpbnV4LWxkOiBrZmRfaW9tbXUuYzooLnRleHQrMHg5YTQpOiB1bmRlZmluZWQgcmVmZXJl
bmNlIHRvIGBhbWRfaW9tbXVfZnJlZV9kZXZpY2UnCj4+IHg4Nl82NC1saW51eC1sZDogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRrZmQva2ZkX2lvbW11Lm86IGluIGZ1bmN0aW9uIGBrZmRfaW9tbXVf
cmVzdW1lJzoKPj4ga2ZkX2lvbW11LmM6KC50ZXh0KzB4YTlhKTogdW5kZWZpbmVkIHJlZmVyZW5j
ZSB0byBgYW1kX2lvbW11X2luaXRfZGV2aWNlJwo+PiB4ODZfNjQtbGludXgtbGQ6IGtmZF9pb21t
dS5jOigudGV4dCsweGFkYyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFtZF9pb21tdV9zZXRf
aW52YWxpZGF0ZV9jdHhfY2InCj4+IHg4Nl82NC1saW51eC1sZDoga2ZkX2lvbW11LmM6KC50ZXh0
KzB4YWZmKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1kX2lvbW11X3NldF9pbnZhbGlkX3Bw
cl9jYicKPj4geDg2XzY0LWxpbnV4LWxkOiBrZmRfaW9tbXUuYzooLnRleHQrMHhjNzIpOiB1bmRl
ZmluZWQgcmVmZXJlbmNlIHRvIGBhbWRfaW9tbXVfYmluZF9wYXNpZCcKPj4geDg2XzY0LWxpbnV4
LWxkOiBrZmRfaW9tbXUuYzooLnRleHQrMHhlMDgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBh
bWRfaW9tbXVfc2V0X2ludmFsaWRhdGVfY3R4X2NiJwo+PiB4ODZfNjQtbGludXgtbGQ6IGtmZF9p
b21tdS5jOigudGV4dCsweGUyNik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGFtZF9pb21tdV9z
ZXRfaW52YWxpZF9wcHJfY2InCj4+IHg4Nl82NC1saW51eC1sZDoga2ZkX2lvbW11LmM6KC50ZXh0
KzB4ZTQyKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYW1kX2lvbW11X2ZyZWVfZGV2aWNlJwo+
Pgo+PiBVc2UgSVNfUkVBQ0hBQkxFIHRvIG9ubHkgYnVpbGQgSU9NTVUtVjIgc3VwcG9ydCBpZiB0
aGUgYW1kX2lvbW11IHN5bWJvbHMKPj4gYXJlIHJlYWNoYWJsZSBieSB0aGUgYW1ka2ZkIGRyaXZl
ci4gT3V0cHV0IGEgd2FybmluZyBpZiB0aGV5IGFyZSBub3QsCj4+IGJlY2F1c2UgdGhhdCBtYXkg
bm90IGJlIHdoYXQgdGhlIHVzZXIgd2FzIGV4cGVjdGluZy4KPiBUaGlzIHdvdWxkIGZpeCB0aGUg
Y29tcGlsZS10aW1lIGZhaWx1cmUsIGJ1dCBpdCBzdGlsbCBmYWlscyBteSBDSQo+IGJlY2F1c2Ug
eW91IGludHJvZHVjZQo+IGEgY29tcGlsZS10aW1lIHdhcm5pbmcuIENhbiB5b3UgY2hhbmdlIGl0
IGludG8gYSBydW50aW1lIHdhcm5pbmcgaW5zdGVhZD8KClN1cmUuCgoKPgo+IE5laXRoZXIgdHlw
ZSBvZiB3YXJuaW5nIGlzIGxpa2VseSB0byBhY3R1YWxseSByZWFjaCB0aGUgcGVyc29uIHRyeWlu
Zwo+IHRvIGRlYnVnIHRoZQo+IHByb2JsZW0sIHNvIHlvdSBzdGlsbCBlbmQgdXAgd2l0aCBtYWNo
aW5lcyB0aGF0IGRvbid0IGRvIHdoYXQgdGhleSBzaG91bGQsCj4gYnV0IEkgY2FuIGxpdmUgd2l0
aCB0aGUgcnVudGltZSB3YXJuaW5nIGFzIGxvbmcgYXMgdGhlIGJ1aWxkIGRvZXNuJ3QgYnJlYWsu
CgpPSy4KCgo+Cj4gSSB0aGluayB0aGUgcHJvcGVyIGZpeCB3b3VsZCBiZSB0byBub3QgcmVseSBv
biBjdXN0b20gaG9va3MgaW50byBhIHBhcnRpY3VsYXIKPiBJT01NVSBkcml2ZXIsIGJ1dCB0byBp
bnN0ZWFkIGVuc3VyZSB0aGF0IHRoZSBhbWRncHUgZHJpdmVyIGNhbiBkbyBldmVyeXRoaW5nCj4g
aXQgbmVlZHMgdGhyb3VnaCB0aGUgcmVndWxhciBsaW51eC9pb21tdS5oIGludGVyZmFjZXMuIEkg
cmVhbGl6ZSB0aGlzCj4gaXMgbW9yZSB3b3JrLAo+IGJ1dCBJIHdvbmRlciBpZiB5b3UndmUgdHJp
ZWQgdGhhdCwgYW5kIHdoeSBpdCBkaWRuJ3Qgd29yayBvdXQuCgpBcyBmYXIgYXMgSSBrbm93IHRo
aXMgaGFzbid0IGJlZW4gdHJpZWQuIEkgc2VlIHRoYXQgaW50ZWwtaW9tbXUgaGFzIGl0cwpvd24g
U1ZNIHRoaW5nLCB3aGljaCBzZWVtcyB0byBiZSBzaW1pbGFyIHRvIHdoYXQgb3VyIElPTU1VdjIg
ZG9lcy4gSQpndWVzcyB3ZSdkIGhhdmUgdG8gYWJzdHJhY3QgdGhhdCBpbnRvIGEgY29tbW9uIEFQ
SS4KClJlZ2FyZHMsCsKgIEZlbGl4CgoKPgo+ICAgICAgICBBcm5kCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

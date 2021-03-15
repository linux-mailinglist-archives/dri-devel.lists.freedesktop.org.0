Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD15433C4F4
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 18:57:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 264016E096;
	Mon, 15 Mar 2021 17:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E091D6E053
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 17:57:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwml3wF3k+IIE97VC/snNOicYd2W077+dLh9voZDYuc+e8iA4ECbnkNNO1lpDyZmcsgXhRyxZPOqPY7oUS6F/4seE9LxFKUqsyLd4rY1HMdU30bVunWinXGVf/FajweZE0oXbvjMEe/gHt25Or1clc8PiJa9B80C8t5pLkNXL23C5BCbSUihbvmhfRfiViECikUDKrnmyUmTJoLI0MLXSi1X6fHNxv87x06+VHh1q4znctPezJqY2Fhwrpz5OjhSSCUc1CIyXiiKcfNv7R8cOYj6UOZyxrnQGfR0XaJ/jdhWb4ogOX2FL89xowkWbZsBXS6HN+wLHEQT/Ne+9sHM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWAo/v9Oky2q8oBOKDa8HdkxvsoRJXNlkUuSIvxcfEE=;
 b=Ed8lVweGs/eNDpKsExROkRpi/4HNYqC6NQZ3j5TgYyhyTlNYUQG8lADXV98qXfOG4wUkTool+cXwwX96JoN6GeyOi/CWStRjxi71vEZ+yxwF/lbwqde+d539Aj/LYFOzLSvz8QWKd2RC+QMNkHigyyuhctlKt46I6rt3y0xLgq+3r3fCaVdC1lINRAd09oTBlrUy+WJM1RVB+HGSzdj4FwzY+ca5SM2hPhVsp6QulgSs0lzi4+nsBHv4lks6nfk0tUp3K7JwhakX2vyq2bxbsyyBSMol3uKTPEgagvGsSdoefdqzsJippca4zZ2rL9aI5bx3+QJfZ/SCpbt7rOWPcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWAo/v9Oky2q8oBOKDa8HdkxvsoRJXNlkUuSIvxcfEE=;
 b=MssPUYI46zGVQtqQrydfm9ymg6VBItld9GH7FFaadpLeDJe83jbO2YaWoMHfKXY7/G2dMnhmFPCSznS4rawU3M2T9FkNRuEofKNLazpwFwEQ++pIV2QJ2fKk/PLXsELbJQY7VjkmF8jkExyc748GIFU1FgN6TH0FHdV9BifRUEg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6528.namprd05.prod.outlook.com (2603:10b6:208:df::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.13; Mon, 15 Mar
 2021 17:57:12 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::88de:ad34:82d7:a02e%6]) with mapi id 15.20.3955.010; Mon, 15 Mar 2021
 17:57:11 +0000
Subject: Re: vmwgfx leaking bo pins?
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org
References: <09ebc5cf-3e2c-d233-2c58-ff4d72e01297@shipmail.org>
 <D04E8A53-C740-480D-9209-1CC6A40A10F2@vmware.com>
 <54448dd1-cfc3-626a-6480-4edfcf97b148@shipmail.org>
 <DCF8E67E-36D4-400A-88B7-63C6253179D6@vmware.com>
 <48d5e3f3-0b42-a9e4-6e5c-591806e873ff@shipmail.org>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <3bb8b7f4-953a-b455-e148-009c2ff9f7b2@vmware.com>
Date: Mon, 15 Mar 2021 13:57:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <48d5e3f3-0b42-a9e4-6e5c-591806e873ff@shipmail.org>
Content-Language: en-US
X-Originating-IP: [71.175.59.246]
X-ClientProxiedBy: MW4PR04CA0328.namprd04.prod.outlook.com
 (2603:10b6:303:82::33) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (71.175.59.246) by
 MW4PR04CA0328.namprd04.prod.outlook.com (2603:10b6:303:82::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32 via Frontend Transport; Mon, 15 Mar 2021 17:57:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78687cac-d817-40e4-1b81-08d8e7dbc1d8
X-MS-TrafficTypeDiagnostic: MN2PR05MB6528:
X-Microsoft-Antispam-PRVS: <MN2PR05MB6528C547B52F4F12FCE7B3C3CE6C9@MN2PR05MB6528.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yb+kd9fQEB438CY7nSrCJYVOx8Z679CL1f6zoUHS+yFNCk0WMTqSuZuSdRTrV0f2XqapD3dUPuVXG+f6z1q1Y8rT4NsQ+S/vQHdjEhh8prdBGEDOgEeX2ET/FyxVFFno2kywOquc7PELuEiPwFTkx1yl1Kpaj7PwREIVdrvR2Zu5gQgZsucGEYcO1Zu9zxBiTGGe1X1xvG9UmyO+QmPo+JKCmhuMpKLWc/Id86/S3yU5ddCOeqpEMXIbnYJEHfsBHE4HRu73qWjtVZk8Yr6q9MoagYMw7WxkDwsPwBF/yqHrz6UBulrNGnVktGbEjREWTavT32vr/FbOjSIqoapTaQ5AMeAlhWQwi/deEu5K7hA0gYggfSWIEJv0/D9amN9z8dSYbcM9TqNC4OwIz37GZZpYuNXwj0mhugbJ5I/JQUaxMicMgwk3Hy79sGGoGmlJduOX6AHJc/8J6osR5OdDWKNfW9DGjjAfEx+o7OcEabXjX96ELVoBqsH7N57whRPOpZjWUamTAL3l4UBUVQZJdmTZX+4sGqZ6eUpsfF4IoH7GAC22jg185B0HgogR8MsNuU+csZBdwGvQuOkrEvvu8EyLWTbGa9OpDTfYTgj3kSbt5JzBu/0hMRXb2idN0pCfedNEPYhTCkWNcnbiIa9HtnzGxY3FZGu5U1ESXSXgw5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(66946007)(36756003)(83380400001)(478600001)(66574015)(66476007)(66556008)(316002)(6486002)(26005)(31696002)(956004)(16576012)(53546011)(2906002)(8676002)(186003)(2616005)(86362001)(31686004)(6666004)(3480700007)(16526019)(8936002)(5660300002)(40753002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SzVIQkJjck9OMVNLKzlHZ1BZZzdZQld1bFVoZ2tLenpGejBQaXNYdStISjZh?=
 =?utf-8?B?cm1aVGxjL0RuNlFyV3hic05NNmg5cHNNbmxZOXBJNElXNUdBRXE2d09LYVZx?=
 =?utf-8?B?bHNUR1NqYSsydjZqY25Kem5CSTRmTlEzd242Y2kxV0NrYmc0bnN5MmFRUVU4?=
 =?utf-8?B?YVU3NnJ3dXVSKzBXK3ptc0VoMGx1R1BvZ1E4c2lPd2hZb0xEMlhrTHExN1BD?=
 =?utf-8?B?emt6bGpGZE93dEZMdTRlZUZaaTIycDRCa2FqWnVFTXRCcFFaY0hrd3lPY1ZW?=
 =?utf-8?B?byt4R3Racko5cXZWWE9DbnVUeCtJQ29EMkJsdEFVV2t2WGNoTmJvZG1ndmdK?=
 =?utf-8?B?a3h4L1Z5YlVrcDh5K05VR2YzSGRPY0RvcFFZR3RWYzg3UFVoM21TMitTOGRt?=
 =?utf-8?B?S3cyZi8yT2x4aURBczBmQitDT1VybUVsN2dBQmZoVWk2Q2xJV1lhbDRUYzF4?=
 =?utf-8?B?K1FCTjZmT0J5c2FNZVFKRXhGd0M1aFY1d3pSNHRIa0dPWkVQMzFLMzB6Ujln?=
 =?utf-8?B?MkZjblZkUUxWTWJ4QkxzdVFMYm1BMDUrNmd2WXhucmMzUUdrVG0yZ1oxV3h6?=
 =?utf-8?B?TFdNSmtBK3h1bUx6UWp3TDRCRXhNRS9FQjdBYWdYbnFqbzNnRjZNeEFBdTJi?=
 =?utf-8?B?bVdiL2JwOEIxU01xanNnOWNMdmV0THBxbkJJL3hoUDJjc3NGMnJXcTJrWm9s?=
 =?utf-8?B?Y0lCclUzYTZtc01VOFZ3MFFKU1RFM0FpMTFrZW01MmpUbk95T05PTDl2empx?=
 =?utf-8?B?NjNXMms3SWVDMFUwTGl0eUtMK1RoWmJIRFRUc05JQUNkMDZlQ0FqSnlNRWFr?=
 =?utf-8?B?bzV2RTZzd293YnBhc0dFcDRXZ3BRZ2hpbElUSGp3VGZRT1BKajFUVWRrOENh?=
 =?utf-8?B?N09kSklubVVSTk03ZDVNbWFKL2hlNysySzB3TXlVd1lzemtxZFZvYXV4eURR?=
 =?utf-8?B?d2ZVVmpJOWdjK0ExVlNDcnJaUXNnZXJoalVOSW5FRndZdDNPUWZaMDZzaDIv?=
 =?utf-8?B?dVB0YSs5aXd0RlhMNk1hcmhiQzVEQ2JobExsNnp0U0NzMDlyVExxZEo1Mlg1?=
 =?utf-8?B?N0xObDdBK3hSSXlYYXlaZVdublB0RDNCdTlYYWZ0V0tZc2pvRU85K0NqNmdv?=
 =?utf-8?B?QlpzQVlZMlVIYmRLV29aakdXRHJ4Zk1wc3lvMHpyaEZYK0NYVENPM2U1cTNI?=
 =?utf-8?B?NG9nRmJvdnJ1dVhpenU5WXJPcEJVQW95S0FKbzlRTVphMDhIaUlNaWloOGgr?=
 =?utf-8?B?cXBySEh4aWZ6QnpQWWJHZnVOZVpBdVA3dkYyR1hTNFJhOEpYSEtkNjJCWHpW?=
 =?utf-8?B?dWxmK0Y3U2lyRVFGMGoySGRUMU9rVVExWlQyZ2RORmw0blFTdXQyL3RZNUw1?=
 =?utf-8?B?YldzOE1jWmlpWndNVmVTMmdHZERjbnVKRXhXWUpyUzB3bVNKRFNOamlyVFFE?=
 =?utf-8?B?WVo5WWFGUVRUNHFnQlB2NXFWNVBZQktwWVdKMFd1ZUhPV0xnc3FPNjFESVJL?=
 =?utf-8?B?MUxPWk4vemduaEpQYzFkSXgwRjk0amNqYU1YTmROWm9oMXpoL2tGbXR4c21L?=
 =?utf-8?B?U2ZsaGpicGpMMXF1dm5uVDdXUVZZb2ptMys5eWJodjRFc0RrR2Fadm14Z0ZH?=
 =?utf-8?B?aC9aT2FKeUhwa0tSdHdVMGlXQjN0TENTaWpkbWladmZWMFEvbmNCZHhoWDNh?=
 =?utf-8?B?RnFxc09WclBNM0R4Y1FVYUVCcG5xTjlnU2VteU56M0trbHA3ZEMrYW1pOFhT?=
 =?utf-8?Q?eSp2/WmNeWnIT6ddWJ31kMucHNBxEIHMz9Kunr5?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78687cac-d817-40e4-1b81-08d8e7dbc1d8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 17:57:11.7350 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wrj3TyYz70lqtI66xqsODoFb7Qwx0sObNxuFzsWbMyuNkxODWNMn7nEVV2OM9J0U6AiQ0ROwNZqUJvV0RfUCeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6528
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMy8xMi8yMSA1OjA2IEFNLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIHdyb3RlOgo+IAo+
IE9uIDMvMTIvMjEgMTI6MDIgQU0sIFphY2sgUnVzaW4gd3JvdGU6Cj4+Cj4+PiBPbiBNYXIgMTEs
IDIwMjEsIGF0IDE3OjM1LCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIAo+Pj4gPHRob21hc19v
c0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+Pj4KPj4+IEhpLCBaYWNrCj4+Pgo+Pj4gT24gMy8xMS8y
MSAxMDowNyBQTSwgWmFjayBSdXNpbiB3cm90ZToKPj4+Pj4gT24gTWFyIDExLCAyMDIxLCBhdCAw
NTo0NiwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSAKPj4+Pj4gPHRob21hc19vc0BzaGlwbWFp
bC5vcmc+IHdyb3RlOgo+Pj4+Pgo+Pj4+PiBIaSwKPj4+Pj4KPj4+Pj4gSSB0cmllZCBsYXRlc3Qg
ZHJtLWZpeGVzIHRvZGF5IGFuZCBzYXcgYSBsb3Qgb2YgdGhlc2U6IEZhbGxvdXQgZnJvbSAKPj4+
Pj4gdHRtIHJld29yaz8KPj4+PiBZZXMsIEkgZml4ZWQgdGhpcyBpbiBkMWE3M2M2NDFhZmQyNjE3
YmQ4MGJjZThiNzFhMDk2ZmM1Yjc0YjdlIGl0IHdhcyAKPj4+PiBpbiBkcm0tbWlzYy1uZXh0IGlu
IHRoZSBkcm0tbWlzYyB0cmVlIGZvciBhIHdoaWxlIGJ1dCBoYXNu4oCZdCBiZWVuIAo+Pj4+IG1l
cmdlZCBmb3IgNS4xMi4KPj4+Pgo+Pj4+IHoKPj4+Pgo+Pj4gSG1tLCB5ZXMgYnV0IGRvZXNuJ3Qg
dGhhdCBmaXggdHJpcCB0aGUgdHRtX2JvX3VucGluKCkgCj4+PiBkbWFfcmVzdl9hc3NlcnRfaGVs
ZChiby0+YmFzZS5yZXN2KT8KPj4gTm8sIGRvZXNu4oCZdCBzZWVtIHRvLiBUQkggSeKAmW0gbm90
IHN1cmUgd2h5IG15c2VsZiwgYnV0IGl0IHNlZW1zIHRvIGJlIAo+PiB3b3JraW5nIGZpbmUuCj4+
Cj4+Cj4gV2l0aCBDT05GSUdfUFJPVkVfTE9DS0lORz15IEkgc2VlIHRoaXM6Cj4gCj4gW8KgwqDC
oCA3LjExNzE0NV0gW2RybV0gRklGTyBhdCAweDAwMDAwMDAwZmUwMDAwMDAgc2l6ZSBpcyA4MTky
IGtpQgo+IFvCoMKgwqAgNy4xMTcyODRdIFtkcm1dIFZSQU0gYXQgMHgwMDAwMDAwMGU4MDAwMDAw
IHNpemUgaXMgMTMxMDcyIGtpQgo+IFvCoMKgwqAgNy4xMTcyOTFdIElORk86IHRyeWluZyB0byBy
ZWdpc3RlciBub24tc3RhdGljIGtleS4KPiBbwqDCoMKgIDcuMTE3Mjk1XSB0aGUgY29kZSBpcyBm
aW5lIGJ1dCBuZWVkcyBsb2NrZGVwIGFubm90YXRpb24uCj4gW8KgwqDCoCA3LjExNzI5OF0gdHVy
bmluZyBvZmYgdGhlIGxvY2tpbmcgY29ycmVjdG5lc3MgdmFsaWRhdG9yCj4gCj4gV2hpY2ggd2ls
bCBwcm9iYWJseSBtYXNrIHRoYXQgZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQoYm8tPmJhc2UucmVzdikK
PiAKCkFoLCB5ZXMsIHlvdSdyZSByaWdodC4gQWZ0ZXIgZml4aW5nIHRoYXQgSSBkbyBzZWUgdGhl
IApkbWFfcmVzdl9hc3NlcnRfaGVsZCB0cmlnZ2VyZWQuIFRlY2huaWNhbGx5IHRyaXZpYWxseSBm
aXhhYmxlIHdpdGggCnR0bV9ib19yZXNlcnZlL3R0bV9ib191bnJlc2VydmUgYXJvdW5kIHR0bV9i
b191bnBpbiBidXQgaXQncyBhIGxpdHRsZSAKdWdseSB0aGF0IHNvbWUgcGxhY2VzIGUuZy4gdm13
X2JvX3VucmVmZXJlbmNlIHdpbGwgcmVxdWlyZSAKdHRtX2JvX3Jlc2VydmUvdHRtX2JvX3VucmVz
ZXJ2ZSBhcm91bmQgdHRtX2JvX3VucGluIGJ1dCBzb21lIHdvbid0IGUuZy4gCnZtd19tb2JfZGVz
dHJveSB3b24ndCBiZWNhdXNlIGl0cyBsb2NrIGlzIGhlbGQgYnkgdHRtX2JvX2RlbGF5ZWRfZGVs
ZXRlIAp3aXRob3V0IGEgdmVyeSBjbGVhciBpbmRpY2F0aW9uIHdpdGhpbiB0aGUgZnVuY3Rpb24g
d2hpY2ggaXMgd2hpY2guCgp6Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=

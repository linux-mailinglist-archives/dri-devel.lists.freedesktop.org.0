Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8995E33180A
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 21:02:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A534D89D9A;
	Mon,  8 Mar 2021 20:02:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2071.outbound.protection.outlook.com [40.107.95.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B1F589D9A;
 Mon,  8 Mar 2021 20:02:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBJtfh66LrGpGMNy/K61Qm3XRo47u8SihI8RQES43qaGHBaVdrgOql1Mj8NTToycxgJMD0EeR2sdEr9JX1CXYXAMtmMGXXja3YxC71DiixEVwuC5PK/ePx2+hR0NGrOhdg/97JnEKhfmzH42rQ3Q1w1SwicNOmSKTf1ixgKHucXcO28BUiCs6YqYQVMXofHoINgLTsLT3R4OIfzMka+yCy2Rvi8wLkgUZahPYXC8fpW6Cshmu2tpLWsKgZ/tUVA7b0A6fJfc9pJi8GV0R8VRu81S1/JKN8vp2iPjZujXt7NxIqIeY8suGprLlOizJLWXx6ZAwq4tqVMyBSUBF16hLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaoJkE4/3AxJvBfa+elc2fjhWybpnbBjYDe/x31JaPk=;
 b=hhCOyzwA65xNc93iEuaolwmUcl0apP8ocf5iFkZ6HMtfWiyNH/UNNIentiET2mcaeQF0u78seH/2zC0eubdgnsmCjDCqOvdOMNfakSnH15rfVEM+J+20ByOnZnw6UXA/yncupdv91Yc7IX8DR8lww+igKIz4PfCGDr98y1Etwq5kNuBUVPdA2t9u9aanDMYR14uNsKseQOyIID3icQBxhaugOi7edl1eobVUj3W/T70n/Tr23rB0V0XEBC1ML305Br2I4ywXlsqyDfUJEd7fWyFTn/+MidPKKcYp5WhwPy0Py/RfyEtheEScT1agpxqJv4wSM7NohFHrgiUfC5UBcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaoJkE4/3AxJvBfa+elc2fjhWybpnbBjYDe/x31JaPk=;
 b=jILNvxqXJknqzuYbypdixA8Av9OEkTCFHsjJh+HemPly8HHSB8XsT3XmYfV0hEM9OOJt8YDTUZEr40tY/IoschvBrtJp/bIWhKWdaC93DjXetX23gwJyv7h3JaM/8w8Q7asgl/IUsAucNXCMLpyhhoOvY6FyaTuyr1MsEOJdIbc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Mon, 8 Mar
 2021 20:02:21 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%9]) with mapi id 15.20.3784.031; Mon, 8 Mar 2021
 20:02:21 +0000
Subject: Re: [PATCH] drm/amdkfd: fix build error with missing AMD_IOMMU_V2
To: Arnd Bergmann <arnd@kernel.org>
References: <20210308153359.2513446-1-arnd@kernel.org>
 <176cae4d-33bc-1d51-a7d7-58eeeea5180e@amd.com>
 <CAK8P3a0nUKSJ2+knM6+REp8HXRFbz5-DmNRAusezkT+XzZQa7Q@mail.gmail.com>
 <92a6c999-c20a-2311-4e31-209a2d9229ed@amd.com>
 <CAK8P3a1SRubvaPzn2020Nc_SsL8xBW7ODGOGtF_4UYASGqTq-w@mail.gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <f2829f2e-6498-53d4-93fa-1613e988803f@amd.com>
Date: Mon, 8 Mar 2021 15:02:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAK8P3a1SRubvaPzn2020Nc_SsL8xBW7ODGOGtF_4UYASGqTq-w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YTBPR01CA0003.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::16) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YTBPR01CA0003.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.26 via Frontend Transport; Mon, 8 Mar 2021 20:02:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 268fb447-b07b-4c69-9e88-08d8e26d156d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4389:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4389D4485415AD4FEE93C33B92939@MN2PR12MB4389.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KK6O1cIrXmdzgBXOd2WfhGqtfy4uJ/N4t50T3/GissahNIPevE8j5Rh5JXCBipDGUemUEob8+zvZU4zH694AJjr6kNbiLSRHl5aiCct8gJUvIHM3lxWasM/HuYmfVU20DEqbdh1I6W4zOXGeSVOiI6gpvmR7xrnqU819gG+BY8XEsHFRS5WV5OxyS8RBY91Xb8tUJMk1c+JyX17gjBPfVe6GY+OssxZmjKSYi/gh546RdEk+Uc0xmoU4mM7yvFQbN8L8TcOOaC+PouygImXXiEKpuEOLPJen63sBi7TdrtUFZKREtpDfl7cJBW7+NoHsTPw3f0DdQTR/8UFXEmhXoQmOx90ubdyOIoe7Ry3h1kk+KbAzJoHT5iMvA/BjUMkZHn0XgAKHWI1202tBde90SGon6ie9ECjUO3nCLcFOxII8pbtPKiTWMa6Fepo8gTZD+GYpZ3jN19BfEBmI63vlOCLcuz7Y7sP+V3VP+eDMlIa99zPoHoFtee7OnGCgBFydEaEZwZzZW2wwTYFx1t/fa1curS+5okloPPfrSS+2gOj7+wZNiit/qcBxUB4kowc73g31EG6uyXZhJbTHX+S6ZgkqVcTdPuFGnL5yBeaHa9cAaO4HGp1GhGIwbxvXoVdPjHYYiMpEpum2A3hXUSx12A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(376002)(346002)(136003)(186003)(86362001)(26005)(36756003)(16526019)(8676002)(66476007)(2906002)(8936002)(2616005)(54906003)(31696002)(4326008)(66556008)(956004)(6486002)(316002)(478600001)(5660300002)(53546011)(44832011)(31686004)(16576012)(966005)(66946007)(6916009)(83380400001)(52116002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UEV2YklGWVlIanNWZlJKa3o2RkJxVmNueTJKUi8yNUExSFdCUmpCai9ES2cw?=
 =?utf-8?B?WG1xZTExc0dGVVRlSFZIREZ4VnVNQlRBeUFzeEk5MlVFcjNDdnZQeWY4RUhS?=
 =?utf-8?B?dDgwdm1KcU82UDg0N0VpeHR4UE4xRFZqR09UVUxMQVAzRW9OUi9JQkorSHhu?=
 =?utf-8?B?Mk9vNHNmeUUvdkwwWk9KbVUzcUNHZFpyKzhaUmZLUllnMkdkYjRkUXlJMFFk?=
 =?utf-8?B?bUNjRnp2dUovaWJMSjJXOGRkSjNDcmhhMzA2U2gxN0NZTDgwNjZqN2UrektI?=
 =?utf-8?B?bVhHNEd0R2V6VUkyMVVFS0dJK1RkTHQvcStxSEJkcUh1eFpmaDYzS1ZSbElD?=
 =?utf-8?B?MzI5Q2Q4NW1WYk4wazBtQkJ5NU1yeTAvdk0yYi9kWDJySEJ1ZEMvaTh0azVu?=
 =?utf-8?B?NVk1YTI5eUxvSnNaZGdpOHAxN0ZCTzFxcWErQisrSWNMUXl3NFlyQnI5RGR4?=
 =?utf-8?B?MjNtV3NBKyswZ3ZYZVE3UW1zMCtkbmkvMGVRWmo3cUNLY1c2Q2VLekgwZHFG?=
 =?utf-8?B?bExycldpYU5KS0VLWVpZeUhOeUJLQUxSSzc1ODFSREFRSktWd2pQMkNRSitJ?=
 =?utf-8?B?OXQ1NjFyODB4YW12K0l1WTJsTGcwWkIrdnYyQ3VFbUtvUDNjSmhyUWtWNDgx?=
 =?utf-8?B?MmJWcDF1SW8wVmxMeFB0TkplT0I2NTgvNmJOYm92eWVQOEtvTUZrbzQ1cWZp?=
 =?utf-8?B?VE1rTEdhTWJJcFY3L0Z0Y1RNWFdrVnQvcHJnZ3lPY2VteUMwdExFZTMxVnFy?=
 =?utf-8?B?N1dyaGFNSy92SlMyc0pRM3VFNDdrZU9vQ0ZjOVlUaDdvRmFrK3hsNmVHMmE1?=
 =?utf-8?B?a3o3L3BHQm1GSnhEMGIvbGUrTXZEVFREMUpxaGN4d2RheVVYL2VKS3M4NDc4?=
 =?utf-8?B?VTllbVBNVWpaZEtBSVhQUjMzUFgvZ0Z0N3o3c21vb0dqOGZ5QVhmQWJDMGVy?=
 =?utf-8?B?bjg3TWl6b3htT1AvQ1RXQkcrSE1mOWRTeWVnWExpaHdvNzFxVEt4Uld4eWUy?=
 =?utf-8?B?cEJEU1hualRkYzRxY0VmUThMOW5qODBOb3hrSWlCODFrVEYzbFlCQ1pGclIr?=
 =?utf-8?B?TFBlSjdoY1hvbHowWHZPeU1vNUswbFA3Q0RIejhPTW96WVUwZmU1b2FjV08z?=
 =?utf-8?B?VlFMQ3p4bjRGY0pFL1dFdkJoaHdNanlua05jV2NQeTFhdm5uaXpQWkloaEFi?=
 =?utf-8?B?QlFUSHRSUTZ2M0p3cHJXbVBEL1dXVHJkekRodWRDM3ZJN0hmT3Y0Q3VEOFVB?=
 =?utf-8?B?Ujl4WjBsZGF6c3R6Z2pEeXQrWXFRTjRPOFZydGNENFpENGxVTUVueW9ZNEFN?=
 =?utf-8?B?RUxWWURYVUEzU3V6c2xOU1g1QTR2cXVyYk1sSEdtMjBJL3k4UjZwdHdYWjM5?=
 =?utf-8?B?czE1WlVZZC9QOVFmN29NdmRyb1kxa2FybUJ1VGVrdGk4Q0dhR1RwVnpRckFV?=
 =?utf-8?B?bC91aW90dkhFOWNQMlg0RzYvNnNIRS84VmlRbCtVdGpsbjcvdGZTR3g2aUFQ?=
 =?utf-8?B?MlFNM2xsUExYTCtPaGp6R2dGcjVIa01IUVhvaWJaUElDZ3o5dnFCMjM1MXJo?=
 =?utf-8?B?N3JZK1pnNHVWc2JlcDJ6TnNhWWZ1TG1sdVloMnJuMURmY2IzNlNDMGsvVVl3?=
 =?utf-8?B?U3hOZGlON2Y5VmdGUkl3U3ZXTlFtL2tzNzBxemFSNzhRVDRFbUlNYWlGWEYw?=
 =?utf-8?B?QmdKVG5kblV0SE03NDdMaTlBRU1Ga0FqUGl2bWlDVTZNM0lrcC8wNlVwVGFL?=
 =?utf-8?B?ZFNHU3g0K2NreEhoRXg5a2w0N2gzbUVJYjBpTG1OSnpPNkIxcnhJU0JlZEY3?=
 =?utf-8?B?dlZIYXNDYlErUFZma3NHdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 268fb447-b07b-4c69-9e88-08d8e26d156d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 20:02:21.3774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /lB8/cDZM8oOLzcYx/fIFcRv0UeA6+OSFhoTA9/JEc3twV3/UR0xrDlHaqRVK/LFslAfINpm0O845V4Yew/USg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389
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
Cc: Philip Yang <philip.yang@amd.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wMy0wOCB1bSAyOjMzIHAubS4gc2NocmllYiBBcm5kIEJlcmdtYW5uOgo+IE9uIE1v
biwgTWFyIDgsIDIwMjEgYXQgODoxMSBQTSBGZWxpeCBLdWVobGluZyA8ZmVsaXgua3VlaGxpbmdA
YW1kLmNvbT4gd3JvdGU6Cj4+IEFtIDIwMjEtMDMtMDggdW0gMjowNSBwLm0uIHNjaHJpZWIgQXJu
ZCBCZXJnbWFubjoKPj4+IE9uIE1vbiwgTWFyIDgsIDIwMjEgYXQgNToyNCBQTSBGZWxpeCBLdWVo
bGluZyA8ZmVsaXgua3VlaGxpbmdAYW1kLmNvbT4gd3JvdGU6Cj4+Pj4gVGhlIGRyaXZlciBidWls
ZCBzaG91bGQgd29yayB3aXRob3V0IElPTU1VdjIuIEluIGFtZGtmZC9NYWtlZmlsZSwgd2UKPj4+
PiBoYXZlIHRoaXMgY29uZGl0aW9uOgo+Pj4+Cj4+Pj4gaWZuZXEgKCQoQ09ORklHX0FNRF9JT01N
VV9WMiksKQo+Pj4+IEFNREtGRF9GSUxFUyArPSAkKEFNREtGRF9QQVRIKS9rZmRfaW9tbXUubwo+
Pj4+IGVuZGlmCj4+Pj4KPj4+PiBJbiBhbWRrZmQva2ZkX2lvbW11Lmggd2UgZGVmaW5lIGlubGlu
ZSBzdHVicyBvZiB0aGUgZnVuY3Rpb25zIHRoYXQgYXJlCj4+Pj4gY2F1c2luZyB5b3VyIGxpbmst
ZmFpbHVyZXMgaWYgSU9NTVVfVjIgaXMgbm90IGVuYWJsZWQ6Cj4+Pj4KPj4+PiAjaWYgZGVmaW5l
ZChDT05GSUdfQU1EX0lPTU1VX1YyX01PRFVMRSkgfHwgZGVmaW5lZChDT05GSUdfQU1EX0lPTU1V
X1YyKQo+Pj4+IC4uLiBmdW5jdGlvbiBkZWNsYXJhdGlvbnMgLi4uCj4+Pj4gI2Vsc2UKPj4+PiAu
Li4gc3R1YnMgLi4uCj4+Pj4gI2VuZGlmCj4+PiBSaWdodCwgdGhhdCBpcyB0aGUgcHJvYmxlbSBJ
IHRyaWVkIHRvIGV4cGxhaW4gaW4gbXkgcGF0Y2ggZGVzY3JpcHRpb24uCj4+Pgo+Pj4gU2hvdWxk
IHdlIGp1c3QgZHJvcCB0aGUgJ2ltcGx5JyB0aGVuIGFuZCBhZGQgYSBwcm9wZXIgZGVwZW5kZW5j
eSBsaWtlIHRoaXM/Cj4+Pgo+Pj4gICAgICAgZGVwZW5kcyBvbiBEUk1fQU1ER1BVICYmIChYODZf
NjQgfHwgQVJNNjQgfHwgUFBDNjQpCj4+PiAgICAgICBkZXBlbmRzIG9uIEFNRF9JT01NVV9WMj15
IHx8IERSTV9BTURHUFU9bQo+Pj4KPj4+IEkgY2FuIHNlbmQgYSB2MiBhZnRlciBzb21lIHRlc3Rp
bmcgaWYgeW91IHByZWZlciB0aGlzIHZlcnNpb24uCj4+IE5vLiBNeSBwb2ludCBpcywgdGhlcmUg
c2hvdWxkIG5vdCBiZSBhIGhhcmQgZGVwZW5kZW5jeS4gVGhlIGJ1aWxkIHNob3VsZAo+PiB3b3Jr
IHdpdGhvdXQgQ09ORklHX0FNRF9JT01NVV9WMi4gSSBkb24ndCB1bmRlcnN0YW5kIHdoeSBpdCdz
IG5vdAo+PiB3b3JraW5nIGZvciB5b3UuIEl0IGxvb2tzIGxpa2UgeW91J3JlIGJ1aWxkaW5nIGtm
ZF9pb21tdS5vLCB3aGljaCBzaG91bGQKPj4gbm90IGJlIGhhcHBlbmluZyB3aGVuIEFNRF9JT01N
VV9WMiBpcyBub3QgZW5hYmxlZC4gVGhlIGNvbmRpdGlvbiBpbgo+PiBhbWRrZmQvTWFrZWZpbGUg
c2hvdWxkIG1ha2Ugc3VyZSB0aGF0IGtmZF9pb21tdS5vIGRvZXNuJ3QgZ2V0IGJ1aWx0IHdpdGgK
Pj4geW91ciBrZXJuZWwgY29uZmlnLgo+IEFnYWluLCBhcyBJIGV4cGxhaW5lZCBpbiB0aGUgY2hh
bmdlbG9nIHRleHQsIEFNRF9JT01NVV9WMiBjb25maWd1cmVkIGFzCj4gYSBsb2FkYWJsZSBtb2R1
bGUsIHdoaWxlIEFNREdQVSBpcyBjb25maWd1cmVkIGFzIGJ1aWx0LWluLgpJJ20gc29ycnksIEkg
ZGlkbid0IHJlYWQgaXQgY2FyZWZ1bGx5LiBBbmQgSSB0aG91Z2h0ICJpbXBseSIgd2FzIG1lYW50
CnRvIGZpeCBleGFjdGx5IHRoaXMga2luZCBvZiBpc3N1ZS4KCkkgZG9uJ3Qgd2FudCB0byBjcmVh
dGUgYSBoYXJkIGRlcGVuZGVuY3kgb24gQU1EX0lPTU1VX1YyIGlmIEkgY2FuIGF2b2lkCml0LCBi
ZWNhdXNlIGl0IGlzIG9ubHkgcmVhbGx5IG5lZWRlZCBmb3IgYSBzbWFsbCBudW1iZXIgb2YgQU1E
IEFQVXMsIGFuZApldmVuIHRoZXJlIGl0IGlzIG5vdyBvcHRpb25hbCBmb3IgbW9yZSByZWNlbnQg
b25lcy4KCklzIHRoZXJlIGEgYmV0dGVyIHdheSB0byBhdm9pZCBidWlsZCBmYWlsdXJlcyB3aXRo
b3V0IGNyZWF0aW5nIGEgaGFyZApkZXBlbmRlbmN5P8KgIFRoZSBkb2N1bWVudGF0aW9uIGluCkRv
Y3VtZW50YXRpb24va2J1aWxkL2tjb25maWctbGFuZ3VhZ2UucnN0IHN1Z2dlc3RzIHVzaW5nIGlm
CihJU19SRUFDSEFCTEUoQ09ORklHX0FNRF9JT01NVV9WMikpIHRvIGd1YXJkIHRob3NlIHByb2Js
ZW1hdGljIGZ1bmN0aW9uCmNhbGxzLiBJIHRoaW5rIG1vcmUgZ2VuZXJhbGx5LCB3ZSBjb3VsZCBn
dWFyZCBhbGwgb2Yga2ZkX2lvbW11LmMgd2l0aAoKwqDCoMKgICNpZiBJU19SRUFDSEFCTEUoQ09O
RklHX0FNRF9JT01NVV9WMikKCkFuZCB1c2UgdGhlIHNhbWUgY29uZGl0aW9uIHRvIGRlZmluZSB0
aGUgc3R1YnMgaW4ga2ZkX2lvbW11LmguCgpSZWdhcmRzLArCoCBGZWxpeAoKCj4KPiBUaGUgY2F1
c2VzIGEgbGluayBmYWlsdXJlIGZvciB0aGUgdm1saW51eCBmaWxlLCBiZWNhdXNlIHRoZSBsaW5r
ZXIgY2Fubm90Cj4gcmVzb2x2ZSBhZGRyZXNzZXMgb2YgbG9hZGFibGUgbW9kdWxlcyBhdCBjb21w
aWxlIHRpbWUgLS0gdGhleSBoYXZlCj4gbm90IGJlZW4gbG9hZGVkIHlldC4KPgo+ICAgICAgIEFy
bmQKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

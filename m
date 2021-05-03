Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8029371F86
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 20:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29E76E9FC;
	Mon,  3 May 2021 18:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701D06E9F9;
 Mon,  3 May 2021 18:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z2WfdIQotW4M+A18BGr+nMm3RnwEx8dukDVrjXag+D8qzIKRyK0uG4X7hLtaABauFVEQxxcLzjLsVLqjwxEFW+oWAr5e8acCh5CcVW21k8qH5j2msgFyLefYeKfNgZkHyCfrJmUotQap11f30SN4ZIu2KuzxpQzyHw8aLqlyTWyc/elyKUhSIFyJqt0Y4YkqKQ9CKjJEyURcvIg6de7MthM7xgcP29X3slwYEkMZ3aYn2SX5BnoOWmViVX//k1gi86g+SrQj3eCARX4HQqs5pAlHvrKJlyRzUffuQf3kLDpHU1C6KEgke/WxrQMTg/qBLI0IbmNc9/2MkeXrkcYYMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDxQIY+0o/kLb0HL7OODdZwvTp1NJ68iPuw6afuWqqw=;
 b=J8AcEhT4fvrr1rFKHVkM/ZgmS8stfVNwUS3gqGcgQXIaqSD1SfXu9vkk+3rD3g+o6g1uB9DkDNr/RdQrondAT9SkYbFI88txWapZUV5XfX6BRFe/IIaF0bcW1GLZlDo0TLDw3zd7aVZQW0Fd1KxFCYiuRh/9ZVUy/Ba8YJ8+6DjuQwdB3RTML1MYY4ZkkL1LMWe2bUZKkXf5phXIHl4IWdLDuBdOm/iMEE3NQE+WzBBgFCYBHBoLeH2JZ2f4HGgkXu63qgXzULhM/G6/x9jxrcYAsXExQUrPza6vcb2tV3UgvB1Q1TpUI4HR76J2dQm9xEIAxflFxLnbba9gkuWWog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDxQIY+0o/kLb0HL7OODdZwvTp1NJ68iPuw6afuWqqw=;
 b=SspgYoH9+MLE6/fKGDNCW1Rgro16MG3fedg0IdJ9Ip/fPIzAThna43uGDKV/TgkjGADyz0nNKC9oskS5QewXUvlj0NIIIPRCg3SK1AUx5yFKQud+3Ks+ZSTDFsTtI8Oejdr0e6m5aWGweZ8Oktc1iPqG8Ix2SFI+qAdjEQ4pEto=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5132.namprd12.prod.outlook.com (2603:10b6:408:119::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.40; Mon, 3 May
 2021 18:21:55 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4087.039; Mon, 3 May 2021
 18:21:55 +0000
Subject: Re: [RFC] CRIU support for ROCm
To: Adrian Reber <adrian@lisas.de>
References: <9245171d-ecc9-1bdf-3ecd-cf776dc17855@amd.com>
 <YI2J97Rg4+1+KVNs@lisas.de>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <f8495cad-a532-91d0-a803-035d3da6d8d9@amd.com>
Date: Mon, 3 May 2021 14:21:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <YI2J97Rg4+1+KVNs@lisas.de>
Content-Language: en-US
X-Originating-IP: [142.116.138.207]
X-ClientProxiedBy: YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::23) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.116.138.207) by
 YT1PR01CA0054.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.37 via Frontend Transport; Mon, 3 May 2021 18:21:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae69ebc1-89f6-4b79-f3da-08d90e605503
X-MS-TrafficTypeDiagnostic: BN9PR12MB5132:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5132F9689103677F7F5487A5925B9@BN9PR12MB5132.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ktJcO5pJ8tLvds5GeM4CGWp1eJJb9w06alNIawD1/P1751/BXOpPHep9Dghemz1DpAAI/CaFifkNDPAgobQ59HLebBsS/SiMxBSNERZ0iptc0kXXX/j1E5QWpWcCDxtWW1izrdELel9pIuLLYtRFE6qTHWOXQD2+SavN8iVcPdB3wEn4qMPFxJres3amphPo7AadNpjO2eJpdvENSAMV6J0J6KH6GGzD+6P5PhD7i1a4NXT8qYPdnGK9qfryypjs5rFYSvauWcV28dYtiAmVDoOSGK1LZ63414cdUA9HyZG+78+i41rmFhakmiSRJKJpTQtkv33tV9B0+FNZuyYvZnJhvLIb3Yk48EATvS4wvOISe2uwaQHSXwhsTQGUi4UoSdehclTi3fxC/7MHcesOS0t19zjr7fyylgTNqzy5EOmlycdRwVeCBHQ8JVeTZ54w3gpOUDQSJpo9XB53mNdlrZ/Qn+hITs6ozNh3NoBuvOaF0CZmgEtIliwuidL4T7jDqWJQcxMsq4iYZBpbr0DYt1zfaAIf2v1n6gYQvSWdbTLdyG7xJleP6t6C2tSzUCmmx3yUv9Z3eu1xchC1sW+yqqRQs+smqqDCo8At3Bwo3hvFRMV2Oz8pWMQXOVG9LDFyrhHsWU5sLpzOJfa0Zd5wZcMQsDcpHZveiVqcebcvFPB1zujY9isR/H4luSY+CKUuRpI+erhRO7xvXwXoCO+XSgm6LPdYSuWX1GDL2XIxYMbwnQHxS9TgLwgFAcUBGoiQpAjdyFq3OOSGf08sRAGxCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(66946007)(66476007)(2906002)(66556008)(5660300002)(4326008)(8936002)(6916009)(966005)(6486002)(478600001)(8676002)(44832011)(31686004)(16526019)(54906003)(16576012)(36756003)(956004)(186003)(316002)(31696002)(2616005)(38100700002)(86362001)(83380400001)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NDR0Zi9JZnRxSndCeEw5enVRaFdkNWU0Rjd1L2p1eFZZRnBXSU5FSmd3MENs?=
 =?utf-8?B?Rk1DV2c1RFFwWVJnU1p5Vm1GcTdkdldrRXFqeEVkcEt4YzFWdlR4MFZjWGIy?=
 =?utf-8?B?bDJKN2h2OHhoRWloSlJwSXZXTlBSMDVKRGlBUVByMWY1NTdTbXJKcWo3bnpz?=
 =?utf-8?B?QXJjYS91ZDR5dW9KRnc0UzBKaXo2S0h6cmh0aWIvOVVtMFArM0tlSUU5SFdu?=
 =?utf-8?B?cVJlenMvUTFHbW0zOWhHcWk1WVJnblR1VkRyZFlkdDQwRHgvSUNrYWxLWnVy?=
 =?utf-8?B?NFhLVnVBYW11akhiMURyZmpXU0tieXV2dzkvMVhFTGU2TTRKTHFaRmhydWdk?=
 =?utf-8?B?QTV1bk54MFpUZmhta2pWUkdtUm5WdmdmbW5Pa3pqYWkzb0ltYlhxa2xTYWp0?=
 =?utf-8?B?eGtwQnUzZkNoK1ZaTTJKM2M4SmpoWjYvaDJKb0FMNUNDMkhEVFRVZ2FQaWw3?=
 =?utf-8?B?Q08xeXhubDh6aUNQbWNHK1BaSCt5djFHYlFVbXordElLWDMxWVFHYUE4U0xB?=
 =?utf-8?B?NWtSVTdZK2laa1NtdU1WZVdzM292aHhkTUVCSjltYzR6eGtMcGFwMjhuUjJl?=
 =?utf-8?B?UHEyNER3K2d5UlBEYkJjSk5kYmN6dGRudFZkTUR1ZFY2ZHlHV0ZCb3orWFBt?=
 =?utf-8?B?QnFsN09YbS9HSnlhTmlpaHM2a3FIcEhoU2x2R2NxTytGcXVPNnEvVjMvQUdO?=
 =?utf-8?B?b2pvQW1uWU8xUExMSTg3OVVqMGEzNUtjNkd2aTczMTB4MStrRkNxQVN5cXRk?=
 =?utf-8?B?TGlESVVmaU5JZHBmWlR1RUREbFNvVVV3anJQRlB5eWVyS1ZFUS91VS8yYmo0?=
 =?utf-8?B?ZHQxVzJhZnZuQmlRK0dOT3ArdGdnRFZSVTZsNGZkQjRPVG1CUHNhTXpudmJQ?=
 =?utf-8?B?bVY0ajFOaUNiTm1ubkZ0ZXFLUGRWMUxGTjZHY1B4SzdCWStsN3hHemhPMVgv?=
 =?utf-8?B?OWxscnVyNXo1TUtPV2c2QlA5aUlVVk5rWGVMOWxpTzNzNy9BS3d6UXFQZHVU?=
 =?utf-8?B?TTNVVjZhWDdrZmp2SnRBZ0xtcGNYblZITkFjVDVYanZSWkh3Qk41RHdYUyt3?=
 =?utf-8?B?L2t6WkYvZVVDVnQ5bHZnN080cCtEc3E3dnNiOU1vS2xFQlFHaERCbEV4UWts?=
 =?utf-8?B?TGQxWUUyTTk0a2wyZk9vRXRPWVdVbGM0c0h2YnEzb1R2QXNxQVVPbkpqUHZj?=
 =?utf-8?B?VGIvdEdXcHcySVBaZzZPWFJJZmx3VDV3MGNMZGtiRnhZMmNTeCsrUmNGckRx?=
 =?utf-8?B?TzNaRDNzUi9oK2VYeXB6U082bmxOMFMrVVd3MjBQcHY1TjdWVzhxcTRiSlIx?=
 =?utf-8?B?WklVSVExTE5Rcnlkb1dwWWFJc1E5K0Z6bkxHbEFOakZzeGFaWHEzY2VzQTg1?=
 =?utf-8?B?WVk2MHo3aTF3OEdCUkY3Q2FaMlE5RDY3R3Q4empMUDEwUW9sNEVNNzI0RUp1?=
 =?utf-8?B?eDJ5elFaS3EyZmZHMFAvcmYxN29QN2JQM3lrazJaMUphZk5yT3FmSDEvdThu?=
 =?utf-8?B?RVVsUE1ILzdtR3laNE1jeUphU2QxWElKVDdDN014MlRMSTQySWRsVFY2Nkdh?=
 =?utf-8?B?K3hTMmhsNEFBWVM4dXo4bmdZL2lVRXBiSGwrRXBJY2pPbmpsZkw2dHpINExS?=
 =?utf-8?B?ZnA4Vm8yTXgyZ3hRSjA4cWNSeEdnY0UxRXdkVjZHcTA4QThmL2JRcmQ4R3lI?=
 =?utf-8?B?TEtwMWwvN281TmFIRE9JU2JsdUVjY2NsRUFSbXdra0dhR2U0VjVxbFZXeEhO?=
 =?utf-8?Q?3a/ldboC7vlUx206zNTLFtuvCIjQpkbaeQzhx+V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae69ebc1-89f6-4b79-f3da-08d90e605503
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 18:21:55.7071 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5xI2OImfa6lQCyxZkyAh/MiQbtQPkhPJw/DaYiKbYhEH/Gyt0VGUSGiQYjHCRJEaLQogzYUb5WhEa7axnsMi8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5132
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
Cc: Alexander Mihalicyn <alexander@mihalicyn.com>,
 Pavel Emelyanov <ovzxemul@gmail.com>, Pavel Tikhomirov <snorcht@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, "Bhardwaj,
 Rajneesh" <Rajneesh.Bhardwaj@amd.com>, criu@openvz.org, "Yat Sin,
 David" <David.YatSin@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjAyMS0wNS0wMSB1bSAxOjAzIHAubS4gc2NocmllYiBBZHJpYW4gUmViZXI6Cj4gT24gRnJp
LCBBcHIgMzAsIDIwMjEgYXQgMDk6NTc6NDVQTSAtMDQwMCwgRmVsaXggS3VlaGxpbmcgd3JvdGU6
Cj4+IFdlIGhhdmUgYmVlbiB3b3JraW5nIG9uIGEgcHJvdG90eXBlIHN1cHBvcnRpbmcgQ1JJVSAo
Q2hlY2twb2ludC9SZXN0b3JlCj4+IEluIFVzZXJzcGFjZSkgZm9yIGFjY2VsZXJhdGVkIGNvbXB1
dGUgYXBwbGljYXRpb25zIHJ1bm5pbmcgb24gQU1EIEdQVXMKPj4gdXNpbmcgUk9DbSAoUmFkZW9u
IE9wZW4gQ29tcHV0ZSBQbGF0Zm9ybSkuIFdlJ3JlIGhhcHB5IHRvIGZpbmFsbHkgc2hhcmUKPj4g
dGhpcyB3b3JrIHB1YmxpY2x5IHRvIHNvbGljaXQgZmVlZGJhY2sgYW5kIGFkdmljZS4gVGhlIGVu
ZC1nb2FsIGlzIHRvCj4+IGdldCB0aGlzIHdvcmsgaW5jbHVkZWQgdXBzdHJlYW0gaW4gTGludXgg
YW5kIENSSVUuIEEgc2hvcnQgd2hpdGVwYXBlcgo+PiBkZXNjcmliaW5nIG91ciBkZXNpZ24gYW5k
IGludGVudGlvbiBjYW4gYmUgZm91bmQgb24gR2l0aHViOgo+PiBodHRwczovL2dpdGh1Yi5jb20v
UmFkZW9uT3BlbkNvbXB1dGUvY3JpdS90cmVlL2NyaXUtZGV2L3Rlc3Qvb3RoZXJzL2V4dC1rZmQv
UkVBRE1FLm1kCj4+Cj4+IFdlIGhhdmUgUkZDIHBhdGNoIHNlcmllcyBmb3IgdGhlIGtlcm5lbCAo
YmFzZWQgb24gQWxleCBEZXVjaGVyJ3MKPj4gYW1kLXN0YWdpbmctZHJtLW5leHQgYnJhbmNoKSBh
bmQgZm9yIENSSVUgaW5jbHVkaW5nIGEgbmV3IHBsdWdpbiBhbmQgYQo+PiBmZXcgY29yZSBDUklV
IGNoYW5nZXMuIEkgd2lsbCBzZW5kIHRob3NlIHRvIHRoZSByZXNwZWN0aXZlIG1haWxpbmcgbGlz
dHMKPj4gc2VwYXJhdGVseSBpbiBhIG1pbnV0ZS4gVGhleSBjYW4gYWxzbyBiZSBmb3VuZCBvbiBH
aXRodWIuCj4+Cj4+ICAgICBDUklVK3BsdWdpbjogaHR0cHM6Ly9naXRodWIuY29tL1JhZGVvbk9w
ZW5Db21wdXRlL2NyaXUvY29tbWl0cy9jcml1LWRldgo+PiAgICAgS2VybmVsIChLRkQpOgo+PiAg
ICAgaHR0cHM6Ly9naXRodWIuY29tL1JhZGVvbk9wZW5Db21wdXRlL1JPQ0stS2VybmVsLURyaXZl
ci9jb21taXRzL2Z4a2FtZC9jcml1LXdpcAo+Pgo+PiBBdCB0aGlzIHBvaW50IHRoaXMgaXMgdmVy
eSBtdWNoIGEgd29yayBpbiBwcm9ncmVzcyBhbmQgbm90IHJlYWR5IGZvcgo+PiB1cHN0cmVhbSBp
bmNsdXNpb24uIFRoZXJlIGFyZSBzdGlsbCBzZXZlcmFsIG1pc3NpbmcgZmVhdHVyZXMsIGtub3du
Cj4+IGlzc3VlcywgYW5kIG9wZW4gcXVlc3Rpb25zIHRoYXQgd2Ugd291bGQgbGlrZSB0byBzdGFy
dCBhZGRyZXNzaW5nIHdpdGgKPj4geW91ciBmZWVkYmFjay4KPj4KPj4gV2hhdCdzIHdvcmtpbmcg
YW5kIHRlc3RlZCBhdCB0aGlzIHBvaW50Ogo+Pgo+PiAgICogQ2hlY2twb2ludCBhbmQgcmVzdG9y
ZSBhY2NlbGVyYXRlZCBtYWNoaW5lIGxlYXJuaW5nIGFwcHM6IFB5VG9yY2gKPj4gICAgIHJ1bm5p
bmcgQmVydCBvbiBzeXN0ZW1zIHdpdGggMSBvciAyIEdQVXMgKE1JNTAgb3IgTUkxMDApLCAxMDAl
Cj4+ICAgICB1bm1vZGlmaWVkIHVzZXIgbW9kZSBzdGFjawo+PiAgICogQ2hlY2twb2ludCBvbiBv
bmUgc3lzdGVtLCByZXN0b3JlIG9uIGEgZGlmZmVyZW50IHN5c3RlbQo+PiAgICogQ2hlY2twb2lu
dCBvbiBvbmUgR1BVLCByZXN0b3JlIG9uIGEgZGlmZmVyZW50IEdQVQo+IFRoaXMgaXMgdmVyeSBp
bXByZXNzaXZlLiBBcyBmYXIgYXMgSSBrbm93IHRoaXMgaXMgdGhlIGZpcnN0IGxhcmdlcgo+IHBs
dWdpbiB3cml0dGVuIGZvciBDUklVIGFuZCBwdWJsaWNseSBwdWJsaXNoZWQuIEl0IGlzIGFsc28g
dGhlIGZpcnN0IEdQVQo+IHN1cHBvcnRlZCBhbmQgcGVvcGxlIGhhdmUgYmVlbiBhc2tpbmcgdGhp
cyBmb3IgbWFueSB5ZWFycy4gSXQgaXMgaW4gZmFjdAo+IHRoZSBmaXJzdCBoYXJkd2FyZSBkZXZp
Y2Ugc3VwcG9ydGVkIHRocm91Z2ggYSBwbHVnaW4uCj4KPj4gTWFqb3IgS25vd24gaXNzdWVzOgo+
Pgo+PiAgICogVGhlIEtGRCBpb2N0bCBBUEkgaXMgbm90IGZpbmFsOiBOZWVkcyBhIGNvbXBsZXRl
IHJlZGVzaWduIHRvIGFsbG93Cj4+ICAgICBmdXR1cmUgZXh0ZW5zaW9uIHdpdGhvdXQgYnJlYWtp
bmcgdGhlIEFCSQo+PiAgICogVmVyeSBzbG93OiBOZWVkIHRvIGltcGxlbWVudCBETUEgdG8gZHVt
cCBWUkFNIGNvbnRlbnRzCj4+Cj4+IE1pc3Npbmcgb3IgaW5jb21wbGV0ZSBmZWF0dXJlczoKPj4K
Pj4gICAqIFN1cHBvcnQgZm9yIHRoZSBuZXcgS0ZEIFNWTSBBUEkKPj4gICAqIENoZWNrIGRldmlj
ZSB0b3BvbG9neSBkdXJpbmcgcmVzdG9yZQo+PiAgICogQ2hlY2twb2ludCBhbmQgcmVzdG9yZSBt
dWx0aXBsZSBwcm9jZXNzZXMKPj4gICAqIFN1cHBvcnQgZm9yIGFwcGxpY2F0aW9ucyB1c2luZyBN
ZXNhIGZvciB2aWRlbyBkZWNvZGUvZW5jb2RlCj4+ICAgKiBUZXN0aW5nIHdpdGggbW9yZSBkaWZm
ZXJlbnQgR1BVcyBhbmQgd29ya2xvYWRzCj4+Cj4+IEJpZyBPcGVuIHF1ZXN0aW9uczoKPj4KPj4g
ICAqIFdoYXQncyB0aGUgcHJlZmVycmVkIHdheSB0byBwdWJsaXNoIG91ciBDUklVIHBsdWdpbj8g
SW4tdHJlZSBvcgo+PiAgICAgb3V0LW9mLXRyZWU/Cj4gSSB3b3VsZCBkbyBpdCBpbi10cmVlLgo+
Cj4+ICAgKiBXaGF0J3MgdGhlIHByZWZlcnJlZCB3YXkgdG8gZGlzdHJpYnV0ZSBvdXIgQ1JJVSBw
bHVnaW4/IFNvdXJjZT8KPj4gICAgIEJpbmFyeSAuc28/IFdob2xlIENSSVU/IEp1c3QgaW4tYm94
IHN1cHBvcnQ/Cj4gQXMgeW91IGFyZSBwbGFuaW5nIHRvIHB1Ymxpc2ggdGhlIHNvdXJjZSBJIHdv
dWxkIG1ha2UgaXQgcGFydCBvZiB0aGUKPiBDUklVIHJlcG9zaXRvcnkgYW5kIHRoaXMgd2F5IGl0
IHdpbGwgZmluZCBpdHMgd2F5IHRvIHRoZSBwYWNrYWdlcyBpbiB0aGUKPiBkaWZmZXJlbnQgZGlz
dHJpYnV0aW9ucy4KClRoYW5rcy4gVGhlc2UgYXJlIHRoZSBhbnN3ZXJzIEkgd2FzIGhvcGluZyBm
b3IuCgoKPgo+IERvZXMgdGhlIHBsdWdpbiByZXF1aXJlIGFueSBhZGRpdGlvbmFsIGRlcGVuZGVu
Y2llcz8gSWYgdGhlcmUgaXMgbm8KPiBhZGRpdGlvbmFsIGRlcGVuZGVuY3kgdG8gYSBsaWJyYXJ5
IHRoZSBwbHVnaW4gY2FuIGJlIGVhc2lseSBiZSBwYXJ0IG9mCj4gdGhlIGV4aXN0aW5nIHBhY2th
Z2VzLgoKVGhlIERNQSBzb2x1dGlvbiB3ZSdyZSBjb25zaWRlcmluZyBmb3Igc2F2aW5nIFZSQU0g
Y29udGVudHMgd291bGQgYWRkIGEKZGVwZW5kZW5jeSBvbiBsaWJkcm0gYW5kIGxpYmRybS1hbWRn
cHUuCgoKPgo+PiAgICogSWYgb3VyIHBsdWdpbiBjYW4gYmUgdXBzdHJlYW1lZCBpbiB0aGUgQ1JJ
VSB0cmVlLCB3aGF0IHdvdWxkIGJlIHRoZQo+PiAgICAgcmlnaHQgZGlyZWN0b3J5Pwo+IEkgd291
bGQganVzdCBwdXQgaXQgaW50byBjcml1L3BsdWdpbnMvCgpTb3VuZHMgZ29vZC4KCgo+Cj4gSXQg
d291bGQgYWxzbyBiZSBnb29kIHRvIGhhdmUgeW91ciBwYXRjaHNldCBzdWJtaXR0ZWQgYXMgYSBQ
UiBvbiBnaXRodWIKPiB0byBoYXZlIG91ciBub3JtYWwgQ0kgdGVzdCBjb3ZlcmFnZSBvZiB0aGUg
Y2hhbmdlcy4KCldlJ2xsIHByb2JhYmx5IGhhdmUgdG8gcmVjcmVhdGUgb3VyIHJlcG9zaXRvcnkg
dG8gc3RhcnQgYXMgYSBmb3JrIG9mIHRoZQp1cHN0cmVhbSBDUklVIHJlcG9zaXRvcnksIHNvIHRo
YXQgd2UgY2FuIGVhc2lseSBzZW5kIHB1bGwtcmVxdWVzdHMuCldlJ3JlIG5vdCBnb2luZyB0byBi
ZSByZWFkeSBmb3IgdXBzdHJlYW1pbmcgZm9yIGEgZmV3IG1vcmUgbW9udGhzLApwcm9iYWJseS4g
RG8geW91IHdhbnQgdG8gZ2V0IG9jY2FzaW9uYWx5IHB1bGwgcmVxdWVzdHMgYW55d2F5LCBqdXN0
IHRvCnJ1biBDSSBvbiBvdXIgd29yay1pbi1wcm9ncmVzcyBjb2RlPwoKUmVnYXJkcywKwqAgRmVs
aXgKCgo+Cj4gCQlBZHJpYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1F4348A6C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 08:50:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC6826ECB9;
	Thu, 25 Mar 2021 07:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C546ECB9
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 07:50:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nagzsmoe2C6klV55CGPKNwV6fTFT3SqcGzZS4Ke7Ue2RuE985E+KQp9Y/1biHIANVdHdA0koT/q6LykJxULGRw3TzA4DqTlNJ/WrLCalrZwyi4UwiASNr3YLKNor5wunxDGWG/YjGxSpUzoNj47tjncYtyeu/veV/kltc91+g2IvVSWHklUUreGRQexiiexYNcor78SyJ7o0GJC2PrImToVtdYi2oCDH77GuWoXs9gSISLD3gs9EEVDUhPIEZG6Iryzp1QLFo00RsETohFwJNsfnDc65vb4L7xss2hJeLx8c4ahkKBHtTHX8njNvSs5Vt2mENM0xXJNl4nkAwZjG9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9r9bKOhYFHV99IZFfP6g+saOadHEJB6bOK1K1YNqzg=;
 b=jpuW+E1VINhD2jZDocVUFHA3f6MqLeq+EFtSxzazMr9Jx9wSmXAmyEVVUAFbsF2b6UF2fFY8pv2mkn81WATtvx6zdOPLYCHHpoPU0XPBRbMHZ8vKmihRNn/H/0O/9r2XbqIhwdXSpyXG+vaqYMPSdRVi0JuaPRGLbpW2iVEY95oIGCQCLqZqSVeyBVFzh9T7Nei1By5REravhBbFXo0gvmY36siTr/8+Dm+4q7Q4AfmE1PvxwxFYwCf07SR9PUaifI5eS9OpwbQi+9LGCpiJsmPpfJ7uHVXWdefsH8p8UygSr8Hz2hrbM2Oi2rA/LSGuTExCJZroBiYs5wphsrhZrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P9r9bKOhYFHV99IZFfP6g+saOadHEJB6bOK1K1YNqzg=;
 b=KuPxE881spDoX9lr266hQrtyEMpa7arM3tAMOjj9VANwcWWYYDNjmntJgG9rnAn7VO+P92oZCUxwaORtZZumIZ7Qc21vTmv0up45OFWDj9D2PdpTTMK/LwmMxygFKB6bFGeiVRYjtq++bsRNwoeqrsJUU4hRVn9aKKdmqFt4Pn4=
Authentication-Results: linux-foundation.org; dkim=none (message not signed)
 header.d=none;linux-foundation.org; dmarc=none action=none
 header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4333.namprd12.prod.outlook.com (2603:10b6:208:1d3::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Thu, 25 Mar
 2021 07:50:05 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 07:50:05 +0000
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Jason Gunthorpe <jgg@nvidia.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
References: <YFsM23t2niJwhpM/@phenom.ffwll.local>
 <20210324122430.GW2356281@nvidia.com>
 <e12e2c49-afaf-dbac-b18c-272c93c83e06@shipmail.org>
 <20210324124127.GY2356281@nvidia.com>
 <6c9acb90-8e91-d8af-7abd-e762d9a901aa@shipmail.org>
 <20210324134833.GE2356281@nvidia.com>
 <0b984f96-00fb-5410-bb16-02e12b2cc024@shipmail.org>
 <20210324163812.GJ2356281@nvidia.com>
 <08f19e80-d6cb-8858-0c5d-67d2e2723f72@amd.com>
 <730eb2ff-ba98-2393-6d42-61735e3c6b83@shipmail.org>
 <20210324231419.GR2356281@nvidia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d7aaf556-2f0c-f5b5-659f-f99496cede1e@amd.com>
Date: Thu, 25 Mar 2021 08:49:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210324231419.GR2356281@nvidia.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:a792:596e:3412:8626]
X-ClientProxiedBy: AM8P190CA0005.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:219::10) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:a792:596e:3412:8626]
 (2a02:908:1252:fb60:a792:596e:3412:8626) by
 AM8P190CA0005.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.28 via Frontend Transport; Thu, 25 Mar 2021 07:50:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 312753a1-717a-43b2-2ef8-08d8ef629a88
X-MS-TrafficTypeDiagnostic: MN2PR12MB4333:
X-Microsoft-Antispam-PRVS: <MN2PR12MB433360DFF43093E16589AE3A83629@MN2PR12MB4333.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dBu9a8UYCmGNP6F++xWDrHM0umHuJWSFldiUcCDHWRQ9ZdSvBwawAcAGHjbOYZxshckwLUr1R9z6ESJ1NPz+hMNZLZuNQNzpxeMytKVpalHAU4Fc7hQ2SsSe/gIYB7vnLNlTcRoTaFO3XwOLxOqStkVqerTTYkcF5XmYx8vF7dtsj7HUEg7juywZIo0lqIsO0DUA/pWSQYJ6DCy/1MFfDO1kIuiaXcIDwN7BJF0NN2Q9Ec9bfzuWZpxDhnwkdAQ8VzrGroEkxKt2VhxorshN8a/+8FyiU6HR+kyAO9MVBbbb15jYZXIxAQoPR0rwGRk8gyhWgihafH+JMfMo2Vp++dagNVjSFj6jJ1A7cr+z1e15UuqQaVvJLb15ZWAZ4UQ/BVZzMach9csWU8JXlmb1skLhdq0HwANsIGk1XusaerxXIMj0crKPs2neR1DDcN2kbDlKPC8dpJd/Kj8mifefbRmRRKo2m/1fe/dXAspxpD+RA++8rADvWghDrvBRPSiNiHtVhA3LUqVSZMbr/Kb60DEUEqyw3p/6oJ0oD4N9epYI4fqm/17oVzJsxwXxHS+LMHV4yw+VdQ70LXz8TrIDb8bQgUdNvIYsKXe5nJExXdgWyUX/grkEnAuIuwCYkRpnCnXTKqqqMg5he7d4HhQufnSXZKYfY9UdZG/auwAwxqZvz/bg9tBzGkhkam7Wk5TT7Ta1/pZnbcAs6s7eTX71kgb9QDf29x2Goz1oRxUyLlo+LqbdKWUxmw5sOwL0cnJyT0PScU9OwMZCjdT5lVlqWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(346002)(39860400002)(376002)(396003)(53546011)(5660300002)(8936002)(52116002)(6666004)(6486002)(38100700001)(66476007)(36756003)(2906002)(66556008)(8676002)(66946007)(2616005)(66574015)(83380400001)(186003)(54906003)(478600001)(16526019)(31696002)(4326008)(31686004)(316002)(110136005)(86362001)(14583001)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aS9XR1dNNkJvNXhoYm5OdFJTMDVMM2dEcEVDTmZWMWZnNmtTLzMzSkU4TERS?=
 =?utf-8?B?UE9GNEV1NEh3QWFFRnN1Ujlvbm90VGdqOFRwUzE4MXBpUzlOdzFNUnUxQ3h5?=
 =?utf-8?B?bVZzQUJQbXlYSGR2cVFhZVJZMmNYaU5WejVlTWxqUGwxd1ppVDFraGdsc20w?=
 =?utf-8?B?NjFFRTNjU1hoM2lOWjVqeFdBU2lMNjQ1MnhoQjZDb1M0OFlBVSszMGQ4VEJO?=
 =?utf-8?B?cTVkeXZaWkZkT3FnL2tqZStXdm9EdVd6WW8rbmJJcnlndkVuWHZJSWZWeDNJ?=
 =?utf-8?B?cEpFOWNtb2tyL3N2Nm43ZW55WUpwS2lwN2JmbUd0dVorSHNScXp2UmJac25Y?=
 =?utf-8?B?MVVkM3B1RUxyYUF4MS9IUThBNnZ2KzdiWTVYK1hlUmRYeUJIVDFyaGNETERR?=
 =?utf-8?B?OWprSDVGbnNJbTVVRlVlUXlGSHVFdE9qTEhmVnFXQ3Z0Y3hoK0I2Rm9qU0dJ?=
 =?utf-8?B?ZlRyd0ZDcjlucDR1TFpzZmpLVjJRRmZSVGFZL2k5bnlNRWdZZXRFUHBsTnFv?=
 =?utf-8?B?TlFpOWErLytiK3UrVHUwdHZiT1FrbStxOVRHQUxjKytjdzFVa2Jwd085TGc4?=
 =?utf-8?B?dVNRMDNqeG1ja2FqcWFBK3ZUSW8xZTJkdXBCV1hvZ3hRNFZyWkM2d0w1TG5i?=
 =?utf-8?B?YlU2VEw1N2ZnQU5rTTk4bHN5TzhReTkxVFgrZW1yK1NBODB4dllXcUw0Unk1?=
 =?utf-8?B?VHRaUXordUxVRnVrWlZxVzE4ZGJmR3k2Sm80UEkzOE5HNCtpUGR3RThEaWk5?=
 =?utf-8?B?dlVyUVd0UHFmOGQzQjFJUitCUDZsM0p6NGlQYWVqMENuNkJHbys4NG84RE02?=
 =?utf-8?B?dXE4MEIzU1JxK29SVEFicytrcUFZK29scmN1U2lQdkY5YzBCQ3pxRkIrQThu?=
 =?utf-8?B?OUVBS0h5S2dFd1o5SFFLMy9sdGtCdVcrOHdobEcyZjRuVzRMNnpiaWRQZjhy?=
 =?utf-8?B?R3FGeEw4U0k5UHlzM1NGdHlRT0xocEdhamE3T0lLdjIzdE01VkxqT2ZzMXVK?=
 =?utf-8?B?dnVmNmROSDRiTGM1MG1UdzlJdXRoZjlrSzZ4Q3pneWxFWTR3RTU3YWxVb3Rs?=
 =?utf-8?B?UnU4NnB5T2U1WkJWZ2x2MnZkL0owQmlodFlFYmUvc3dLdTluYitSSHJyNGVL?=
 =?utf-8?B?Z0NaQjNSazJ5alNZL3VKeGhtaDNTd1JaWVkvYlM2WkpUYzRIaGFSZFFYVEdD?=
 =?utf-8?B?Nk9QaG1GOGRzZE5wWUZ3eXZWVXZTL2xoY24vUWZxVkprZ3RCV3k5bDg1OWw5?=
 =?utf-8?B?MkdGL2ZqbjB6K1cvYlJzS1diWFRCbzVUdmpkS2lQUXB0MkpRN1k0azBqWUI1?=
 =?utf-8?B?dDFETTJtZExkaVZCQkpUTU5JLzBrTVFBQlJuVnl2cXR2dVcxc2hjOGMxQUw0?=
 =?utf-8?B?a1l3NmZTOGlmZ3h4RWl6a1lCZGQvTzBJc2x0WEtzZlhpMjUrbHlQNGRRMzZx?=
 =?utf-8?B?ejlrdDJJMDM5bSt0NC9WSXc1Y1ZvVGh1MlM1ZEVyWGlUQUkrbllLdTNKUWRI?=
 =?utf-8?B?djAxc2oyYnhqRldkUm0yMDE4RlVGbVluaVJQVEpnRFU3dW9DdHBrSzh6SE5J?=
 =?utf-8?B?NEJwL1d4THU2OE1VNC9aa1lvTlBtQ25vVjhwTHhCZk10NDgxSmkvNW1sMVdQ?=
 =?utf-8?B?aStoSlNsKzBkeXBPNnlmQlBhVDlOQ0xHMmt2Sndjb0FtalZudjNnalVCUVlG?=
 =?utf-8?B?ckFvMUYvanFXQlVQZjRVajNsY0hPM1RKVTBJd1FOOHJrcXdqTkJUNERGb2RO?=
 =?utf-8?B?ZkpkYjZrV1JLV0xHZFpDTEdsRVVCVGk3MjdoN1MvQmVaY0VVOHhlVnZBWnoy?=
 =?utf-8?B?ZVZJamJsTS83MXhBQkRBcHpUaTNTbjlvNnBTUlc1ekVPMUIyMGg5bFdXbENw?=
 =?utf-8?Q?o1qtYahb4HT+N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 312753a1-717a-43b2-2ef8-08d8ef629a88
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2021 07:50:05.2614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3vnhZjyAsYjfb+pC7O72zagz9KBnxpiqH1TSOuqrzZQ0JXMdJJ3WTcheODCL4piT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4333
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
Cc: David Airlie <airlied@linux.ie>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDMuMjEgdW0gMDA6MTQgc2NocmllYiBKYXNvbiBHdW50aG9ycGU6Cj4gT24gV2VkLCBN
YXIgMjQsIDIwMjEgYXQgMDk6MDc6NTNQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVs
KSB3cm90ZToKPj4gT24gMy8yNC8yMSA3OjMxIFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+
Pj4KPj4+IEFtIDI0LjAzLjIxIHVtIDE3OjM4IHNjaHJpZWIgSmFzb24gR3VudGhvcnBlOgo+Pj4+
IE9uIFdlZCwgTWFyIDI0LCAyMDIxIGF0IDA0OjUwOjE0UE0gKzAxMDAsIFRob21hcyBIZWxsc3Ry
w7ZtIChJbnRlbCkKPj4+PiB3cm90ZToKPj4+Pj4gT24gMy8yNC8yMSAyOjQ4IFBNLCBKYXNvbiBH
dW50aG9ycGUgd3JvdGU6Cj4+Pj4+PiBPbiBXZWQsIE1hciAyNCwgMjAyMSBhdCAwMjozNTozOFBN
ICswMTAwLCBUaG9tYXMgSGVsbHN0csO2bQo+Pj4+Pj4gKEludGVsKSB3cm90ZToKPj4+Pj4+Cj4+
Pj4+Pj4+IEluIGFuIGlkZWFsIHdvcmxkIHRoZSBjcmVhdGlvbi9kZXN0cnVjdGlvbiBvZiBwYWdl
Cj4+Pj4+Pj4+IHRhYmxlIGxldmVscyB3b3VsZAo+Pj4+Pj4+PiBieSBkeW5hbWljIGF0IHRoaXMg
cG9pbnQsIGxpa2UgVEhQLgo+Pj4+Pj4+IEhtbSwgYnV0IEknbSBub3Qgc3VyZSB3aGF0IHByb2Js
ZW0gd2UncmUgdHJ5aW5nIHRvIHNvbHZlCj4+Pj4+Pj4gYnkgY2hhbmdpbmcgdGhlCj4+Pj4+Pj4g
aW50ZXJmYWNlIGluIHRoaXMgd2F5Pwo+Pj4+Pj4gV2UgYXJlIHRyeWluZyB0byBtYWtlIGEgc2Vu
c2libGUgZHJpdmVyIEFQSSB0byBkZWFsIHdpdGggaHVnZSBwYWdlcy4KPj4+Pj4+PiBDdXJyZW50
bHkgaWYgdGhlIGNvcmUgdm0gcmVxdWVzdHMgYSBodWdlIHB1ZCwgd2UgZ2l2ZSBpdAo+Pj4+Pj4+
IG9uZSwgYW5kIGlmIHdlCj4+Pj4+Pj4gY2FuJ3Qgb3IgZG9uJ3Qgd2FudCB0byAoYmVjYXVzZSBv
ZiBkaXJ0eS10cmFja2luZywgZm9yCj4+Pj4+Pj4gZXhhbXBsZSwgd2hpY2ggaXMKPj4+Pj4+PiBh
bHdheXMgZG9uZSBvbiA0SyBwYWdlLWxldmVsKSB3ZSBqdXN0IHJldHVybgo+Pj4+Pj4+IFZNX0ZB
VUxUX0ZBTExCQUNLLCBhbmQgdGhlCj4+Pj4+Pj4gZmF1bHQgaXMgcmV0cmllZCBhdCBhIGxvd2Vy
IGxldmVsLgo+Pj4+Pj4gV2VsbCwgbXkgdGhvdWdodCB3b3VsZCBiZSB0byBtb3ZlIHRoZSBwdGUg
cmVsYXRlZCBzdHVmZiBpbnRvCj4+Pj4+PiB2bWZfaW5zZXJ0X3JhbmdlIGluc3RlYWQgb2YgcmVj
dXJzaW5nIGJhY2sgdmlhIFZNX0ZBVUxUX0ZBTExCQUNLLgo+Pj4+Pj4KPj4+Pj4+IEkgZG9uJ3Qg
a25vdyBpZiB0aGUgbG9ja2luZyB3b3JrcyBvdXQsIGJ1dCBpdCBmZWVscyBjbGVhbmVyIHRoYXQg
dGhlCj4+Pj4+PiBkcml2ZXIgdGVsbHMgdGhlIHZtZiBob3cgYmlnIGEgcGFnZSBpdCBjYW4gc3R1
ZmYgaW4sIG5vdCB0aGUgdm0KPj4+Pj4+IHRlbGxpbmcgdGhlIGRyaXZlciB0byBzdHVmZiBpbiBh
IGNlcnRhaW4gc2l6ZSBwYWdlIHdoaWNoIGl0IG1pZ2h0IG5vdAo+Pj4+Pj4gd2FudCB0byBkby4K
Pj4+Pj4+Cj4+Pj4+PiBTb21lIGRldmljZXMgd2FudCB0byB3b3JrIG9uIGEgaW4tYmV0d2VlbiBw
YWdlIHNpemUgbGlrZSA2NGsgc28gdGhleQo+Pj4+Pj4gY2FuJ3QgZm9ybSAyTSBwYWdlcyBidXQg
dGhleSBjYW4gc3R1ZmYgNjRrIG9mIDRLIHBhZ2VzIGluIGEgYmF0Y2ggb24KPj4+Pj4+IGV2ZXJ5
IGZhdWx0Lgo+Pj4+PiBIbW0sIHllcywgYnV0IHdlIHdvdWxkIGluIHRoYXQgY2FzZSBiZSBsaW1p
dGVkIGFueXdheSB0byBpbnNlcnQgcmFuZ2VzCj4+Pj4+IHNtYWxsZXIgdGhhbiBhbmQgZXF1YWwg
dG8gdGhlIGZhdWx0IHNpemUgdG8gYXZvaWQgZXh0ZW5zaXZlIGFuZAo+Pj4+PiBwb3NzaWJseQo+
Pj4+PiB1bm5lY2Vzc2FyeSBjaGVja3MgZm9yIGNvbnRpZ291cyBtZW1vcnkuCj4+Pj4gV2h5PyBU
aGUgaW5zZXJ0IGZ1bmN0aW9uIGlzIHdhbGtpbmcgdGhlIHBhZ2UgdGFibGVzLCBpdCBqdXN0IHVw
ZGF0ZXMKPj4+PiB0aGluZ3MgYXMgdGhleSBhcmUuIEl0IGxlYXJucyB0aGUgYXJyYWdlbWVudCBm
b3IgZnJlZSB3aGlsZSBkb2luZyB0aGUKPj4+PiB3YWxrLgo+Pj4+Cj4+Pj4gVGhlIGRldmljZSBo
YXMgdG8gYWx3YXlzIHByb3ZpZGUgY29uc2lzdGVudCBkYXRhLCBpZiBpdCBvdmVybGFwcyBpbnRv
Cj4+Pj4gcGFnZXMgdGhhdCBhcmUgYWxyZWFkeSBwb3B1bGF0ZWQgdGhhdCBpcyBmaW5lIHNvIGxv
bmcgYXMgaXQgaXNuJ3QKPj4+PiBjaGFuZ2luZyB0aGVpciBhZGRyZXNzZXMuCj4+Pj4KPj4+Pj4g
QW5kIHRoZW4gaWYgd2UgY2FuJ3Qgc3VwcG9ydCB0aGUgZnVsbCBmYXVsdCBzaXplLCB3ZSdkIG5l
ZWQgdG8KPj4+Pj4gZWl0aGVyIHByZXN1bWUgYSBzaXplIGFuZCBhbGlnbm1lbnQgb2YgdGhlIG5l
eHQgbGV2ZWwgb3Igc2VhcmNoIGZvcgo+Pj4+PiBjb250aWdvdXMgbWVtb3J5IGluIGJvdGggZGly
ZWN0aW9ucyBhcm91bmQgdGhlIGZhdWx0IGFkZHJlc3MsCj4+Pj4+IHBlcmhhcHMgdW5uZWNlc3Nh
cmlseSBhcyB3ZWxsLgo+Pj4+IFlvdSBkb24ndCByZWFsbHkgbmVlZCB0byBjYXJlIGFib3V0IGxl
dmVscywgdGhlIGRldmljZSBzaG91bGQgYmUKPj4+PiBmYXVsdGluZyBpbiB0aGUgbGFyZ2VzdCBt
ZW1vcnkgcmVnaW9ucyBpdCBjYW4gd2l0aGluIGl0cyBlZmZpY2llbmN5Lgo+Pj4+Cj4+Pj4gSWYg
aXQgd29ya3Mgb24gNE0gcGFnZXMgdGhlbiBpdCBzaG91bGQgYmUgZmF1bHRpbmcgNE0gcGFnZXMu
IFRoZSBwYWdlCj4+Pj4gc2l6ZSBvZiB0aGUgdW5kZXJseWluZyBDUFUgZG9lc24ndCByZWFsbHkg
bWF0dGVyIG11Y2ggb3RoZXIgdGhhbiBzb21lCj4+Pj4gdHVuaW5nIHRvIGltcGFjdCBob3cgdGhl
IGRldmljZSdzIGFsbG9jYXRvciB3b3Jrcy4KPj4gWWVzLCBidXQgdGhlbiB3ZSdkIGJlIGFkZGlu
ZyBhIGxvdCBvZiBjb21wbGV4aXR5IGludG8gdGhpcyBmdW5jdGlvbiB0aGF0IGlzCj4+IGFscmVh
ZHkgcHJvdmlkZWQgYnkgdGhlIGN1cnJlbnQgaW50ZXJmYWNlIGZvciBEQVgsIGZvciBsaXR0bGUg
b3Igbm8gZ2FpbiwgYXQKPj4gbGVhc3QgaW4gdGhlIGRybS90dG0gc2V0dGluZy4gUGxlYXNlIHRo
aW5rIG9mIHRoZSBmb2xsb3dpbmcgc2l0dWF0aW9uOiBZb3UKPj4gZ2V0IGEgZmF1bHQsIHlvdSBk
byBhbiBleHRlbnNpdmUgdGltZS1jb25zdW1pbmcgc2NhbiBvZiB5b3VyIFZSQU0gYnVmZmVyCj4+
IG9iamVjdCBpbnRvIHdoaWNoIHRoZSBmYXVsdCBnb2VzIGFuZCBkZXRlcm1pbmUgeW91IGNhbiBm
YXVsdCAxR0IuIE5vdyB5b3UKPj4gaGFuZCBpdCB0byB2bWZfaW5zZXJ0X3JhbmdlKCkgYW5kIGJl
Y2F1c2UgdGhlIHVzZXItc3BhY2UgYWRkcmVzcyBpcwo+PiBtaXNhbGlnbmVkLCBvciBhbHJlYWR5
IHBhcnRseSBwb3B1bGF0ZWQgYmVjYXVzZSBvZiBhIHByZXZpb3VzIGV2aWN0aW9uLCB5b3UKPj4g
Y2FuIG9ubHkgZmF1bHQgc2luZ2xlIHBhZ2VzLCBhbmQgeW91IGVuZCB1cCBmYXVsdGluZyBhIGZ1
bGwgR0Igb2Ygc2luZ2xlCj4+IHBhZ2VzIHBlcmhhcHMgZm9yIGEgb25lLXRpbWUgc21hbGwgdXBk
YXRlLgo+IFdoeSB3b3VsZCAieW91IGNhbiBvbmx5IGZhdWx0IHNpbmdsZSBwYWdlcyIgZXZlciBi
ZSB0cnVlPyBJZiB5b3UgaGF2ZQo+IDFHQiBvZiBwYWdlcyB0aGVuIHRoZSB2bWZfaW5zZXJ0X3Jh
bmdlIHNob3VsZCBhbGxvY2F0ZSBlbm91Z2ggcGFnZQo+IHRhYmxlIGVudHJpZXMgdG8gY29uc3Vt
ZSBpdCwgcmVnYXJkbGVzcyBvZiBhbGlnbm1lbnQuCgpDb21wbGV0ZWx5IGFncmVlIHdpdGggSmFz
b24uIEZpbGxpbmcgaW4gdGhlIENQVSBwYWdlIHRhYmxlcyBpcyAKcmVsYXRpdmVseSBjaGVhcCBp
ZiB5b3UgZmlsbCBpbiBhIGxhcmdlIGNvbnRpbnVvdXMgcmFuZ2UuCgpJbiBvdGhlciB3b3JkcyBm
aWxsaW5nIGluIDFHaUIgb2YgYSBsaW5lYXIgcmFuZ2UgaXMgKm11Y2gqIGxlc3Mgb3ZlcmhlYWQg
CnRoYW4gZmlsbGluZyBpbiAxPDwxOCA0S2lCIGZhdWx0cy4KCkkgd291bGQgc2F5IHRoYXQgdGhp
cyBpcyBhbHdheXMgcHJlZmVyYWJsZSBldmVuIGlmIHRoZSBDUFUgb25seSB3YW50cyB0byAKdXBk
YXRlIGEgc2luZ2xlIGJ5dGUuCgo+IEFuZCB3aHkgc2hvdWxkbid0IERBWCBzd2l0Y2ggdG8gdGhp
cyBraW5kIG9mIGludGVyZmFjZSBhbnlob3c/IEl0IGlzCj4gYmFzaWNhbGx5IGV4YWN0bHkgdGhl
IHNhbWUgcHJvYmxlbS4gVGhlIHVuZGVybHlpbmcgZmlsZXN5c3RlbSBibG9jawo+IHNpemUgaXMg
Km5vdCogbmVjZXNzYXJpbHkgYWxpZ25lZCB0byB0aGUgQ1BVIHBhZ2UgdGFibGUgc2l6ZXMgYW5k
IERBWAo+IHdvdWxkIGJlbmVmaXQgZnJvbSBiZXR0ZXIgaGFuZGxpbmcgb2YgdGhpcyBtaXNtYXRj
aC4KPgo+PiBPbiB0b3Agb2YgdGhpcywgdW5sZXNzIHdlIHdhbnQgdG8gZG8gdGhlIHdhbGsgdHJ5
aW5nIGluY3JlYXNpbmdseSBzbWFsbGVyCj4+IHNpemVzIG9mIHZtZl9pbnNlcnRfeHh4KCksIHdl
J2QgaGF2ZSB0byB1c2UgYXBwbHlfdG9fcGFnZV9yYW5nZSgpIGFuZCB0ZWFjaAo+PiBpdCBhYm91
dCB0cmFuc2h1Z2UgcGFnZSB0YWJsZSBlbnRyaWVzLCBiZWNhdXNlIHBhZ2V3YWxrLmMgY2FuJ3Qg
YmUgdXNlZCAoSXQKPj4gY2FuJ3QgcG9wdWxhdGUgcGFnZSB0YWJsZXMpLiBUaGF0IGFsc28gbWVh
bnMgYXBwbHlfdG9fcGFnZV9yYW5nZSgpIG5lZWRzIHRvCj4+IGJlIGNvbXBsaWNhdGVkIHdpdGgg
cGFnZSB0YWJsZSBsb2NrcyBzaW5jZSB0cmFuc2h1Z2UgcGFnZXMgYXJlbid0IHN0YWJsZSBhbmQK
Pj4gY2FuIGJlIHphcHBlZCBhbmQgcmVmYXVsdGVkIHVuZGVyIHVzIHdoaWxlIHdlIGRvIHRoZSB3
YWxrLgo+IEkgZGlkbid0IHNheSBpdCB3b3VsZCBiZSBzaW1wbGUgOikgQnV0IHdlIGFsc28gbmVl
ZCB0byBzdG9wIGhhY2tpbmcKPiBhcm91bmQgdGhlIHNpZGVzIG9mIGFsbCB0aGlzIGh1Z2UgcGFn
ZSBzdHVmZiBhbmQgY29tZSB1cCB3aXRoIHNlbnNpYmxlCj4gQVBJcyB0aGF0IGRyaXZlcnMgY2Fu
IGFjdHVhbGx5IGltcGxlbWVudCBjb3JyZWN0bHkuIEV4cG9zaW5nIGRyaXZlcnMKPiB0byBzcGVj
aWZpYyBraW5kcyBvZiBwYWdlIGxldmVscyByZWFsbHkgZmVlbHMgbGlrZSB0aGUgd3JvbmcgbGV2
ZWwgb2YKPiBhYnN0cmFjdGlvbi4KPgo+IE9uY2Ugd2Ugc3RhcnQgZG9pbmcgdGhpcyB3ZSBzaG91
bGQgZG8gaXQgZXZlcnl3aGVyZSwgdGhlIGlvX3JlbWFwX3Bmbgo+IHN0dWZmIHNob3VsZCBiZSBh
YmxlIHRvIGNyZWF0ZSBodWdlIHNwZWNpYWwgSU8gcGFnZXMgYXMgd2VsbCwgZm9yCj4gaW5zdGFu
Y2UuCgpPaCwgeWVzIHBsZWFzZSEKCldlIGVhc2lseSBoYXZlIDE2R2lCIG9mIFZSQU0gd2hpY2gg
aXMgbGluZWFyIG1hcHBlZCBpbnRvIHRoZSBrZXJuZWwgCnNwYWNlIGZvciBlYWNoIEdQVSBpbnN0
YW5jZS4KCkRvaW5nIHRoYXQgd2l0aCAxR2lCIG1hcHBpbmcgaW5zdGVhZCBvZiA0S2lCIHdvdWxk
IGJlIHF1aXRlIGEgd2luLgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPiAgIAo+PiBPbiB0b3Agb2Yg
dGhpcywgdGhlIHVzZXItc3BhY2UgYWRkcmVzcyBhbGxvY2F0b3IgbmVlZHMgdG8ga25vdyBob3cg
bGFyZ2UgZ3B1Cj4+IHBhZ2VzIGFyZSBhbGlnbmVkIGluIGJ1ZmZlciBvYmplY3RzIHRvIGhhdmUg
YSByZWFzb25hYmxlIGNoYW5jZSBvZiBhbGlnbmluZwo+PiB3aXRoIENQVSBodWdlIHBhZ2UgYm91
bmRhcmllcyB3aGljaCBpcyBhIHJlcXVpcmVtZW50IHRvIGJlIGFibGUgdG8gaW5zZXJ0IGEKPj4g
aHVnZSBDUFUgcGFnZSB0YWJsZSBlbnRyeSwgc28gdGhlIGRyaXZlciB3b3VsZCBiYXNpY2FsbHkg
bmVlZCB0aGUgZHJtIGhlbHBlcgo+PiB0aGF0IGNhbiBkbyB0aGlzIGFsaWdubWVudCBhbnl3YXku
Cj4gRG9uJ3QgeW91IGhhdmUgdGhpcyBwcm9ibGVtIGFueWhvdz8KPgo+IEphc29uCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D1F327BCA
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 11:17:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2130A6E558;
	Mon,  1 Mar 2021 10:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2083.outbound.protection.outlook.com [40.107.220.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243346E558;
 Mon,  1 Mar 2021 10:17:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=it+3DNlVQX6oYr+8fDJnNj9WPNqCslbD1/EQawdfD9RyjRVcZd2dCyX9H+K+MzH7bYoJYypwm6Kw+IUbrWsY9tM7iUtJ9CZ1A80IglZwl3M8kndNCtWtwwVX7mD/u9mdJR2u6wW0zIZvLNSsAX4/VRTSH6iH+LkOLteVXesbQA3NlFYqr2gJTsXVjLB87eXnmESrB1O0UXMXzaebrxdMeFJCCU2bNc75EPI3ukcYWkKBTK3UMYup6XywfkmaOYM0jrwXQ0eWOxhX1bzNsZLCcthpWh9cy1u0l+p9wZ60qbERVo9LDcDKikJ0m/l4yRarOitK3CvbLQYSmnL312On9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyc3UGnNTIqRtymu9gELU2gbvshZsITJwnRcgO2YPD4=;
 b=OgGp6h/EQ3ThBQHA+3GhkfMBNP2aqNnadxET01IXGXX+fh7+r+gjRRYGxqQcDS03qSthHg+xlbzny9Q59b7DRMha1jICX+dEzUdsQgXSz+2yoAhgmCuHXsw/jqlz2MdHhz3v3cwaVj4vFUeCmqENgVCp2Fy+B0UMYvpYFSICI9EnXE8GhxYkash9m+s4u1MznaezhMQFHG7MqIFSeEHEmWX5g3s79jWyh7D07/CjHjg8TozcK+FG5qTG5FzCvlrDElp+tnt1XWd8GsfTu+8b0SB4D6b1rXQy+Pc63fqUzuWIj/uOrX1IqgFkmzLxanCUr3tU0hXt/bV8AR1e2LzHXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gyc3UGnNTIqRtymu9gELU2gbvshZsITJwnRcgO2YPD4=;
 b=5QsvE6qsdXmOEdkDHf541wb0jdOMKjxz5REIsBi+U59dJoLwPKJkUcWjjig4uW50S1NZTJDxABVq/YyciuYFnBPFPG8o8SyNVBud5PfL4O8KoOXTfdIBQxgXcHj8/NjMPXS14ShZBRXDbYP1wfPdtK7uaSaN1eKmtiOvGA5K900=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3694.namprd12.prod.outlook.com (2603:10b6:208:165::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Mon, 1 Mar
 2021 10:17:44 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3890.028; Mon, 1 Mar 2021
 10:17:44 +0000
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Daniel Vetter <daniel@ffwll.ch>
References: <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
 <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
 <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
 <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
 <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
 <CAKMK7uFUiJyMP0E5JUzMOx=NyMW+ZObGsaFOh409x0LOvGbnzg@mail.gmail.com>
 <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org>
 <CAKMK7uE=8+hj-MUFXHFoG_hAbz_Obi8a99+DE5_d1K+KZaG+tQ@mail.gmail.com>
 <b367b7e8-f202-4d23-d672-a5c9bc7fcec1@shipmail.org>
 <YDyuYk8x5QeX83s6@phenom.ffwll.local>
 <be8f2503-ffcb-eb58-83be-26fa0fc1837a@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <648556e6-2d99-950d-c940-706eb5a8f6cc@amd.com>
Date: Mon, 1 Mar 2021 11:17:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <be8f2503-ffcb-eb58-83be-26fa0fc1837a@shipmail.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:a93a:2306:54f2:28c4]
X-ClientProxiedBy: AM9P195CA0024.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::29) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:a93a:2306:54f2:28c4]
 (2a02:908:1252:fb60:a93a:2306:54f2:28c4) by
 AM9P195CA0024.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.19 via Frontend Transport; Mon, 1 Mar 2021 10:17:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: aaff20dd-3bdc-4f4b-45cd-08d8dc9b406c
X-MS-TrafficTypeDiagnostic: MN2PR12MB3694:
X-Microsoft-Antispam-PRVS: <MN2PR12MB36942822E654C303913BCAC0839A9@MN2PR12MB3694.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0RUfnEkGDNzJe/SyyKzQQ2DoyY/zFLOfwZG9mnF63tMYLBYYFdRGAwOkuHAfIUgltdIJ1o9Gg00fjngRT6/oupr/3Njfyv0PhwMc4d2YpP24DrcyutJ+SncPiuih+0UumGI2pN25NDA8b01mfizZIK97WIitc0s8UztogwX+Z1u+79YjnVE1utxjqV/Asv1exwptrI0p/xBpm1++ZLxDquml2ScUiP190sko5BMdY8qiRyHsXwSMvy5dKktraZNtlPZjYy7LLwd2VNgcMycREIKDFlLN7RMLfJ4ZMEu5d3mJlDJZsycQFzYmbO4XtazPT1MVMPArp0h7IRJKwDRwp1N6xvYuTZLtAfXymq9ukPEp+WB9LhYismecR8sYloYy04tWdpHCcF3eYGesewEyACjiEc7nj8mQ4YyJ3tYdc3Q9Y8wdmZkLLE7+QIJrHMIyLLQeEUKVi4zhUYEIvshmvT2SJWi3fiOJxWSVaUQftQUMgW20icUExW2UaFeNF6eVc0NTgyQkDQxFHu5AMTSaDQyfmrLUw7YGdeBUV4ZnvlJCOLg9bpLHsj92Ya3t0AwHVNBrnndw5z3VRDnwlTlbV+rMjGO7zirjaAkiqOK0bJM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(366004)(4326008)(6486002)(31686004)(31696002)(66556008)(66476007)(83380400001)(66946007)(478600001)(66574015)(2616005)(6666004)(16526019)(186003)(2906002)(5660300002)(36756003)(7416002)(86362001)(52116002)(110136005)(316002)(8676002)(8936002)(54906003)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ejhxSTJhajBXZkozUmRsM05hTWRjZThXMW9DR1dKT2RyUHRHbVB0UGhLRDht?=
 =?utf-8?B?R2ZrL21xMnhLcktQR00xK0E3L3VMYlFrcEVsVlJYaENLeC9heHU0TWVFUVdR?=
 =?utf-8?B?alBvT1lvc1RYMDZaOTBQeVFVTjFvZDQxT1djOVpENERyV251NFNsWmZyY2g1?=
 =?utf-8?B?NWQ2MUdrSlhWUzdQWEoxSkFRRG9oRVJ4RlJEODlPb2RTcDd1ejhGVW95RHdX?=
 =?utf-8?B?ayt6QUtuR2FyNVFLczRoM2E2cjJMeG40ay9ReVQrdkZPZ3hQUmxQSVZjRjFz?=
 =?utf-8?B?WnpxNjFJOXhpSkl5aWt5aG9nckRLSFhXS2ZyTExObGVVOHB1Z2xkQnkwZDZp?=
 =?utf-8?B?cTBPb1NMSmE1TGs3Q0NDTWl6bSt0cnNYZkVLaGlZSk9idDlST3oxTVBDMTVX?=
 =?utf-8?B?YUZ6N2VoZGdtVFFwQ3hpc1htYXFaSUJ1SFc3VlY1aC9OTkY4TytuRjZWaFI0?=
 =?utf-8?B?Ym9aNFhXMVdyQy9VTkFtMitSbm9hNFNWMlZFNTlwdmRSYlp6VitnYTJIZzcx?=
 =?utf-8?B?bFZmNDdKS1NERTNacTlTeE5DL2hkK2x3RXB3NldtUHN1N0F0ZVZhV0NESU1B?=
 =?utf-8?B?Y0pjclZXQ0J2bGNib2d6WGRoci84d3FnOXlkRERuSmh4em1PRWtVU0g4Uysr?=
 =?utf-8?B?S2J0NzlCaWJnaStOREtDYzYzUE9jallQQXo2YmRROFZrK0Y2dGxiTzJ0U1Bw?=
 =?utf-8?B?NTlLVVVSYVVwUFplVzRPMXk5bXo2THJFVzZ6VGlKTHZGZ3F3MDIzTHNSZUtq?=
 =?utf-8?B?aFJieWNUM0IxaWc0cGhkeUJFb3ljU3EzUDhzV0QxRmoyYWNKVGl6aDZaa1V2?=
 =?utf-8?B?aFV6QVh0bXdBOHh6a2gvNWMvSmN0eTh1b0EzeFBudHVvVmJKdDhJNThwb0RH?=
 =?utf-8?B?NnZPTmEzenFVZXM0Njd0Z0lkNEkvdkYvbmVRZDFhbnI5VHVXZ21KK0JDV1VC?=
 =?utf-8?B?d09aTTE2Uyt3dW0xNVNpZGhoUFU0Q0NYVDNGMmNRUWZQcWliRW5jM1BmRFl5?=
 =?utf-8?B?aTNWb2V6a0RieHY0dTM4SktTNWo3bGJtS082ZW5vMGE4dWlGQVA3SWNTbjAx?=
 =?utf-8?B?d0NpNWhGSVU2eW5zeHFOWWh1OFpabGtRZWdib3F3Qnp0TVk1Nlc5WnpwZ0o1?=
 =?utf-8?B?aHBTZmlRNnp1RzYySHFma1dBdjJZYnZ4bnlsYUxyM1BqdlR0bExnUitkazB0?=
 =?utf-8?B?Y1diZmFZalVMcXFWbm91eWY1ODNxYi91YVg5aGl2RlZrTy8wWVJLd0RCRmRY?=
 =?utf-8?B?TFpyZ1R5eTI3L1NyRWxhbjNBSmZSbE5xV3NteHlsblNFRzlJUEQrUC9IaERm?=
 =?utf-8?B?ODZCTEFsMG1DSXBiOWl6ZG1XbmxEc0Vhd3JrMHduNStDd1J3VkZMWm53QmJq?=
 =?utf-8?B?VE1zQ0g3eFpzMGd5Z05hRWZTYTloc0hhY2hZaURTb0dVTWUwZlhRZExGZW93?=
 =?utf-8?B?RHFsM3g3ajJuSVpaN3dZME5HdkNOMDA2WWJlWFUwdzNESFNjZHhaOXhiRHRj?=
 =?utf-8?B?NlN2b3VkMzdmaGs1bU1oM1NtenNPYWxlaHI2aTArSjg3VXJ6N3pBSzdQQVN4?=
 =?utf-8?B?MXlkcXhaRHJQcGpZK1JVREoxVUZ6UFhWZ0cxRWVDbTl0VTYwWW5IY0ZFK3Va?=
 =?utf-8?B?QlFQbWlNWGkwTTBNK0VOVXpxNTRiRTJDWi9vMUJWMXFwZjUxQ1NmSytRd1Nk?=
 =?utf-8?B?NTdwOG12Qzk3OWJENXJ3NzB2SDdqR2Q0Q3RxOWVNZW1ualR3WUJDbkRhcVV6?=
 =?utf-8?B?VEVKTS9PYnd0eGh4RENoNDdJUmg5WE84ZnNITGhrSWxYMk5raE1oTUs1UDZG?=
 =?utf-8?B?YTc1bUk2SEZVZVRTZEM1ejVxamhiWExlQnpCS0o5TTQzY29KZGc2QXhXSlZE?=
 =?utf-8?Q?O94KbnHCA0HzT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaff20dd-3bdc-4f4b-45cd-08d8dc9b406c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2021 10:17:43.8620 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2mWZXQgYnBh74YGR8S4kEazUe6Yfz7LsQR04LbrgK9547oXpYEXHMKicTm3Y1Ln
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3694
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Wilcox <willy@infradead.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAwMS4wMy4yMSB1bSAxMDoyMSBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCk6
Cj4KPiBPbiAzLzEvMjEgMTA6MDUgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9uIE1vbiwg
TWFyIDAxLCAyMDIxIGF0IDA5OjM5OjUzQU0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRl
bCkgCj4+IHdyb3RlOgo+Pj4gSGksCj4+Pgo+Pj4gT24gMy8xLzIxIDk6MjggQU0sIERhbmllbCBW
ZXR0ZXIgd3JvdGU6Cj4+Pj4gT24gU2F0LCBGZWIgMjcsIDIwMjEgYXQgOTowNiBBTSBUaG9tYXMg
SGVsbHN0csO2bSAoSW50ZWwpCj4+Pj4gPHRob21hc19vc0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+
Pj4+PiBPbiAyLzI2LzIxIDI6MjggUE0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4+PiBTbyBJ
IHRoaW5rIGl0IHN0b3BzIGd1cC4gQnV0IEkgaGF2ZW4ndCB2ZXJpZmllZCBhdCBhbGwuIFdvdWxk
IGJlIAo+Pj4+Pj4gZ29vZAo+Pj4+Pj4gaWYgQ2hyaXN0aWFuIGNhbiBjaGVjayB0aGlzIHdpdGgg
c29tZSBkaXJlY3QgaW8gdG8gYSBidWZmZXIgaW4gCj4+Pj4+PiBzeXN0ZW0KPj4+Pj4+IG1lbW9y
eS4KPj4+Pj4gSG1tLAo+Pj4+Pgo+Pj4+PiBEb2NzIChhZ2FpbiB2bV9ub3JtYWxfcGFnZSgpIHNh
eSkKPj4+Pj4KPj4+Pj4gwqDCoMKgICogVk1fTUlYRURNQVAgbWFwcGluZ3MgY2FuIGxpa2V3aXNl
IGNvbnRhaW4gbWVtb3J5IHdpdGggb3IgCj4+Pj4+IHdpdGhvdXQgInN0cnVjdAo+Pj4+PiDCoMKg
wqAgKiBwYWdlIiBiYWNraW5nLCBob3dldmVyIHRoZSBkaWZmZXJlbmNlIGlzIHRoYXQgX2FsbF8g
cGFnZXMgCj4+Pj4+IHdpdGggYSBzdHJ1Y3QKPj4+Pj4gwqDCoMKgICogcGFnZSAodGhhdCBpcywg
dGhvc2Ugd2hlcmUgcGZuX3ZhbGlkIGlzIHRydWUpIGFyZSByZWZjb3VudGVkIAo+Pj4+PiBhbmQK
Pj4+Pj4gY29uc2lkZXJlZAo+Pj4+PiDCoMKgwqAgKiBub3JtYWwgcGFnZXMgYnkgdGhlIFZNLiBU
aGUgZGlzYWR2YW50YWdlIGlzIHRoYXQgcGFnZXMgYXJlIAo+Pj4+PiByZWZjb3VudGVkCj4+Pj4+
IMKgwqDCoCAqICh3aGljaCBjYW4gYmUgc2xvd2VyIGFuZCBzaW1wbHkgbm90IGFuIG9wdGlvbiBm
b3Igc29tZSBQRk5NQVAKPj4+Pj4gdXNlcnMpLiBUaGUKPj4+Pj4gwqDCoMKgICogYWR2YW50YWdl
IGlzIHRoYXQgd2UgZG9uJ3QgaGF2ZSB0byBmb2xsb3cgdGhlIHN0cmljdCAKPj4+Pj4gbGluZWFy
aXR5IHJ1bGUgb2YKPj4+Pj4gwqDCoMKgICogUEZOTUFQIG1hcHBpbmdzIGluIG9yZGVyIHRvIHN1
cHBvcnQgQ09XYWJsZSBtYXBwaW5ncy4KPj4+Pj4KPj4+Pj4gYnV0IGl0J3MgdHJ1ZSBfX3ZtX2lu
c2VydF9taXhlZCgpIGVuZHMgdXAgaW4gdGhlIGluc2VydF9wZm4oKSAKPj4+Pj4gcGF0aCwgc28K
Pj4+Pj4gdGhlIGFib3ZlIGlzbid0IHJlYWxseSB0cnVlLCB3aGljaCBtYWtlcyBtZSB3b25kZXIg
aWYgYW5kIGluIHRoYXQgCj4+Pj4+IGNhc2UKPj4+Pj4gd2h5IHRoZXJlIGNvdWxkIGFueSBsb25n
ZXIgZXZlciBiZSBhIHNpZ25pZmljYW50IHBlcmZvcm1hbmNlIAo+Pj4+PiBkaWZmZXJlbmNlCj4+
Pj4+IGJldHdlZW4gTUlYRURNQVAgYW5kIFBGTk1BUC4KPj4+PiBZZWFoIGl0J3MgZGVmaW5pdGVs
eSBjb25mdXNpbmcuIEkgZ3Vlc3MgSSdsbCBoYWNrIHVwIGEgcGF0Y2ggYW5kIHNlZQo+Pj4+IHdo
YXQgc3RpY2tzLgo+Pj4+Cj4+Pj4+IEJUVyByZWdhcmRpbmcgdGhlIFRUTSBodWdlcHRlcywgSSBk
b24ndCB0aGluayB3ZSBldmVyIGxhbmRlZCB0aGF0IAo+Pj4+PiBkZXZtYXAKPj4+Pj4gaGFjaywg
c28gdGhleSBhcmUgKGZvciB0aGUgbm9uLWd1cCBjYXNlKSByZWx5aW5nIG9uCj4+Pj4+IHZtYV9p
c19zcGVjaWFsX2h1Z2UoKS4gRm9yIHRoZSBndXAgY2FzZSwgSSB0aGluayB0aGUgYnVnIGlzIHN0
aWxsIAo+Pj4+PiB0aGVyZS4KPj4+PiBNYXliZSB0aGVyZSdzIGFub3RoZXIgZGV2bWFwIGhhY2ss
IGJ1dCB0aGUgdHRtX3ZtX2luc2VydCBmdW5jdGlvbnMgZG8KPj4+PiB1c2UgUEZOX0RFViBhbmQg
YWxsIHRoYXQuIEFuZCBJIHRoaW5rIHRoYXQgc3RvcHMgZ3VwX2Zhc3QgZnJvbSB0cnlpbmcKPj4+
PiB0byBmaW5kIHRoZSB1bmRlcmx5aW5nIHBhZ2UuCj4+Pj4gLURhbmllbAo+Pj4gSG1tIHBlcmhh
cHMgaXQgbWlnaHQsIGJ1dCBJIGRvbid0IHRoaW5rIHNvLiBUaGUgZml4IEkgdHJpZWQgb3V0IHdh
cyAKPj4+IHRvIHNldAo+Pj4KPj4+IFBGTl9ERVYgfCBQRk5fTUFQIGZvciBodWdlIFBURXMgd2hp
Y2ggY2F1c2VzIHBmbl9kZXZtYXAoKSB0byBiZSAKPj4+IHRydWUsIGFuZAo+Pj4gdGhlbgo+Pj4K
Pj4+IGZvbGxvd19kZXZtYXBfcG1kKCktPmdldF9kZXZfcGFnZW1hcCgpIHdoaWNoIHJldHVybnMg
TlVMTCBhbmQgCj4+PiBndXBfZmFzdCgpCj4+PiBiYWNrcyBvZmYsCj4+Pgo+Pj4gaW4gdGhlIGVu
ZCB0aGF0IHdvdWxkIG1lYW4gc2V0dGluZyBpbiBzdG9uZSB0aGF0ICJpZiB0aGVyZSBpcyBhIGh1
Z2UgCj4+PiBkZXZtYXAKPj4+IHBhZ2UgdGFibGUgZW50cnkgZm9yIHdoaWNoIHdlIGhhdmVuJ3Qg
cmVnaXN0ZXJlZCBhbnkgZGV2bWFwIHN0cnVjdCAKPj4+IHBhZ2VzCj4+PiAoZ2V0X2Rldl9wYWdl
bWFwIHJldHVybnMgTlVMTCksIHdlIHNob3VsZCB0cmVhdCB0aGF0IGFzIGEgInNwZWNpYWwiIAo+
Pj4gaHVnZQo+Pj4gcGFnZSB0YWJsZSBlbnRyeSIuCj4+Pgo+Pj4gwqBGcm9tIHdoYXQgSSBjYW4g
dGVsbCwgYWxsIGNvZGUgY2FsbGluZyBnZXRfZGV2X3BhZ2VtYXAoKSBhbHJlYWR5IAo+Pj4gZG9l
cyB0aGF0LAo+Pj4gaXQncyBqdXN0IGEgcXVlc3Rpb24gb2YgZ2V0dGluZyBpdCBhY2NlcHRlZCBh
bmQgZm9ybWFsaXppbmcgaXQuCj4+IE9oIEkgdGhvdWdodCB0aGF0J3MgYWxyZWFkeSBob3cgaXQg
d29ya3MsIHNpbmNlIEkgZGlkbid0IHNwb3QgYW55dGhpbmcKPj4gZWxzZSB0aGF0IHdvdWxkIGJs
b2NrIGd1cF9mYXN0IGZyb20gZmFsbGluZyBvdmVyLiBJIGd1ZXNzIHJlYWxseSB3b3VsZAo+PiBu
ZWVkIHNvbWUgdGVzdGNhc2VzIHRvIG1ha2Ugc3VyZSBkaXJlY3QgaS9vICh0aGF0J3MgdGhlIGVh
c2llc3QgdG8gdGVzdCkKPj4gZmFpbHMgbGlrZSB3ZSBleHBlY3QuCj4KPiBZZWFoLCBJSVJDIHRo
ZSAifCBQRk5fTUFQIiBpcyB0aGUgbWlzc2luZyBwaWVjZSBmb3IgVFRNIGh1Z2UgcHRlcy4gCj4g
T3RoZXJ3aXNlIHBtZF9kZXZtYXAoKSB3aWxsIG5vdCByZXR1cm4gdHJ1ZSBhbmQgc2luY2UgdGhl
cmUgaXMgbm8gCj4gcG1kX3NwZWNpYWwoKSB0aGluZ3MgYnJlYWsuCgpJcyB0aGF0IG1heWJlIHRo
ZSBpc3N1ZSB3ZSBoYXZlIHNlZW4gd2l0aCBhbWRncHUgYW5kIGh1Z2UgcGFnZXM/CgpBcGFydCBm
cm9tIHRoYXQgSSdtIGxvc3QgZ3V5cywgdGhhdCBkZXZtYXAgYW5kIGd1cCBzdHVmZiBpcyBub3Qg
CnNvbWV0aGluZyBJIGhhdmUgYSBnb29kIGtub3dsZWRnZSBvZiBhcGFydCBmcm9tIGEgb25lIG1p
bGUgaGlnaCB2aWV3LgoKQ2hyaXN0aWFuLgoKPgo+IC9UaG9tYXMKPgo+Cj4KPj4gLURhbmllbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

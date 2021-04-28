Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E34536D370
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 09:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F1C6EAB6;
	Wed, 28 Apr 2021 07:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750053.outbound.protection.outlook.com [40.107.75.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA0E6EAB6;
 Wed, 28 Apr 2021 07:49:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtSNviHNvkZO+zWdIkvqdVzPPBBS92In3guk4/0JyH8G993EwvX81yuVM/K0rPXMPMny7IPG8uRfq7fycFYtLaplku9TaKjenfcbSjOqWRg701//aCI2jwNd9Lj3ul4AGYVM+ZVQzVCNjS1+1ZZrfLjn4XTEgZaT4eNvfH/5QM/M80gTGlT2xD5T0bxmFrSn6/RE5DK8tUE4Ti34JwDWpp3nVPTdlSTsAwlY4A3J5BVraCs2tolS4cITnMQZ4txAJQeZcwjoDJSk8Tq9IQtFvqPSaO4IYV74nyhFPFFF5ZUedZEHkTlNxHrlCERVZg5gfrcOC8YW1tjrLAh6HiDpWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARDr9hOv9Y/miw4M/AmqRCS71XPSGNpcjo2c2gQWl0s=;
 b=ai60Bx+Nlvn65QoVL/fqTpAIs627pfoSoLz+K8Q6/EcZ5ltIemuXEsZgtyjDCOegzPnX7djIarU/J3oRWBBtED8dDjWXYw56Hc2G1cSx79VT3HHova6uOouVrsjbfAplFFE8PfyeUc3pY1MhAGIQQj3SAuo60A1BOumj6zQAac/TW3EguN5COvSMSny7O6CseycbBZGndHdcUxN8Ep5o0/XScFQnsUsxW188y5v6I/LdQnmchrS3T0CFnFmvF6noz6sZHjYJWMq3COvMRLAKHCneqzjpJF8fBmuUMjfUbX7r2uOSoCPkO5Wg1y1cl/9RimVSrON+DKRdDF+e26hVwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ARDr9hOv9Y/miw4M/AmqRCS71XPSGNpcjo2c2gQWl0s=;
 b=OXLnOoGd76N1NqMRbl3fbzJSqjF+ceU3AqR+RHKNX0Bj9DMYA+EaPsf2yzdFCwXsbQeZH0P3FmKrrjxKRYpnDKmfMsrcVEhjV+xEVU6CozLASgN3xPteF3lRJKHuYy4DOglw/tG6thCizur8xfuoE9I7jOMf/H4s2yEQin2NxXs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3886.namprd12.prod.outlook.com (2603:10b6:208:16a::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Wed, 28 Apr
 2021 07:49:19 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 28 Apr 2021
 07:49:19 +0000
Subject: Re: [PATCH 1/2] drm/ttm: Don't evict SG BOs
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210428053338.11560-1-Felix.Kuehling@amd.com>
 <af825fa4-abb3-69a6-48cd-0a6252f72503@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <83a52589-ce81-35b1-e85d-e9485f9bc233@amd.com>
Date: Wed, 28 Apr 2021 03:49:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <af825fa4-abb3-69a6-48cd-0a6252f72503@gmail.com>
Content-Language: en-US
X-Originating-IP: [142.182.183.69]
X-ClientProxiedBy: YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::35) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.182.183.69) by
 YTXPR0101CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 07:49:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b345239c-540e-4d1b-7f3d-08d90a1a2118
X-MS-TrafficTypeDiagnostic: MN2PR12MB3886:
X-Microsoft-Antispam-PRVS: <MN2PR12MB38867FF0BB1C1FDC15E0F09192409@MN2PR12MB3886.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0acIGIA4gSEnNIxXlkGipEXQAAQrz7E6CSXQUrScfYuZjG8iW6pf815xfs/3FTV0sNUAM3xMs/P0xnNpac4OKSzB5XiqzSlXkC8n6Sfu8Go5/5tdgS+zVBux/oyzItTfJu/A1d+kGu+59naH+jFGadcWxRtVZW+6G9C5FfDaaMqwp7yYHoxsPMoO7v3g9QjaByPLFp4Lt0TAZRuX8H4vI7jyxGAk4vOYA3xO6bdI9ANR0C70+ULb5I+nzLe57nqGu2XRYR0a8h05SS0k/Pu+axkRJb/cOYcPDJsKQBPW8zoxODUz/kqbLzrbvFef6ZFHdP7Ka/wnurPXzXjFyyZgCTJuxjk0i3A9Uq0MuYo1Ux2ZLeqBoXtKmwxNZmaokXuSraxPCv6xuRuED5lKFSpUDTqMnC24H2b5xITGdnZYMxeKqXiFbq5YWkQfNumBIZtdY20Y3z8I+SrvTPwL1Cc3OZeJxUR9fC3JkZ/7dGNqY7Qr3mueRxPpCbs1O4AzAh/o402MMBh6C/PaLL6cOWCmxUDHWHeMd9ccUE6SXXFyBFkPzeW6fQRU24M9N14OIp07TnP5nPyyHAiMemGlOeh87V3gREtRknweIJyHBmz7y/pmISRrQakLUbnC5sDdOqDHjyZq6X38Ct+iu/1nzjvT2an+TcWtNxvN1+KoadT88aXm3aAO8I0b0oiv+fN+rWxE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(396003)(346002)(39860400002)(38100700002)(8936002)(478600001)(956004)(66574015)(66946007)(83380400001)(2906002)(44832011)(66556008)(26005)(186003)(2616005)(16576012)(316002)(8676002)(6486002)(5660300002)(16526019)(31696002)(86362001)(66476007)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UXRaa2R0dVM1R25oS01CK3Q3SUdDdU02cndtSDVoRDdrY2c1dHEwQ1k0R05U?=
 =?utf-8?B?SXBSZWRkR0o5SVBqR3JKVXpOKyt2UEJseHNLV0g1ZkFoUU1BTkZ6Y0lQUDhB?=
 =?utf-8?B?VDF1aXo3RHV5c1h2OGhEdFlOQ2syeU1FdExGdDh0QXNHcVdrS0RUSDVDZklS?=
 =?utf-8?B?eTg3UHhsZjR4Q1I2UkpjLzhUUFFrVnc4VmFnS2VhbDJZNzZGYXdsdjVUTFla?=
 =?utf-8?B?b0FhRGsvRGNoYlEzWjZPb2gzendTUzdMdGVXUFdyUWpSREZtVFdBVzV1aE91?=
 =?utf-8?B?SkFPck9aZGFXSldNOWdIb2tucG5EblFXUXFJL01QMzJxVkpGSmU2K3cwRk1z?=
 =?utf-8?B?KzB6WDB4THBRQnhNbktwZlJJR3FHcWwwdDgzaU9PaTFUZi9CY3IrV2NuMXNH?=
 =?utf-8?B?aEs1NlVFbTloM2pZT2psYVJLbmZpUUNCaDd5NHdlSVo1NVV0RWVUYVNxRHVo?=
 =?utf-8?B?MUc3NzRFUDdSQ2FRY2VOM2dtYXNiYS9kbml3eG9QYjBCV29PbERHTDVYbmJH?=
 =?utf-8?B?cURuY01lMHdXbkxnY0txeiswanFZQ0NMaHZCcnBPazEwdlN6UVlpKy90WmJD?=
 =?utf-8?B?V3F2RmY1SWVQVGdFaDlnYW14SHdzQ1piSW5CSlFsOHRVWnNQTmFwcWVvcWta?=
 =?utf-8?B?alpCWVUrNklhV2RZdVh2OFowRmJOUFFnUW1uUU50OEcyTC9QazNsczl1V0Mw?=
 =?utf-8?B?ZnVVbk9IQmFuS1UrNFhVbm83NzRtajJZY1N1U3ZBMUt2NGZMS2J6YWJSOTVn?=
 =?utf-8?B?R1FLdnRZMEwxWEhUdG8wUW01MGhhWXZxaUdpZVQyRkovSzVoUDRET01QQW1w?=
 =?utf-8?B?T2k0QmhidEpObEhRcThaQURPOE1uMm1XNE1SM0pJRWh6Sk1SVmo2MnVxS3hP?=
 =?utf-8?B?VlRBSVl3U2ZGV2E4Vis5c0NOSVRMc1pPR2pZdmhKNFdWYnJlL1p5MTNPODcr?=
 =?utf-8?B?M0h1NC9aTEJoS0UzeHNCdVp6ODFGS210SzlPbUh3d0FhMmR0VzZmbDhtQVQ1?=
 =?utf-8?B?bkQ3RFU0eVNIaXlaUGV0cm4vdmQ4SWZUNlU3ZklDU0hWMlExY0JMVk9IOG9Q?=
 =?utf-8?B?cDNNdjVpWnNVMEVQWFY5NVFpV0xSc1BFNnBld3pmaVdXeUg3K3RDZlg0OVU0?=
 =?utf-8?B?U3Q2Z2ovdmdiQy8wa2xXVmtCQ25vMnhBdm84cXZ6eGhtZi9palhxRksweEM5?=
 =?utf-8?B?RDhDN0pwYUVqTjRXYnU4S1EwSEhDT05KaWJBTjloNHZIN1BSeHdvdkRzU0Yw?=
 =?utf-8?B?T3NvbXF2OXNPSUNpQkJOQ3VHWGRRYjRWMjQ1OGpoa1VMQzFRZWxjL1V5bmp0?=
 =?utf-8?B?R0tVeVRRRHBOTUNZOExCS0xhSU12SFRsN3o5b21NMHlUM1J1WUpaWEdyckhM?=
 =?utf-8?B?QlVIbzROaG8zN2w1Y0hMbG1nNklIRHFqRjgvZUVZZE5IZFRraEZ3bjlLTndx?=
 =?utf-8?B?cGJab21UckN0b2xiak1WSVZLU3BEM2FlTklDQjh4ZXl2T2c4SkdHSlNMaEdX?=
 =?utf-8?B?MzR2YlMwbE03MDhMcmM4cmxCdFVYdEF4cE1BSEpBeFhUWVlxTTk1akwyNDJl?=
 =?utf-8?B?dmZTMitHOS84SmhXMGZLSjh0QlBZcDNBMk91RzNSTWNsdjI0OFJCYlNMaHdY?=
 =?utf-8?B?NUpYUm8xRVVDTW1aZ1ZJbERrZ0lKTjBvU0lDSDBuZzFWaEJhZFp2emF0bVU2?=
 =?utf-8?B?aXBqQ21RM0NUWHJLamNKYlJGbHNza2RxWFdrdVQwekl5WGJtTG53UnAzdm1i?=
 =?utf-8?Q?qAAxraWG8L6hOB1DiUPlafxAWz7ELToD9UDLr1e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b345239c-540e-4d1b-7f3d-08d90a1a2118
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 07:49:19.2039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FO84ql1Q98IA0JvvAuBHoHzeLzy/eg8Pne6zV+kn8asJ+TJTv2C6gHTkneFZpwrZXLLQRb10jPWIquWdIOeyUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3886
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkFtIDIwMjEtMDQtMjggdW0gMzowNCBhLm0uIHNjaHJpZWIgQ2hyaXN0aWFuIEvDtm5pZzoKPiBB
bSAyOC4wNC4yMSB1bSAwNzozMyBzY2hyaWViIEZlbGl4IEt1ZWhsaW5nOgo+PiBTRyBCT3MgZG8g
bm90IG9jY3VweSBzcGFjZSB0aGF0IGlzIG1hbmFnZWQgYnkgVFRNLiBTbyBkbyBub3QgZXZpY3Qg
dGhlbS4KPj4KPj4gVGhpcyBmaXhlcyB1bmV4cGVjdGVkIGV2aWN0aW9ucyBvZiBLRkQncyB1c2Vy
cHRyIEJPcy4gS0ZEIG9ubHkgZXhwZWN0cwo+PiB1c2VycHRyICJldmljdGlvbnMiIGluIHRoZSBm
b3JtIG9mIE1NVSBub3RpZmllcnMuCj4KPiBOQUssIFNHIEJPcyBhbHNvIGFjY291bnQgZm9yIHRo
ZSBtZW1vcnkgdGhlIEdQVSBjYW4gY3VycmVudGx5IGFjY2Vzcy7CoAo+Cj4gV2UgY2FuIGlnbm9y
ZSB0aGVtIGZvciB0aGUgYWxsb2NhdGVkIG1lbW9yeSwgYnV0IG5vdCBmb3IgdGhlIEdUVCBkb21h
aW4uCkhtbSwgdGhlIG9ubHkgcmVhc29uIEkgZm91bmQgdGhpcyBwcm9ibGVtIGlzLCB0aGF0IEkg
YW0gbm93IHRlc3Rpbmcgd2l0aApJT01NVSBlbmFibGVkLiBFdmljdGluZyB0aGUgdXNlcnB0ciBC
TyBkZXN0cm95cyB0aGUgRE1BIG1hcHBpbmcuIFdpdGhvdXQKSU9NTVUtZW5mb3JjZWQgZGV2aWNl
IGlzb2xhdGlvbiBJIHdhcyBibGlzc2Z1bGx5IHVuYXdhcmUgdGhhdCB0aGUKdXNlcnB0ciBCT3Mg
d2VyZSBiZWluZyBldmljdGVkLiBUaGUgR1BVVk0gbWFwcGluZ3Mgd2VyZSB1bmFmZmVjdGVkIGFu
ZApqdXN0IHdvcmtlZCB3aXRob3V0IHByb2JsZW1zLiBIYXZpbmcgdG8gZXZpY3QgdGhlc2UgQk9z
IGlzIGNyaXBwbGluZwpLRkQncyBhYmlsaXR5IHRvIG1hcCBzeXN0ZW0gbWVtb3J5IGZvciBHUFUg
YWNjZXNzLCBvbmNlIGFnYWluLgoKSSB0aGluayB0aGlzIGFmZmVjdHMgbm90IG9ubHkgdXNlcnB0
ciBCT3MgYnV0IGFsc28gRE1BQnVmIGltcG9ydHMgZm9yCkJPcyBzaGFyZWQgYmV0d2VlbiBtdWx0
aXBsZSBHUFVzLgoKVGhlIEdUVCBzaXplIGxpbWl0YXRpb24gaXMgZW50aXJlbHkgYXJ0aWZpY2lh
bC4gQW5kIHRoZSBvbmx5IHJlYXNvbiBJCmtub3cgb2YgZm9yIGtlZXBpbmcgaXQgbGltaXRlZCB0
byB0aGUgVlJBTSBzaXplIGlzIHRvIHdvcmsgYXJvdW5kIHNvbWUKT09NIGlzc3VlcyB3aXRoIEdU
VCBCT3MuIEFwcGx5aW5nIHRoaXMgdG8gdXNlcnB0cnMgYW5kIERNQUJ1ZiBpbXBvcnRzCm1ha2Vz
IG5vIHNlbnNlLiBCdXQgSSB1bmRlcnN0YW5kIHRoYXQgdGhlIHdheSBUVE0gbWFuYWdlcyB0aGUg
R1RUIGRvbWFpbgp0aGVyZSBpcyBubyBlYXN5IGZpeCBmb3IgdGhpcy4gTWF5YmUgd2UnZCBoYXZl
IHRvIGNyZWF0ZSBhIG5ldyBkb21haW4KZm9yIHZhbGlkYXRpbmcgU0cgQk9zIHRoYXQncyBzZXBh
cmF0ZSBmcm9tIEdUVCwgc28gdGhhdCBUVE0gd291bGQgbm90CnRyeSB0byBhbGxvY2F0ZSBHVFQg
c3BhY2UgZm9yIHRoZW0uCgpGYWlsaW5nIHRoYXQsIEknZCBwcm9iYWJseSBoYXZlIHRvIGFiYW5k
b24gdXNlcnB0ciBCT3MgYWx0b2dldGhlciBhbmQKc3dpdGNoIHN5c3RlbSBtZW1vcnkgbWFwcGlu
Z3Mgb3ZlciB0byB1c2luZyB0aGUgbmV3IFNWTSBBUEkgb24gc3lzdGVtcwp3aGVyZSBpdCBpcyBh
dmFsaWFibGUuCgpSZWdhcmRzLArCoCBGZWxpeAoKCj4KPiBDaHJpc3RpYW4uCj4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4+IC0t
LQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgNCArKysrCj4+IMKgIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+IGluZGV4
IGRlMWVjODM4Y2Y4Yi4uMGI5NTM2NTRmZGJmIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4g
QEAgLTY1NSw2ICs2NTUsMTAgQEAgaW50IHR0bV9tZW1fZXZpY3RfZmlyc3Qoc3RydWN0IHR0bV9k
ZXZpY2UgKmJkZXYsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KGJv
LCAmbWFuLT5scnVbaV0sIGxydSkgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29s
IGJ1c3k7Cj4+IMKgICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIERvbid0IGV2aWN0IFNHIEJP
cyAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoYm8tPnR0bSAmJiBiby0+dHRtLT5z
ZykKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4gKwo+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIXR0bV9ib19ldmljdF9zd2Fwb3V0X2FsbG93
YWJsZShibywgY3R4LCAmbG9ja2VkLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmJ1c3kpKSB7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGJ1c3kgJiYgIWJ1c3lfYm8gJiYgdGlja2V0
ICE9Cj4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

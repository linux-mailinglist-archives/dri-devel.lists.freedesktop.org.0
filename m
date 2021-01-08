Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6962E2EF423
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 15:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B2A76E82C;
	Fri,  8 Jan 2021 14:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690040.outbound.protection.outlook.com [40.107.69.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4F46E822;
 Fri,  8 Jan 2021 14:46:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DY1KEApaHkACKrBHkLdAqXxBGzYPn3e0NuusVnsh5Zjk8kqCla8xFQ6Rvr1RtLVLXT7YSW/ZsWIauNYKtNlV6jYjl2FY10hk/ZBisWpvBhL5QIlsB9kXiq03wuQaqGuxFsTl1WsLY05JQTOpvb77lJmXb0HZvCr0U0xbhOGPXDH7kvZ5lu5zWmO1lK7X59jEAJQvawpxhKa9UbaX2ooWABYyMs3u3NUPpCkAHPXZgXHnRP1RdWFKtE4HBx7OPJJv4dORQmhc5bndCj5OXlJcLi2Tt6TUCXycLkXnw/GgepTUlNRypN5kThX1XTG53pOahHdvz9ZOWGJ1yaYNpoasEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7y/gqqqtYJNBPgMOYWUi1aiUltxUHqtg6CCNZQ+DCBo=;
 b=D2zJsuvOFzlxRDNmoQdYlkc/LrRfYZR7mWj8hz03ASV/wCaHNRiBv9cRqqCd2nUyREsx8gqI4lP+wRuknzoBAwgeU65Zqp6yqkrJDlb16TquWykhfY/cWyLChTn0JO9j3ooHMOfpVo97jJ2K3ne9e7NmYWVCBgNtYReEg4Z3XvQlzAg2Oc/Y0w+fxv29LvbrvsOuH1EpfNwOS06H8Oagxm0LMVwGrcMy/7FJP19fDUvpeZkilbHjukE59WTcdWzUOztC6vYnn4h3JMvvikTftqaKBbQSSgH5mRyMNzynibMXOFklW8Y3HuQ5PrdgnQd4cRpEueP8kKYOaOxwBZSppw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7y/gqqqtYJNBPgMOYWUi1aiUltxUHqtg6CCNZQ+DCBo=;
 b=QwObCuY59y8fyBP7TEkiFUtwBo7DIcPCgXfPaxt8zAXW6YWHhKwuy5h8Z27IxILRusRvobBhPjmixDftuvgvutC0n8ssxQkX9mpvnP5nG8pG/a1OV/CDRycDpRYMSYBd1PC2ply0iFctUrxem4IYqD/BMydF4cEUumZ1+JfOPjc=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN1PR12MB2477.namprd12.prod.outlook.com (2603:10b6:802:28::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.9; Fri, 8 Jan
 2021 14:46:34 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::6d32:940b:f630:b37d%4]) with mapi id 15.20.3721.024; Fri, 8 Jan 2021
 14:46:34 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-2-git-send-email-andrey.grodzovsky@amd.com>
 <a510b5c7-1898-f101-1cfd-a037e8fa445d@gmail.com>
 <e6bbd5fa-29b7-c74a-ea70-3979b573901b@amd.com>
 <5a61f76a-0b40-941f-8028-37202f296e74@gmail.com>
 <f374aaa4-4a30-e60c-cd4b-d463443c1137@amd.com>
 <X/c1IXX11chjHyl4@phenom.ffwll.local>
 <75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com>
 <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
 <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
 <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
 <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <29ef0c97-ac1b-a8e6-ee57-16727ff1803e@amd.com>
Date: Fri, 8 Jan 2021 09:46:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:3021:14a5:28d4:9466]
X-ClientProxiedBy: YTBPR01CA0034.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::47) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:3021:14a5:28d4:9466]
 (2607:fea8:3edf:49b0:3021:14a5:28d4:9466) by
 YTBPR01CA0034.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::47) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 14:46:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 0613d651-c616-4b88-c3c9-08d8b3e43200
X-MS-TrafficTypeDiagnostic: SN1PR12MB2477:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN1PR12MB247782E09CD2F611C4572A55EAAE0@SN1PR12MB2477.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: De7Q1ZkYPsSSxWN8eLH99ijDdnXigync4rkGRom5SyFHQvjuX0bU92+lNI19K/qNV30M0GgOggpgM7KH6B7T+yaGig2B9z7M44eHy6xwCT3gmb0x2naFiJx+NkvprmdfLLf4CPPzn7OB8QQ6BM8ajlt3ddv0H0XTiV3yKM6sSE8fu1i3mmxK5zNmTp9iDW1Qixdw65Mvdi2SBm+xtwc6O+3bgGiWR6gcXPt/0RyL3ZStU6+AMGssZWS2nLngCErV3wbCA7ibi5eJ4jsq7ed0EGNisgGemVCk7Sdro/nDEAzlaEaOPpNmOIsxP2Uidx/0YxroDKQ+d7dnlDhe6yx5ubdYHDWB07wMXozUzpP6c7dfDuqNaKm1NZZgqQWmUMHk12aG2xmUiu9YW+UI1BFD6S1R6vuL/D7On7h2ZOgjdjqnHrlX5zPsDeEp9alBNW83aWL+t2w5JdeaZnIZccx6MtQM8LkJ+uKoHUMkX12Ehkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(316002)(31686004)(2906002)(83380400001)(53546011)(5660300002)(66946007)(186003)(36756003)(66476007)(66556008)(110136005)(8676002)(52116002)(6666004)(478600001)(4326008)(66574015)(31696002)(6486002)(86362001)(16526019)(8936002)(2616005)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bHk4UFd0c0hlSkRtdEJyR0g2c1NORHpWWHlma0RlQzljZ3FkRmRHNHVXcmNi?=
 =?utf-8?B?WXR3VVVPdHY2TFZlSGZnRGl6VXFtdFZqb01LN1RRRXA3TXFEZzc4ODR4SEVP?=
 =?utf-8?B?bEdwOThLU2lKVWdoUzF1U0R1U2F6c1lRaXJxQW8zL1FoNVBJcFZXUlh3RlBV?=
 =?utf-8?B?cXBkSzFoMVAyR1dWQUNBNkJwbWRVV0RmWEx4ZHdLaE1PdGlBT3RaUUZ0VXFv?=
 =?utf-8?B?eitKb2p6a1AxQlM0YnNPZEhCWlE0cVVVTVNIUmxpS1ZwblJVbzZYK0lVZXMv?=
 =?utf-8?B?cGVuRUFjRzQ2SE5sUjZvSDYzZnp5OXh4MXJTOGo2amRqSW1Vc05lN0s3ajRH?=
 =?utf-8?B?eVRWckdKYk5JckVYS2QwSVYzYWk2U1A4NEZmaG1rMHAxK0FzRlpkTlZIZnQ2?=
 =?utf-8?B?RlAwdE5tdUt6OVV2Z1JWdVM4UkV4dktRQ3NLb3AxVDdaZlFNTnFkTVBkYXVF?=
 =?utf-8?B?cDQxRTdNRW1Hb3dzKzBpWE1Jb3RpcWZxbmQ3bkpiZXpDTTR3RnVhL2EveTQz?=
 =?utf-8?B?ckZhUGxmVmVSZW51c21XM2ZZZ0U4UTdKTTVWZ0JuN0kzSHR2QkNGWnBtYUxQ?=
 =?utf-8?B?NXU0c1NrMEZybXJBU3o0bFVWcVRxeG9DanlxZC84Zm9Hc3hBWDBhYkFIMlhK?=
 =?utf-8?B?QkVveFRvemJjcWtiSVZyWTV4VDFGM0I4cStXTUJSL3U4TU1BY2EyMWY3Szc5?=
 =?utf-8?B?eVZjWmNRaDlPZ0hNNmFmRHExdmJadW9PZlJVUDFMdVNvUmRTcDFVZG80bFZl?=
 =?utf-8?B?VFM2V2VONG9nRkRkL3VjYThRMW5SWmd2aXhRYWJrOWhkaEQ1QnVIOHB1eEVi?=
 =?utf-8?B?dTEwTkJ5VmhFS0VQSFRxOU9JZjR1NVJveFA4TnJqelhnQVRGSHRCVkg2NHVk?=
 =?utf-8?B?ZmtyZTV2TGtHNG9pcU5LN2ZQelRiVUpVa2FPOUYvTEptK0NOS1RISWJrZWdF?=
 =?utf-8?B?Nm9DWU84SlRaYkZvOURqQk82alR1Ymh3aVZiOGFGbzg3SFNrTUZ2M3F4MDlu?=
 =?utf-8?B?Zi9zbnJNS2NNeEpHbUZMYm1zT3JWUFZTSkU3T3RqQnR6MitKUEphUXFLREgw?=
 =?utf-8?B?R1IvMzVRQnBwUll1ZCs2eGtabTBvdHEzQnpEQXNoUGU5M1lkZzFJYkpwQm5o?=
 =?utf-8?B?UmZhYVdJdCtEamZGejhaUVlpdGJTOW4vWXd6L1Q4RlR3QmtuVnU4N0VadGJt?=
 =?utf-8?B?VythVjQ5TlpicFlKMTA5ZUUyazJRQkFiblBXcUUxKzdPK0RsbUdlZVhGeCtN?=
 =?utf-8?B?Q2oyaHUvQXN1c2orYUtkc3ZNeGxuQzhuRjVwRXl2Y2gvNk05dkZncFBYSVJH?=
 =?utf-8?B?SmpXTVhScTJBRDRJUllDd0dxTVd2S08zaXFvT0FjQWk0OHkwQ0phY005YSsz?=
 =?utf-8?B?UXJqZVdoZFhJMEFhSUpMeHJMcUN4eVlISExxMnNBQzliQ1QzN0xnSHZSVGJQ?=
 =?utf-8?Q?1UBhgMcl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 14:46:34.4632 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 0613d651-c616-4b88-c3c9-08d8b3e43200
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJh3xMJHNTmIuHOGiX17ytCjyXqqQP2IJbIilEdRYWChpmpxJNaMOOIa2r0uIFqSAvPbR+SX6vkONPRiaTd8KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2477
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
Cc: amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, yuq825@gmail.com, gregkh@linuxfoundation.org,
 Alexander.Deucher@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuaWVsIGhhZCBzb21lIG9iamVjdGlvbnMgdG8gdGhpcyAoc2VlIGJlbGxvdykgYW5kIHNvIEkg
Z3Vlc3MgSSBuZWVkIHlvdSBib3RoIAp0byBhZ3JlZSBvbiB0aGUgYXBwcm9hY2ggYmVmb3JlIEkg
cHJvY2VlZC4KCkFuZHJleQoKT24gMS84LzIxIDk6MzMgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3Jv
dGU6Cj4gQW0gMDguMDEuMjEgdW0gMTU6MjYgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPj4g
SGV5IENocmlzdGlhbiwganVzdCBhIHBpbmcuCj4KPiBXYXMgdGhlcmUgYW55IHF1ZXN0aW9uIGZv
ciBtZSBoZXJlPwo+Cj4gQXMgZmFyIGFzIEkgY2FuIHNlZSB0aGUgYmVzdCBhcHByb2FjaCB3b3Vs
ZCBzdGlsbCBiZSB0byBmaWxsIHRoZSBWTUEgd2l0aCBhIAo+IHNpbmdsZSBkdW1teSBwYWdlIGFu
ZCBhdm9pZCBwb2ludGVycyBpbiB0aGUgR0VNIG9iamVjdC4KPgo+IENocmlzdGlhbi4KPgo+Pgo+
PiBBbmRyZXkKPj4KPj4gT24gMS83LzIxIDExOjM3IEFNLCBBbmRyZXkgR3JvZHpvdnNreSB3cm90
ZToKPj4+Cj4+PiBPbiAxLzcvMjEgMTE6MzAgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+Pj4g
T24gVGh1LCBKYW4gMDcsIDIwMjEgYXQgMTE6MjY6NTJBTSAtMDUwMCwgQW5kcmV5IEdyb2R6b3Zz
a3kgd3JvdGU6Cj4+Pj4+IE9uIDEvNy8yMSAxMToyMSBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToK
Pj4+Pj4+IE9uIFR1ZSwgSmFuIDA1LCAyMDIxIGF0IDA0OjA0OjE2UE0gLTA1MDAsIEFuZHJleSBH
cm9kem92c2t5IHdyb3RlOgo+Pj4+Pj4+IE9uIDExLzIzLzIwIDM6MDEgQU0sIENocmlzdGlhbiBL
w7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4+IEFtIDIzLjExLjIwIHVtIDA1OjU0IHNjaHJpZWIgQW5kcmV5
IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4+PiBPbiAxMS8yMS8yMCA5OjE1IEFNLCBDaHJpc3RpYW4gS8O2
bmlnIHdyb3RlOgo+Pj4+Pj4+Pj4+IEFtIDIxLjExLjIwIHVtIDA2OjIxIHNjaHJpZWIgQW5kcmV5
IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4+Pj4+IFdpbGwgYmUgdXNlZCB0byByZXJvdXRlIENQVSBtYXBw
ZWQgQk8ncyBwYWdlIGZhdWx0cyBvbmNlCj4+Pj4+Pj4+Pj4+IGRldmljZSBpcyByZW1vdmVkLgo+
Pj4+Pj4+Pj4+IFVmZiwgb25lIHBhZ2UgZm9yIGVhY2ggZXhwb3J0ZWQgRE1BLWJ1Zj8gVGhhdCdz
IG5vdCBzb21ldGhpbmcgd2UgY2FuIGRvLgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gV2UgbmVlZCB0
byBmaW5kIGEgZGlmZmVyZW50IGFwcHJvYWNoIGhlcmUuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBD
YW4ndCB3ZSBjYWxsIGFsbG9jX3BhZ2UoKSBvbiBlYWNoIGZhdWx0IGFuZCBsaW5rIHRoZW0gdG9n
ZXRoZXIKPj4+Pj4+Pj4+PiBzbyB0aGV5IGFyZSBmcmVlZCB3aGVuIHRoZSBkZXZpY2UgaXMgZmlu
YWxseSByZWFwZWQ/Cj4+Pj4+Pj4+PiBGb3Igc3VyZSBiZXR0ZXIgdG8gb3B0aW1pemUgYW5kIGFs
bG9jYXRlIG9uIGRlbWFuZCB3aGVuIHdlIHJlYWNoCj4+Pj4+Pj4+PiB0aGlzIGNvcm5lciBjYXNl
LCBidXQgd2h5IHRoZSBsaW5raW5nID8KPj4+Pj4+Pj4+IFNob3VsZG4ndCBkcm1fcHJpbWVfZ2Vt
X2Rlc3Ryb3kgYmUgZ29vZCBlbm91Z2ggcGxhY2UgdG8gZnJlZSA/Cj4+Pj4+Pj4+IEkgd2FudCB0
byBhdm9pZCBrZWVwaW5nIHRoZSBwYWdlIGluIHRoZSBHRU0gb2JqZWN0Lgo+Pj4+Pj4+Pgo+Pj4+
Pj4+PiBXaGF0IHdlIGNhbiBkbyBpcyB0byBhbGxvY2F0ZSBhIHBhZ2Ugb24gZGVtYW5kIGZvciBl
YWNoIGZhdWx0IGFuZCBsaW5rCj4+Pj4+Pj4+IHRoZSB0b2dldGhlciBpbiB0aGUgYmRldiBpbnN0
ZWFkLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBBbmQgd2hlbiB0aGUgYmRldiBpcyB0aGVuIGZpbmFsbHkg
ZGVzdHJveWVkIGFmdGVyIHRoZSBsYXN0IGFwcGxpY2F0aW9uCj4+Pj4+Pj4+IGNsb3NlZCB3ZSBj
YW4gZmluYWxseSByZWxlYXNlIGFsbCBvZiB0aGVtLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBDaHJpc3Rp
YW4uCj4+Pj4+Pj4gSGV5LCBzdGFydGVkIHRvIGltcGxlbWVudCB0aGlzIGFuZCB0aGVuIHJlYWxp
emVkIHRoYXQgYnkgYWxsb2NhdGluZyBhIHBhZ2UKPj4+Pj4+PiBmb3IgZWFjaCBmYXVsdCBpbmRp
c2NyaW1pbmF0ZWx5Cj4+Pj4+Pj4gd2Ugd2lsbCBiZSBhbGxvY2F0aW5nIGEgbmV3IHBhZ2UgZm9y
IGVhY2ggZmF1bHRpbmcgdmlydHVhbCBhZGRyZXNzIHdpdGhpbiBhCj4+Pj4+Pj4gVkEgcmFuZ2Ug
YmVsb25naW5nIHRoZSBzYW1lIEJPCj4+Pj4+Pj4gYW5kIHRoaXMgaXMgb2J2aW91c2x5IHRvbyBt
dWNoIGFuZCBub3QgdGhlIGludGVudGlvbi4gU2hvdWxkIEkgaW5zdGVhZCB1c2UKPj4+Pj4+PiBs
ZXQncyBzYXkgYSBoYXNodGFibGUgd2l0aCB0aGUgaGFzaAo+Pj4+Pj4+IGtleSBiZWluZyBmYXVs
dGluZyBCTyBhZGRyZXNzIHRvIGFjdHVhbGx5IGtlZXAgYWxsb2NhdGluZyBhbmQgcmV1c2luZyBz
YW1lCj4+Pj4+Pj4gZHVtbXkgemVybyBwYWdlIHBlciBHRU0gQk8KPj4+Pj4+PiAob3IgZm9yIHRo
YXQgbWF0dGVyIERSTSBmaWxlIG9iamVjdCBhZGRyZXNzIGZvciBub24gaW1wb3J0ZWQgQk9zKSA/
Cj4+Pj4+PiBXaHkgZG8gd2UgbmVlZCBhIGhhc2h0YWJsZT8gQWxsIHRoZSBzdyBzdHJ1Y3R1cmVz
IHRvIHRyYWNrIHRoaXMgc2hvdWxkCj4+Pj4+PiBzdGlsbCBiZSBhcm91bmQ6Cj4+Pj4+PiAtIGlm
IGdlbV9iby0+ZG1hX2J1ZiBpcyBzZXQgdGhlIGJ1ZmZlciBpcyBjdXJyZW50bHkgZXhwb3J0ZWQg
YXMgYSBkbWEtYnVmLAo+Pj4+Pj4gwqDCoMKgIHNvIGRlZmVuc2l2ZWx5IGFsbG9jYXRlIGEgcGVy
LWJvIHBhZ2UKPj4+Pj4+IC0gb3RoZXJ3aXNlIGFsbG9jYXRlIGEgcGVyLWZpbGUgcGFnZQo+Pj4+
Pgo+Pj4+PiBUaGF0IGV4YWN0bHkgd2hhdCB3ZSBoYXZlIGluIGN1cnJlbnQgaW1wbGVtZW50YXRp
b24KPj4+Pj4KPj4+Pj4KPj4+Pj4+IE9yIGlzIHRoZSBpZGVhIHRvIHNhdmUgdGhlIHN0cnVjdCBw
YWdlICogcG9pbnRlcj8gVGhhdCBmZWVscyBhIGJpdCBsaWtlCj4+Pj4+PiBvdmVyLW9wdGltaXpp
bmcgc3R1ZmYuIEJldHRlciB0byBoYXZlIGEgc2ltcGxlIGltcGxlbWVudGF0aW9uIGZpcnN0IGFu
ZAo+Pj4+Pj4gdGhlbiB0dW5lIGl0IGlmIChhbmQgb25seSBpZikgYW55IHBhcnQgb2YgaXQgYmVj
b21lcyBhIHByb2JsZW0gZm9yIG5vcm1hbAo+Pj4+Pj4gdXNhZ2UuCj4+Pj4+Cj4+Pj4+IEV4YWN0
bHkgLSB0aGUgaWRlYSBpcyB0byBhdm9pZCBhZGRpbmcgZXh0cmEgcG9pbnRlciB0byBkcm1fZ2Vt
X29iamVjdCwKPj4+Pj4gQ2hyaXN0aWFuIHN1Z2dlc3RlZCB0byBpbnN0ZWFkIGtlZXAgYSBsaW5r
ZWQgbGlzdCBvZiBkdW1teSBwYWdlcyB0byBiZQo+Pj4+PiBhbGxvY2F0ZWQgb24gZGVtYW5kIG9u
Y2Ugd2UgaGl0IGEgdm1fZmF1bHQuIEkgd2lsbCB0aGVuIGFsc28gcHJlZmF1bHQgdGhlIAo+Pj4+
PiBlbnRpcmUKPj4+Pj4gVkEgcmFuZ2UgZnJvbSB2bWEtPnZtX2VuZCAtIHZtYS0+dm1fc3RhcnQg
dG8gdm1hLT52bV9lbmQgYW5kIG1hcCB0aGVtCj4+Pj4+IHRvIHRoYXQgc2luZ2xlIGR1bW15IHBh
Z2UuCj4+Pj4gVGhpcyBzdHJvbmdseSBmZWVscyBsaWtlIHByZW1hdHVyZSBvcHRpbWl6YXRpb24u
IElmIHlvdSdyZSB3b3JyaWVkIGFib3V0Cj4+Pj4gdGhlIG92ZXJoZWFkIG9uIGFtZGdwdSwgcGF5
IGRvd24gdGhlIGRlYnQgYnkgcmVtb3Zpbmcgb25lIG9mIHRoZSByZWR1bmRhbnQKPj4+PiBwb2lu
dGVycyBiZXR3ZWVuIGdlbSBhbmQgdHRtIGJvIHN0cnVjdHMgKEkgdGhpbmsgd2Ugc3RpbGwgaGF2
ZSBzb21lKSA6LSkKPj4+Pgo+Pj4+IFVudGlsIHdlJ3ZlIG51a2VkIHRoZXNlIGVhc3kmb2J2aW91
cyBvbmVzIHdlIHNob3VsZG4ndCBwbGF5ICJhdm9pZCAxCj4+Pj4gcG9pbnRlciBqdXN0IGJlY2F1
c2UiIGdhbWVzIHdpdGggaGFzaHRhYmxlcy4KPj4+PiAtRGFuaWVsCj4+Pgo+Pj4KPj4+IFdlbGws
IGlmIHlvdSBhbmQgQ2hyaXN0aWFuIGNhbiBhZ3JlZSBvbiB0aGlzIGFwcHJvYWNoIGFuZCBzdWdn
ZXN0IG1heWJlIHdoYXQgCj4+PiBwb2ludGVyIGlzCj4+PiByZWR1bmRhbnQgYW5kIGNhbiBiZSBy
ZW1vdmVkIGZyb20gR0VNIHN0cnVjdCBzbyB3ZSBjYW4gdXNlIHRoZSAnY3JlZGl0JyB0byAKPj4+
IGFkZCB0aGUgZHVtbXkgcGFnZQo+Pj4gdG8gR0VNIEkgd2lsbCBiZSBoYXBweSB0byBmb2xsb3cg
dGhyb3VnaC4KPj4+Cj4+PiBQLlMgSGFzaCB0YWJsZSBpcyBvZmYgdGhlIHRhYmxlIGFueXdheSBh
bmQgd2UgYXJlIHRhbGtpbmcgb25seSBhYm91dCBsaW5rZWQgCj4+PiBsaXN0IGhlcmUgc2luY2Ug
YnkgcHJlZmF1bHRpbmcKPj4+IHRoZSBlbnRpcmUgVkEgcmFuZ2UgZm9yIGEgdm1mLT52bWEgaSB3
aWxsIGJlIGF2b2lkaW5nIHJlZHVuZGFudCBwYWdlIGZhdWx0cyAKPj4+IHRvIHNhbWUgVk1BIFZB
IHJhbmdlIGFuZCBzbwo+Pj4gZG9uJ3QgbmVlZCB0byBzZWFyY2ggYW5kIHJldXNlIGFuIGV4aXN0
aW5nIGR1bW15IHBhZ2UgYnV0IHNpbXBseSBjcmVhdGUgYSAKPj4+IG5ldyBvbmUgZm9yIGVhY2gg
bmV4dCBmYXVsdC4KPj4+Cj4+PiBBbmRyZXkKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK

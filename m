Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA50C313427
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 15:00:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 523D76E8E8;
	Mon,  8 Feb 2021 14:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF536E8E1;
 Mon,  8 Feb 2021 13:59:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S8P8YR4tTBJ967LRn4A5WQiVyhdDOUTB3et0TwxfVIvN7mUHwT+w09omtNYKsRGK/nyugLZYaec58so/SI2sJ9dxD41HJ2t5vui9BxM2/bQJecc6G6AjpXpNp0jsJ/HKR/FMFRL68UDAHixFdbO9WFjyt+U8rs5U4s8nDHdHro7KXUwb4AlyNC+D2RwxvaRAjURoUS7C//IhSZahb4/Zjcx25hA+sMHyiZXSsLs+lUuT50tf1/YzkfDgaCzTzxmtmlcnlaUjwPPuM+qYuenXOUx3A2XA4WAv+GeIY+JUq+QslqEwWvq3TdUv2tlekfcG0hODKquu3KG8T7UaWb5Xng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4FKcQCOkiFUFmZfrh2C6Ry2iO1wJakOBjiLLwimMr8=;
 b=TMDq4g7lDlFvhHaiODNzuGPMdLD+sZ0xxQUMGjnP7Rk6Tm+MOpRR5gKh67+wBRo4EMI+ANSA0Zh7+KctegED6IlaPA7fdpg2Qvk2QtE2GQJmuAmGCZdiaOYSy6W7PummQIe3Dy+U7wwIfEoPAxaPyfyqs8UH4E3XxHhM4d6899r/RCLJePeQOcfdVO3n3mAWwtJJAD9TVkKJSs+wcRoLK/rOFOwAaI6dD32eqH19QYoVYMRZJH5DXasi/CL1GBYNY3upLFBepqhMQG1PpdC/yKFHMEyD93vLkDxjbkNQ7fxWeZOfvPTqweCevazJUDOTpAWt3qXyUEnZZKaToFyLng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T4FKcQCOkiFUFmZfrh2C6Ry2iO1wJakOBjiLLwimMr8=;
 b=JUGdVLmrELQmJZUBCfPlcmasvHCi3IGJy1zq3HdsC9S0q77N2Xc2a8U1quEUEOtn6X0bUfIfDIJ65gXBpy43UTBBiQ2FlVgvDVVuaQq/WB7OLwVqPPnZr1L7o/UDFTvJSh0GY/ROFjJcTQyk/DPTFUDvVgiRbO9w7j1n6FrWgpY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4962.namprd12.prod.outlook.com (2603:10b6:208:17e::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.24; Mon, 8 Feb
 2021 13:59:58 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Mon, 8 Feb 2021
 13:59:58 +0000
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: Daniel Vetter <daniel@ffwll.ch>
References: <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
 <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
 <78e4705d-c55f-6c68-d0f9-b1939b636121@amd.com>
 <CAKMK7uEm=N4kQYyzMt=nUefu2BdyKNcWikFiSJih7CthJMd2Aw@mail.gmail.com>
 <8fbeee95-b365-7f68-1e0b-1d42eb0dea70@amd.com>
 <CAKMK7uEJDfPsbnkVfunjVe2iNbpVBWY2_XHai4JntcxWkuVc3A@mail.gmail.com>
 <fcb2cf17-d011-55c6-1545-9fa190e358c3@gmail.com>
 <YCEJBfA6ce4dD3JT@phenom.ffwll.local>
 <6c639669-b78d-b6a3-71b9-d546ca34121b@gmail.com>
 <YCEOY5wFmpGRl7jJ@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <90eb7a73-1981-6d20-a83d-1690321212c7@amd.com>
Date: Mon, 8 Feb 2021 14:59:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <YCEOY5wFmpGRl7jJ@phenom.ffwll.local>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM4PR0701CA0018.eurprd07.prod.outlook.com
 (2603:10a6:200:42::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0701CA0018.eurprd07.prod.outlook.com (2603:10a6:200:42::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.11 via Frontend
 Transport; Mon, 8 Feb 2021 13:59:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6e163dd3-a587-4f49-a2bb-08d8cc39d1af
X-MS-TrafficTypeDiagnostic: BL0PR12MB4962:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49623290A14277ADFE9D788D838F9@BL0PR12MB4962.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uvtCPlU2AaBF/lqSOMGaEzqVHGRCz45jVqlxdU1p+TZGnmup+dgwPbZfLiihesPr+3iRYqOn+frVJyyPXZirWtHUxMC/SkHh8Opjotm1Ygl05nS9vJRRgV6CQCOqyA+UMMhkM19nDM97kCMAneZQDsdFrslPPUgyUHbGRrGkN9v4CSBJN81ikw7d7tg9z+I77wayn1D3ooP9E0j/x9Zl10OGNKIF+tVwSJmij5hr3fjsgutNSAIVzz+4xwDvlaa0gxiFlpoVtw8LEyfD8tju/MO8Y+owRRYKEnPQd3ZuDs3GR9N2yemf81JIzW/rMgWyrXDuLGfhz7WSlBp5M0nW0hcaOVQ6ggGmVnCY5zVPbdR+uaphQzeawLbi7+GZIJ8qbgMvHmBp4d7z7HVAKKgtnlUmDyv+7k1b32sB2Nh38K1KoVgHj+gAnPiqPjKTzvRpqcbmM1wF1k/ZDj+bS/6w8mcQGIbYFnDNc7SppQr18rAGOZ5o0yyAGRYuawa/J/V/knT4NoWTCqNf8nhnu1y/SRnN3D33wx6T+N2dU6YWBwpWW3xW7J/NckA6kLgT+yF6M2CwgHdpZ9shA81373QG0vLLcgxmWHrHfy9LumUCnCB5OTIuON5nQLQZ30M7IjyFKzBB5iIveG9KuNXtTdOcNxRVMUfDUHdYvx6aBJ50H8L5IkNX/jF4YX/QG8V4hN6R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(346002)(136003)(396003)(376002)(66556008)(8676002)(316002)(2906002)(478600001)(86362001)(6486002)(4326008)(5660300002)(66946007)(2616005)(7416002)(31686004)(6916009)(66476007)(186003)(52116002)(36756003)(16526019)(31696002)(54906003)(45080400002)(966005)(6666004)(8936002)(66574015)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SWMvZ3I4aHphbk1nbnVZWE42ZE1kakFYYWZEYzFVeDhFTXJCN0RjNCt0bHZ5?=
 =?utf-8?B?YVNpdFlhMjF1RFRkSFBrRjN2MlE2OVNicFJKV1J3OEh2T24rM3o0akI5OTg1?=
 =?utf-8?B?Y0NGOUFCRTZpajVjV29lZjNtR3BheUphazlaUXBxZWhXVWVheVpGd0tFWjIx?=
 =?utf-8?B?Uk9kQzQrNXNFaC9VNGx6UFA2ZEhrUFpWcFJtK1ArbVh5ZmEvdmhPemwxZis4?=
 =?utf-8?B?dUo0YWcvRVJOaHFKbzFzcVVzajZ3UCtkTzl6dExzMCsyYUtVVGowQzVmQXVh?=
 =?utf-8?B?enFMSkJrWFpBbVcvVU1OSmdDTzlpejdUY3RDS2FYN0IyMjNacmJmOFdRRWFv?=
 =?utf-8?B?QmJ5TVkybXNVS3pyWVlLMGhmaHRGRklzcDluTVgzVTFPV04vTkxNa0VQRE5Z?=
 =?utf-8?B?ZGdSWjdkZHBNb0pKei9vRjJHT2ZNc1M5cGg0aVNubmlUbFBHai9BaTR6WW9w?=
 =?utf-8?B?VTlyN1d5RzkrRkVEQS9TemN4azIrb2JqS1BHc1VVTTBSbG5TS2hIbHRkQS9U?=
 =?utf-8?B?NW5Xc0dFbGNtOVdYUnBkbEVHSGFnTzZDREZsVUJsZWYwbHRRYjVtSEJtK0hh?=
 =?utf-8?B?UzZvT1BvbXltcnlDdmtBSE9HQmliUU5HRXNkM3dmQWtjNXZCengwTVozL1ds?=
 =?utf-8?B?QXRMZ3ljZGR3Tm05L1VtWWNvRG5DcEdrbWg0UzhIeUVRTEVMSW9XR1dWeEZl?=
 =?utf-8?B?UFJRSVQ0ZzlGQWFrVFV1Rlh6QngwZ3pKOS9GWnppSEhMd0N0L3crL0NMb2hZ?=
 =?utf-8?B?MGhxeTI0NStuYWRZN0NZajB5VGloN05Nd0JPb3MzWVRHMGlDbGRBOVpPbjNw?=
 =?utf-8?B?M0NNcWgyWUR2b3ZjOXgxSVJ3WmZROFFDM3F2WTJFZ2RzQ01ybjZ5TXZyNklS?=
 =?utf-8?B?UUhjajJuc0dyR2o2eitWc2FZd29pSmh4QWlHamk3bWNndjZRQis2NGtKK1gz?=
 =?utf-8?B?TGtyZ1FiNmF6Si8yNy9YZHMwWTZmY1F2bTZxWmtsZGtTc09xakZtc0xiUjJz?=
 =?utf-8?B?aUU3Ynd3a0JtdG9ENmhkaTBMWjBLTDFZRFFtYlNXWmlxWlpEWmsrWmo3cnMz?=
 =?utf-8?B?ZGRSRUZZcExrbDMzMElqWHY5Ykl3clgrZ1VNZjl4ZlZWOGdmRFBqdnMvTm05?=
 =?utf-8?B?bTFlQnBvNDZwdkFXcExCN1FhSmxKOUpFVzBGWlVsTTdiSGI2d3hxWCtIdTBQ?=
 =?utf-8?B?aG53MWNRT0Jkd0hiVTFFZVEwZnc2bG1rR2hCdDNJN09KeUpibkZEYkNGZU95?=
 =?utf-8?B?VHlGUTlVcWJ2aXczOFBHc08zZnM2L1dJUXQ2SnZUbG9FQ2pwbVU4SjRIdmhO?=
 =?utf-8?B?T3Fya1cvYlQrMmNqUEV5cFk5cDB1UklpZW5aSHl3UjdnSWRpRzVyK0R3cFRx?=
 =?utf-8?B?alNuNkE1SmI4YU4zZi81QmZINnNleW5xbzBmL2E4ak4rWWczWWtsdlRhRUFi?=
 =?utf-8?B?UEpwWEJUNndrN3RNbVhQOTlBQ1NtTUkxL0VPRnZRRDRLWGVlcTVjMW9mUUxG?=
 =?utf-8?B?U1JnbEVPSGY4Vng1SzZWdzRyaXRLZjhDMHRoZDhoVVdjdHdaektDVlZmVm9O?=
 =?utf-8?B?a05nd3QxVVN3OXgwNmZVSHdqbmpFV2JzamU3bkZjNlkraEY4L1JOcUZKZk5i?=
 =?utf-8?B?czhqdXhacFZwbTZ3YXNxNkl4cUdJK1N1MkJwdi9pYnZUcWZxMGVEZlJ2ZDFF?=
 =?utf-8?B?RjlKcWRteEdZL0xrU0Zrd2hYb2crL2FTWlBnenRlM2VrbkdHMC9lK3V1YWkx?=
 =?utf-8?B?OFpDMTFjTE9Va3gwbjE2RW9lMmtjdGZJVVpRWW91dkMzbm1uem02VUJxTUhk?=
 =?utf-8?B?N3hSblBoWHptK1BQY2JSYVNrYlVZSTF3aXdFSVpFbjgvZ04waHpJUUJlMVZW?=
 =?utf-8?Q?WdXMzU3GXes3l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e163dd3-a587-4f49-a2bb-08d8cc39d1af
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2021 13:59:58.3142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lx0r1UgMrRMUWaH04uejkDQlIRubYGUC1ldyMtwQfOPVAGljiIOafZICTybLsOgn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4962
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>, Alex Deucher <Alexander.Deucher@amd.com>,
 Qiang Yu <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDIuMjEgdW0gMTE6MTEgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIE1vbiwgRmVi
IDA4LCAyMDIxIGF0IDExOjAzOjE1QU0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IEFtIDA4LjAyLjIxIHVtIDEwOjQ4IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+IE9uIE1vbiwg
RmViIDA4LCAyMDIxIGF0IDEwOjM3OjE5QU0gKzAxMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6
Cj4+Pj4gQW0gMDcuMDIuMjEgdW0gMjI6NTAgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+Pj4+PiBb
U05JUF0KPj4+Pj4+IENsYXJpZmljYXRpb24gLSBhcyBmYXIgYXMgSSBrbm93IHRoZXJlIGFyZSBu
byBwYWdlIGZhdWx0IGhhbmRsZXJzIGZvciBrZXJuZWwKPj4+Pj4+IG1hcHBpbmdzLiBBbmQgd2Ug
YXJlIHRhbGtpbmcgYWJvdXQga2VybmVsIG1hcHBpbmdzIGhlcmUsIHJpZ2h0ID8gIElmIHRoZXJl
IHdlcmUKPj4+Pj4+IEkgY291bGQgc29sdmUgYWxsIHRob3NlIGlzc3VlcyB0aGUgc2FtZSBhcyBJ
IGRvIGZvciB1c2VyIG1hcHBpbmdzLCBieQo+Pj4+Pj4gaW52YWxpZGF0aW5nIGFsbCBleGlzdGlu
ZyBtYXBwaW5ncyBpbiB0aGUga2VybmVsIChib3RoIGttYXBzIGFuZCBpb3JlYW1wcylhbmQKPj4+
Pj4+IGluc2VydCBkdW1teSB6ZXJvIG9yIH4wIGZpbGxlZCBwYWdlIGluc3RlYWQuCj4+Pj4+PiBB
bHNvLCBJIGFzc3VtZSBmb3JjZWZ1bGx5IHJlbWFwcGluZyB0aGUgSU8gQkFSIHRvIH4wIGZpbGxl
ZCBwYWdlIHdvdWxkIGludm9sdmUKPj4+Pj4+IGlvcmVtYXAgQVBJIGFuZCBpdCdzIG5vdCBzb21l
dGhpbmcgdGhhdCBJIHRoaW5rIGNhbiBiZSBlYXNpbHkgZG9uZSBhY2NvcmRpbmcgdG8KPj4+Pj4+
IGFtIGFuc3dlciBpIGdvdCB0byBhIHJlbGF0ZWQgdG9waWMgYSBmZXcgd2Vla3MgYWdvCj4+Pj4+
PiBodHRwczovL25hbTExLnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0
cHMlM0ElMkYlMkZ3d3cuc3Bpbmljcy5uZXQlMkZsaXN0cyUyRmxpbnV4LXBjaSUyRm1zZzEwMzM5
Ni5odG1sJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzBh
YjZkMTZiYzQ5NDQzZDdkZDI3MDhkOGNjMTlmM2FhJTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJk
OTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ4Mzc1OTEzNzIxMzI0NyU3Q1Vua25vd24lN0NUV0ZwYkda
c2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dp
TENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1tTHFSM1BvTUJ2T29kY05KQTZLNlhQMUFK
N2hpejg0N3klMkJ3JTJCY0dlZ1NaRSUzRCZhbXA7cmVzZXJ2ZWQ9MCAodGhhdCB3YXMgdGhlIG9u
bHkgcmVwbHkKPj4+Pj4+IGkgZ290KQo+Pj4+PiBtbWlvdHJhY2UgY2FuLCBidXQgb25seSBmb3Ig
ZGVidWcsIGFuZCBvbmx5IG9uIHg4NiBwbGF0Zm9ybXM6Cj4+Pj4+Cj4+Pj4+IGh0dHBzOi8vbmFt
MTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRnd3
dy5rZXJuZWwub3JnJTJGZG9jJTJGaHRtbCUyRmxhdGVzdCUyRnRyYWNlJTJGbW1pb3RyYWNlLmh0
bWwmYW1wO2RhdGE9MDQlN0MwMSU3Q2NocmlzdGlhbi5rb2VuaWclNDBhbWQuY29tJTdDMGFiNmQx
NmJjNDk0NDNkN2RkMjcwOGQ4Y2MxOWYzYWElN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRl
MTgzZCU3QzAlN0MwJTdDNjM3NDgzNzU5MTM3MjEzMjQ3JTdDVW5rbm93biU3Q1RXRnBiR1pzYjNk
OGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pY
VkNJNk1uMCUzRCU3QzEwMDAmYW1wO3NkYXRhPXlqRWFSNzNtOHJqTDRBUm8wdXBIbmpTQXRFNHl3
JTJCSEFJU1dDU2dtak9vWSUzRCZhbXA7cmVzZXJ2ZWQ9MAo+Pj4+Pgo+Pj4+PiBTaG91bGQgYmUg
ZmVhc2libGUgKGJ1dCBtYXliZSBub3Qgd29ydGggdGhlIGVmZm9ydCkgdG8gZXh0ZW5kIHRoaXMg
dG8KPj4+Pj4gc3VwcG9ydCBmYWtlIHVucGx1Zy4KPj4+PiBNaG0sIGludGVyZXN0aW5nIGlkZWEg
eW91IGd1eXMgYnJvdWdodCB1cCBoZXJlLgo+Pj4+Cj4+Pj4gV2UgZG9uJ3QgbmVlZCBhIHBhZ2Ug
ZmF1bHQgZm9yIHRoaXMgdG8gd29yaywgYWxsIHdlIG5lZWQgdG8gZG8gaXMgdG8gaW5zZXJ0Cj4+
Pj4gZHVtbXkgUFRFcyBpbnRvIHRoZSBrZXJuZWxzIHBhZ2UgdGFibGUgYXQgdGhlIHBsYWNlIHdo
ZXJlIHByZXZpb3VzbHkgdGhlCj4+Pj4gTU1JTyBtYXBwaW5nIGhhcyBiZWVuLgo+Pj4gU2ltcGx5
IHB0ZSB0cmljayBpc24ndCBlbm91Z2gsIGJlY2F1c2Ugd2UgbmVlZDoKPj4+IC0gZHJvcCBhbGwg
d3JpdGVzIHNpbGVudGx5Cj4+PiAtIGFsbCByZWFkcyByZXR1cm4gMHhmZgo+Pj4KPj4+IHB0ZXMg
Y2FuJ3QgZG8gdGhhdCB0aGVtc2VsdmVzLCB3ZSBtaW5pbWFsbHkgbmVlZCB3cml0ZSBwcm90ZWN0
aW9uIGFuZCB0aGVuCj4+PiBzaWxlbnRseSBwcm9jZWVkIG9uIGVhY2ggd3JpdGUgZmF1bHQgd2l0
aG91dCByZXN0YXJ0aW5nIHRoZSBpbnN0cnVjdGlvbi4KPj4+IEJldHRlciB3b3VsZCBiZSB0byBv
bmx5IGNhdGNoIHJlYWRzLCBidXQgeDg2IGRvZXNuJ3QgZG8gd3JpdGUtb25seSBwdGUKPj4+IHBl
cm1pc3Npb25zIGFmYWlrLgo+PiBZb3UgYXJlIG5vdCB0aGlua2luZyBmYXIgZW5vdWdoIDopCj4+
Cj4+IFRoZSBkdW1teSBQVEUgaXMgcG9pbnQgdG8gYSBkdW1teSBNTUlPIHBhZ2Ugd2hpY2ggaXMg
anVzdCBuZXZlciB1c2VkLgo+Pgo+PiBUaGF0IGhhc3QgdGhlIGV4YWN0IHNhbWUgcHJvcGVydGll
cyB0aGFuIG91ciByZW1vdmVkIE1NSU8gc3BhY2UganVzdCBkb2Vzbid0Cj4+IGdvZXMgYmFuYW5h
cyB3aGVuIGEgbmV3IGRldmljZSBpcyBNTUlPIG1hcHBlZCBpbnRvIHRoYXQgYW5kIG91ciBkcml2
ZXIgc3RpbGwKPj4gdHJpZXMgdG8gd3JpdGUgdGhlcmUuCj4gSG0sIGJ1dCB3aGVyZSBkbyB3ZSBn
ZXQgc3VjaCBhICJndWFyYW50ZWVkIG5ldmVyIHVzZWQiIG1taW8gcGFnZSBmcm9tPwoKV2VsbCB3
ZSBoYXZlIHRvbnMgb2YgdW51c2VkIElPIHNwYWNlIG9uIDY0Yml0IHN5c3RlbXMgdGhlc2UgZGF5
cy4KCkRvZXNuJ3QgcmVhbGx5IG5lZWRzIHRvIGJlIFBDSWUgYWRkcmVzcyBzcGFjZSwgZG9lc24n
dCBpdD8KCkNocmlzdGlhbi4KCj4KPiBJdCdzIGEgbmlmdHkgaWRlYSBpbmRlZWQgb3RoZXJ3aXNl
IC4uLgo+IC1EYW5pZWwKPgo+PiBSZWdhcmRzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+Cj4+Pj4+Pj4g
QnV0IHVnaCAuLi4KPj4+Pj4+Pgo+Pj4+Pj4+IE90b2ggdmFsaWRhdGluZyBhbiBlbnRpcmUgZHJp
dmVyIGxpa2UgYW1kZ3B1IHdpdGhvdXQgc3VjaCBhIHRyaWNrCj4+Pj4+Pj4gYWdhaW5zdCAweGZm
IHJlYWRzIGlzIHByYWN0aWNhbGx5IGltcG9zc2libGUuIFNvIG1heWJlIHlvdSBuZWVkIHRvIGFk
ZAo+Pj4+Pj4+IHRoaXMgYXMgb25lIG9mIHRoZSB0YXNrcyBoZXJlPwo+Pj4+Pj4gT3IgSSBjb3Vs
ZCBqdXN0IGZvciB2YWxpZGF0aW9uIHB1cnBvc2VzIHJldHVybiB+MCBmcm9tIGFsbCByZWcgcmVh
ZHMgaW4gdGhlIGNvZGUKPj4+Pj4+IGFuZCBpZ25vcmUgd3JpdGVzIGlmIGRybV9kZXZfdW5wbHVn
Z2VkLCB0aGlzIGNvdWxkIGFscmVhZHkgZWFzaWx5IHZhbGlkYXRlIGEgYmlnCj4+Pj4+PiBwb3J0
aW9uIG9mIHRoZSBjb2RlIGZsb3cgdW5kZXIgc3VjaCBzY2VuYXJpby4KPj4+Pj4gSG0geWVhaCBp
ZiB5b3VyIHJlYWxseSB3cmFwIHRoZW0gYWxsLCB0aGF0IHNob3VsZCB3b3JrIHRvby4gU2luY2UK
Pj4+Pj4gaW9tbWFwcGluZ3MgaGF2ZSBfX2lvbWVtIHBvaW50ZXIgdHlwZSwgYXMgbG9uZyBhcyBh
bWRncHUgaXMgc3BhcnNlCj4+Pj4+IHdhcm5pbmcgZnJlZSwgc2hvdWxkIGJlIGRvYWJsZSB0byBn
dWFyYW50ZWUgdGhpcy4KPj4+PiBQcm9ibGVtIGlzIHRoYXQgfjAgaXMgbm90IGFsd2F5cyBhIHZh
bGlkIHJlZ2lzdGVyIHZhbHVlLgo+Pj4+Cj4+Pj4gWW91IHdvdWxkIG5lZWQgdG8gYXVkaXQgZXZl
cnkgcmVnaXN0ZXIgcmVhZCB0aGF0IGl0IGRvZXNuJ3QgdXNlIHRoZSByZXR1cm5lZAo+Pj4+IHZh
bHVlIGJsaW5kbHkgYXMgaW5kZXggb3Igc2ltaWxhci4gVGhhdCBpcyBxdWl0ZSBhIGJpdCBvZiB3
b3JrLgo+Pj4gWWVhaCB0aGF0J3MgdGhlIGVudGlyZSBjcnV4IGhlcmUgOi0vCj4+PiAtRGFuaWVs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

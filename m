Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97115355485
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 15:04:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F4D89D2F;
	Tue,  6 Apr 2021 13:04:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 779F289D2F;
 Tue,  6 Apr 2021 13:04:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fTzetIrtEdG02/ILvWv/pmRjVwHbFXCEmkhJjfTmXcSlo7AwOlvdBxvHKDmm+qEmD13nQHExsRlWtG85MfbW+i31DIvKbn/SlJPBDo5Md6YQrd0Syj1AVZwiFcnt5bDDdbAcmpGskhrB6xddazPCSfo+RT6xl4Gb3r9cO97ztFlv+rA8q3oe/YRwHHRs9arDqwhWdj17tmPhgcYozuR3fsUUvyTU1IQH5dcs55oWHrGKLhWgnGEt/cJWHu5hvduACO/ycpGtcgj4GmcpHLYGiPTNGXZCTO0r85gTXjzMIe9vTslROa7AdOGJGGcJnGhWhpLF+N5oFeIkm+ZGG2U1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT89nMYSI0+kg0EhsBPofrFm3m6vnnIJg5+skETDFWU=;
 b=Js0MOb4eYqDyIsgMY2aj6fRN/pAKs0O/uHDnQRj/gYUiNBBHHKggpZu4hJdfBmtBzujdZ0teEE1E70qkZYYXoAkYQYDlXCZE148ix1lxVVIwzH2Qg3H3ht52OY0uyx+T1JzsCj1v+dlPImZ9IP63HWWNhDKlMxd7bOvDmKwd3hrNcJKoRGrIzBkVoppLIO9f2L+xmJ2uW8uNay5shzVqFpFJf0aZkY7TFrJhj9vZ1AoCIAYDCvjDxV54FISXF8b9xfcCdiK6EqL6Uy1RFzwZMpfEUa9XXdO4bG0ouueqHNnixt7lCygS9XUhWtvFOjWf5NO/jJZb/2MkgXDlTdPM9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aT89nMYSI0+kg0EhsBPofrFm3m6vnnIJg5+skETDFWU=;
 b=ky0TbBKcUAoCqwLTTlBOUh5+kbKu1xlkVOrnwyVzBiQi3pV0tOm2EjxuJZZGJgTOmwVcR4XYhhvelbEt9qSQ4dVmHKYG+gg8py4KiHhLjapOfCRD21FwPEmSBzg2kUHjK+J3/tiJa/hjMFQL2bEvprLj20kBUqhk23/UWrFRSGY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4708.namprd12.prod.outlook.com (2603:10b6:208:8d::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.29; Tue, 6 Apr
 2021 13:04:08 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 13:04:08 +0000
Subject: Re: [PATCH 3/8] drm/amdgpu: Implement mmap as GEM object function
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
References: <20210406090903.7019-1-tzimmermann@suse.de>
 <20210406090903.7019-4-tzimmermann@suse.de>
 <6b261dab-4a4d-f0c6-95c0-f720c7df12c1@amd.com>
 <b76d1922-c9a5-8533-657a-2c1149832347@suse.de>
 <0b11de8e-7524-d548-bcc9-b5597f646911@amd.com>
 <a626f328-b6ad-0ab3-b3be-77e6fcb06699@suse.de>
 <365eb20d-d0f6-baf7-77b2-99179291e52f@amd.com>
 <878b7bd3-ea06-679a-4553-0eb3091b02a3@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <4d859bdf-a0c8-34f6-2f84-c7b0f0a226b5@amd.com>
Date: Tue, 6 Apr 2021 15:04:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <878b7bd3-ea06-679a-4553-0eb3091b02a3@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b166:1569:a6c7:85bf]
X-ClientProxiedBy: FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::6) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b166:1569:a6c7:85bf]
 (2a02:908:1252:fb60:b166:1569:a6c7:85bf) by
 FR3P281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1d::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.10 via Frontend Transport; Tue, 6 Apr 2021 13:04:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd872e5b-2d66-440e-d67c-08d8f8fc76ac
X-MS-TrafficTypeDiagnostic: BL0PR12MB4708:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4708D03C07B9482ECBBC0DC083769@BL0PR12MB4708.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bo8LNSh/YyNzZ29+ebJX2HgENmxxqCPGZhBOL1tZ1ykeRkuFcApH2ZnvryGR5VQwBn2uwvF4yYueu9cEs7wUBvHBGTwRjo1MxjTCipIFnv5eDsAE8+9hA/AIcvs2XVwqdN9AbefSasRLT1he9IRW5bjuEtiL57v8p+cVGssolVIaW0NejeG9WWULRmjNHJPfTA68eU4TkBbj+EkDY/oSoHG5vgrIVBwE2WCWyzBilJ7/qxVyRES95r4CxVaVhCWte84w4Ey3CkHQ9H3UOwQlV8H2JcbvMyEEu293F9wfuYBCIC2CuIFsRUJ6Ry9f2ci/QsKfyIeRlUUa8rF8UPdmmMzZaVnQjN3OussOrZYlxpGzOvurbOpg6b0iFakXyy1bssTyKvWc7P6YYOSaSI2kkCLOhKan9VmmIkIT1C4a8Bl9XonLt3X1cNayCYepvHjApJAcAI4IXLzjg2yIJoIARBsIJd+DsBEPqLu6rKTIB7q5wumhZ58G39x/9P00QRgHpLn+MGLIeAl7VNC6vPqszu1zQg9/WcVNrkUruozAop9UeYETk+IQyOyCmhQ5V8rcElehc6VVhdAUSHyUrsK9lhw3zuX5Xu4KmRBbx0lzbiVvmbedcpXcWnvVQLwKqFhDJhbuDOX6JxcvQu561uUH/GOA0Hv0ZNLaCSt5kwR3eF0EYtYHcVTHRJpFaZzlt0dIthEhhEU46ZT2bnk0SBvpKmev+8JxxiAXqlRbkxOG0R0vjmgFze5cj+3xmUd29RJ2OfGAl+rCexCelfUwM/FIfrefYM8IFr4u0JrvZwJl/Y6VEy1zSmJmJpxvz1CQapLI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(366004)(136003)(39850400004)(396003)(6636002)(2906002)(8676002)(6666004)(5660300002)(52116002)(31686004)(478600001)(16526019)(966005)(83380400001)(2616005)(36756003)(4326008)(66946007)(38100700001)(186003)(66574015)(6486002)(316002)(8936002)(921005)(66556008)(7416002)(66476007)(31696002)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OTNZaThIbU1lZ093UTYrNmdYMFFLaW5qTHB5MkxqRUdNWEE0L3l1R3hnWnJ4?=
 =?utf-8?B?Rm11ams3YmxUa0M2N2ZqbGZ5Qy94V2ZITzd0U0pMZXNPeENudlFjSC9CWktG?=
 =?utf-8?B?aW85c1FhNDd6VzRzVUZaaEtHMkt1eUNYSXZVTlBaZFpIWFdZSVBmV3hhaHQz?=
 =?utf-8?B?VkJOSFkrS0FIU3Y4TU8yRnJZR0U2dmMxMkVSQTduQVN0QzhrZGExUXEvSDYv?=
 =?utf-8?B?VSs2dkFORVBjeUpCNm4yd0FtNG5SaStoNW1CdGNrVTAyS2JoeS9YeUw3MXJO?=
 =?utf-8?B?dGx5YVJzRDlLVWdQb1BISHNQYW02S0ZBcC9QV1ozUTBRZ2ZTTTZGWFc4ZVpz?=
 =?utf-8?B?SFNtNTlUcGZLcUJEeFE2NnpsQ0FGeHhTL1ZlUExXZytBY0g3TnNqRXllT2pX?=
 =?utf-8?B?djAzVGsxZjMxYndkRVVQYTdnbk9PMkFqVUoyL0psOFlXOGRwbms2ZFl1dVdB?=
 =?utf-8?B?ZnVab0xvU0pWbEhlZ0dDa29VNUtzY2FNc1dCQVhqUCtkN2N3c1RuWi92YTNX?=
 =?utf-8?B?b2FETzFxRGU5MS96eERmMDJ2SmdweWRjOThkb2tOTjl5WU1WVmpZWXhPSEhH?=
 =?utf-8?B?aFRZRE9WVDRJUklXZ2JVVjE0UkxQU09XNnFXYy9RZzIxcDhyQkR0Z1VMZ0h1?=
 =?utf-8?B?VFVQV21hU1gxcW10SDdzeTdoK0k1a2dTMEhqcDlLZlNoaHZvMmZSTDkvVmc0?=
 =?utf-8?B?WnpmS3BlVkVLS2UwaUU1MW1BV2xFZ0ZVNWQxR3JkZkl5OUc4OFY4anBkTXpJ?=
 =?utf-8?B?VjdkNks5OHYxODBXRXJhRmdUdTlBemhwMmVma1ZFemJPZEloNVZEUVdpSUxH?=
 =?utf-8?B?NGJUNkgrTDR2UGplSUtMWnFob1NKQ3lUN0RSWXBtZUpQRjJwNk5ldUpVWGl0?=
 =?utf-8?B?ZmpGSGVaOTlJaFk1ZVBYajFQRHhqRUd4cENqTG92ZW9CZnpRdWkybGdNMjhj?=
 =?utf-8?B?akZNc1J6Q29EMFBNVnNLR1Y5VHNRS3F2Q29WUXUxV1R5bDN0WHgrTGpnT2tK?=
 =?utf-8?B?cHNmRFZwRTBoV0VIWS90VDk4ZmJsckg1cU9hMnlVZXZmSVp4S2liQmhyS25O?=
 =?utf-8?B?YXRuS0JRSmd1MFBrNnV0UHBoeUUwc3BLdlVlVjJESFNETHdmOFV1d2Y0OWpt?=
 =?utf-8?B?WTFkVHZxVXhob3F6VldXaHVzSFJudmpaa01CNCtSZkhnczMxcTdUOUlEZTI5?=
 =?utf-8?B?aVlENUxoOVNsdldDRWxtMGZzRmdoczVMRUYzUzBYNTBIeEdVbWZNOFp3RnF4?=
 =?utf-8?B?UHBoak5Dc0oxOGlzWUxUQlRxMzQrU21xOWNHaTBYd3RGTXcyZituOHZ6aFVw?=
 =?utf-8?B?TXpaQmt5cGNxcURpeGxBUURpOGg3RDdRaUhQN1JQMkNHdmp3TUJsaDNpczZG?=
 =?utf-8?B?QXBBLzUyR25vejljNEtLWEE0TXcxNFY3S0Y2NGl3YjYzMUoyVG96Smt4NitE?=
 =?utf-8?B?cHA3RjVEbzhLTTBvdXpmQnVCbFBmU2thdndjSTYvNkRTaUFsTHZuMlNZN01j?=
 =?utf-8?B?bm1rZEtrZ3VrUFN4dldwU3RZR0gzOEp1WlE1MUw3a1pIQ0hkelFsUFZWM2Ez?=
 =?utf-8?B?N3JzUmJsUmkxdmQ3RlZSNHBVOTBrSEg1NVNFS092aHNNbGx3Um1tb2Exazk5?=
 =?utf-8?B?cWFiU293SGtHTE9sNk40SWNUSWVMNmtrWk9wQWh5S1k2ZU16UkpxL2xNTWsr?=
 =?utf-8?B?V1M3L3ZON2YrSks0d0JrWUg1SytyYW5RR2NUanFrcHRiK2ZFSDNqMTNpR1Nq?=
 =?utf-8?B?RkhLQ0NOcjRhRjdJM01BQXU5STJFd3V4aE5ZUEJ0ZnNOUStYc3FPNy8rOVFL?=
 =?utf-8?B?bGNJQndUVE9OMUQ1ZG8yNFdXeGI4ZHc3SHJhQXpieHRXWkQ2ODJYM0VVdjdI?=
 =?utf-8?Q?0sIFG42BIbwai?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd872e5b-2d66-440e-d67c-08d8f8fc76ac
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 13:04:08.4318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IryEKCvjnRSEdlorOHhEz6ZVg0+40YKh0Z3tpiPmgwdM7o0Tt9YkIPM228m1dGym
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4708
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDYuMDQuMjEgdW0gMTQ6NTIgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMDYuMDQuMjEgdW0gMTQ6NDIgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+PiBIaSBUaG9t
YXMsCj4+Cj4+IEFtIDA2LjA0LjIxIHVtIDEzOjU1IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46
Cj4+PiBIaQo+Pj4KPj4+IEFtIDA2LjA0LjIxIHVtIDEyOjU2IHNjaHJpZWIgQ2hyaXN0aWFuIEvD
tm5pZzoKPj4+Pj4KPj4+Pj4gSW4gdGhlIGVuZCBJIHdlbnQgd2l0aCB0aGUgc2VtYW50aWNzIEkg
Zm91bmQgaW4gYW1kZ3B1X21tYXAoKSBhbmQgCj4+Pj4+IGhhbmRsZWQgS0ZEIHNwZWNpYWxseS4g
TGV0IG1lIGtub3cgaWYgdGhpcyByZXF1aXJlcyB0byBiZSBjaGFuZ2VkLgo+Pj4+Cj4+Pj4gV2Vs
bCB0aGUgcXVlc3Rpb24gaXMgd2hlcmUgaXMgdGhlIGNhbGwgdG8gCj4+Pj4gZHJtX3ZtYV9ub2Rl
X3ZlcmlmeV9hY2Nlc3MoKSBub3c/IENhdXNlIHRoYXQgbmVlZHMgdG8gYmUgc2tpcHBlZCAKPj4+
PiBmb3IgS0ZEIEJPcy4KPj4+Cj4+PiBJIHNlZS4gSXQncyBub3cgZHJtX3ZtYV9ub2RlX2lzX2Fs
bG93ZWQoKTsgY2FsbGVkIGJ5IGRybV9nZW1fbW1hcCgpLiAKPj4+IFsxXSBTbyBkcm1fZ2VtX21t
YXAoKSBjYW5ub3QgYmUgdXNlZCBieSBhbWRncHUuCj4+Pgo+Pj4gSWYgSSB1bmRlcnN0YW5kIHRo
ZSBjb2RlIGF0IFsyXSBjb3JyZWN0bHksIEtGRCBvYmplY3RzIGRvbid0IHVzZSB0aGUgCj4+PiBH
RU0gaW9jdGwgaW50ZXJmYWNlcywgYnV0IHRoZXkgc3RpbGwgdXNlIHRoZSBpbnRlcm5hbCBHRU0g
b2JqZWN0IAo+Pj4gdGhhdCBpcyBwYXJ0IG9mIHRoZSBUVE0gQk8uIEluIHRoaXMgY2FzZSwgYW1k
Z3B1IGNvdWxkIGhhdmUgaXRzIG93biAKPj4+IHZlcnNpb24gb2YgZHJtX2dlbV9tbWFwKCksIHdo
aWNoIGNhbGxzIGRybV9nZW1fbW1hcF9vYmooKSwgWzNdIHdoaWNoIAo+Pj4gaW4gdHVybiBoYW5k
bGVzIHRoZSBtbWFwIGRldGFpbHMgdmlhIEdFTSBvYmplY3QgZnVuY3Rpb25zLgo+Pgo+PiBDb3Jy
ZWN0LCB3ZWxsIHdlIGNvdWxkIGNsZWFudXAgdGhlIEtGRCB0byB1c2UgdGhlIEdFTSBmdW5jdGlv
bnMgYXMgd2VsbC4KPgo+IFRoZSBLRkQgY29kZSBhbHJlYWR5IGNhbGxzIGFtZGdwdV9nZW1fb2Jq
ZWN0X2NyZWF0ZSgpLiBJdCBzaG91bGQgaGF2ZSAKPiB0aGUgb2JqZWN0LWZ1bmN0aW9ucyBwb2lu
dGVyIHNldCBmb3IgdXNlIHdpdGggbW1hcC4gTm90IHN1cmUgd2hhdCB0aGUgCj4gdXNlIG9mIGRy
bV92bWFfbm9kZV9pc19hbGxvd2VkKCkgd291bGQgaW52b2x2ZS4KClRoZSBLRkQgYWxsb3dzIEJP
cyB0byBiZSBtbWFwZWQgd2l0aCBkaWZmZXJlbnQgb2Zmc2V0cyB0aGFuIHdoYXQncyB1c2VkIApp
biB0aGUgRFJNIG5vZGUuCgpTbyBkcm1fdm1hX25vZGVfaXNfYWxsb3dlZCgpIHdvdWxkIHJldHVy
biBmYWxzZSBhcyBmYXIgYXMgSSBrbm93LgoKUmVnYXJkcywKQ2hyaXN0aWFuLgoKPgo+IEJlc3Qg
cmVnYXJkcwo+IFRob21hcwo+Cj4+Cj4+IEZlbGl4IHdoYXQgZXhhY3RseSB3YXMgeW91ciBvYmpl
Y3Rpb25zIHRvIHVzaW5nIHRoaXM/Cj4+Cj4+IFJlZ2FyZHMsCj4+IENocmlzdGlhbi4KPj4KPj4+
Cj4+PiBkcm1fZ2VtX3ByaW1lX21tYXAoKSBkb2Vzbid0IGRvIGFueSBhZGRpdGlvbmFsIHZlcmlm
aWNhdGlvbi4KPj4+Cj4+PiBCZXN0IHJlZ2FyZHMKPj4+IFRob21hcwo+Pj4KPj4+IFsxXSAKPj4+
IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjExLjExL3NvdXJjZS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2dlbS5jI0wxMTU2IAo+Pj4KPj4+IFsyXSAKPj4+IGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y1LjExLjExL3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfYW1ka2ZkX2dwdXZtLmMjTDEyMjQgCj4+Pgo+Pj4gWzNdIAo+Pj4gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTItcmM2L3NvdXJjZS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbS5jI0wxMDUzIAo+Pj4KPj4+Cj4+Pgo+Pj4+Cj4+Pj4gUmVnYXJkcywKPj4+PiBD
aHJpc3RpYW4uCj4+Pj4KPj4+Pj4KPj4+Pj4gQmVzdCByZWdhcmRzCj4+Pj4+IFRob21hcwo+Pj4+
Pgo+Pj4+Pj4+IC0KPj4+Pj4+PiDCoCBpbnQgYW1kZ3B1X2NvcHlfYnVmZmVyKHN0cnVjdCBhbWRn
cHVfcmluZyAqcmluZywgdWludDY0X3QgCj4+Pj4+Pj4gc3JjX29mZnNldCwKPj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1aW50NjRfdCBkc3Rfb2Zmc2V0LCB1aW50MzJf
dCBieXRlX2NvdW50LAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBkbWFfcmVzdiAqcmVzdiwKPj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5oIAo+Pj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5oCj4+Pj4+Pj4gaW5kZXggZGVjMGRiOGIwYjEzLi42ZTUxZmFhZDcz
NzEgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3R0bS5oCj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0
bS5oCj4+Pj4+Pj4gQEAgLTE0Niw3ICsxNDYsNiBAQCBpbnQgYW1kZ3B1X2ZpbGxfYnVmZmVyKHN0
cnVjdCBhbWRncHVfYm8gKmJvLAo+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBkbWFfcmVzdiAqcmVzdiwKPj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3QgZG1hX2ZlbmNlICoqZmVuY2UpOwo+Pj4+Pj4+IC1pbnQgYW1kZ3B1X21tYXAoc3RydWN0
IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKTsKPj4+Pj4+PiDCoCBpbnQg
YW1kZ3B1X3R0bV9hbGxvY19nYXJ0KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pOwo+Pj4+
Pj4+IMKgIGludCBhbWRncHVfdHRtX3JlY292ZXJfZ2FydChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmpl
Y3QgKnRibyk7Cj4+Pj4+Pj4gwqAgdWludDY0X3QgYW1kZ3B1X3R0bV9kb21haW5fc3RhcnQoc3Ry
dWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIAo+Pj4+Pj4+IHVpbnQzMl90IHR5cGUpOwo+Pj4+Pj4K
Pj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+
Pj4+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4+Pj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo+Pj4+Pgo+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4+Pj4g
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+Pj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4+Pgo+Pgo+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4gaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKPgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

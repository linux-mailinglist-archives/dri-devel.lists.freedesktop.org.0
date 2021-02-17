Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC4E31E185
	for <lists+dri-devel@lfdr.de>; Wed, 17 Feb 2021 22:37:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6E0189C14;
	Wed, 17 Feb 2021 21:37:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690048.outbound.protection.outlook.com [40.107.69.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4A689C14;
 Wed, 17 Feb 2021 21:37:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3rDEwzBc0oJl2GCLvFiwOgYzFEoT3ypAe6jU9v5EJjJBog9Y3Jgm6UtIppk+T+c+yFe7tIao/KnGcV8BJ5JZj38AFWxVEMlXJIaxvdJL3DZyA5NwwahKjaCijeafTO62nNBQ/XH2OUTHIwcXzcshLgPgXvuF2+dzZz2M9zDgjYcYPrQthm+PJPb5jq4KulI6EqJyNpqrqJ/CbYZWnC45LtJbD2zoJRcI+f1mFqcft4V7nVQ5/H6pK9Dnr1/Otsl48K/3LL9QoQoonQnn9CHJa3s/21ePsjTN/slrrPYgpm9xqwEyezvLPyVJWA/CYh8CicaR886Kyv/8ZlS05V+lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OH1jV9ETtjatd/IjXihhFcaGzWLtz5yvMkC70xBKUg=;
 b=VcALdxRbqdZ7RNNkQum9dMkwrqicM1HaWndwzF7nhrl7KmEKYHQQWura/gEIEdxjoEHGwBEzIsPJJvF33F9T9WEAZ2SnPl7Jh2IIYHSgB7/emLJ3ElzKmWATSP6O0rCSo2iqNnkEu25L606BJybzlMg+h2n1oRvnUFol+ZLq2x6Nzktt6hoUTD2Z8nwSGNJSXU/jzOL9J6tiaGo77fpZYJ4XUYC6NgoO/3CtoH3X5B/Y2fqhxWy8ZnMqYw2Jwgm92vuuQhxfA16Gxq0ZYG1EydEirCmLdcM24zk/QtjSrNxo3rGL+G7RiPZ/ETFapdbWl8TIkxcWWdLb3PN75RPPRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1OH1jV9ETtjatd/IjXihhFcaGzWLtz5yvMkC70xBKUg=;
 b=BLxrODfZ3dmy2Dh/qRA9Jd3jHHMKY0iHFWq+hUWRI80kUoquc5RA+gsXWBQlUQ066Ti8GAWXG4y/T25zgm37DYmfUGBfzI1IVkBvIiQpQW1gLfe1Nr7zxnesDSCIGwkMmufUusAWZifsTQCGIEiuTfu876hI3tme8YOysj1MtPc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2765.namprd12.prod.outlook.com (2603:10b6:805:77::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.38; Wed, 17 Feb
 2021 21:37:35 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3846.025; Wed, 17 Feb 2021
 21:37:35 +0000
Subject: Re: [PATCH] drm/scheduler: Fix hang when sched_entity released
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <1613495262-22605-1-git-send-email-andrey.grodzovsky@amd.com>
 <5d8f4e4f-fa2f-037b-d288-b4286e23e77a@gmail.com>
 <ddd98d12-4675-b861-f03c-6b87a34713a8@amd.com>
 <7605d972-41e4-f9f7-7905-5f69a1574e3d@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <6f3a5f49-613a-1bef-7fe3-0debc1340e38@amd.com>
Date: Wed, 17 Feb 2021 16:37:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <7605d972-41e4-f9f7-7905-5f69a1574e3d@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:1c58:abdf:5837:609f]
X-ClientProxiedBy: YT2PR01CA0014.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::19) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1c58:abdf:5837:609f]
 (2607:fea8:3edf:49b0:1c58:abdf:5837:609f) by
 YT2PR01CA0014.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.36 via Frontend Transport; Wed, 17 Feb 2021 21:37:34 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6e10ed45-d6b1-42bb-23d2-08d8d38c3d4c
X-MS-TrafficTypeDiagnostic: SN6PR12MB2765:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2765FD0D4881349239866519EA869@SN6PR12MB2765.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uOWzrIB4mXJmz+5qc+Uk8GrCfzKcMCLV3KVEhsOT+av+cQZSXN+4GS6fiB43dcekcZDGneynlIdNfguYXklc+o3YoHpT0zY91pJlvNvaDjoqOF19cpz8IhQLQRZdtlYlvDk7nNNsEPcM9tGfTJkZT7zZtGQOpT3ccshf38YdD5Vqq13I/Mh3GKFik6me5yi9hnSeuZ3UkXFnY4VzIh8WuMJD5fiWbBaZOzbM+6yOz4+EIh0fkZNY1KL7X5zR4aYX/c/oBc/Ei1XkDABsxGpRD7+6FeWihMmeDNsKwaNQ2NaSytD2yZnXk9cnrU/+l/Hme02CwaQsbdIKBXUAEsgg5Ie2b4grNlpDFE/9fFi+ztykovpYSojkN8ZmkohWFJAnYNILJ2OYWKH8kNF0CsUnEqj2JFu0u+1w4D9OGl0OH3XqHW1OC9Y589qFKb2SVBSLAxyjnv99V4Wf8x/WgmOgV9FZEfKFRcX5CTiUXb9S9RoH7siSXMt2bWZpKNjL/qgpVIJZ5U4F+e47iOguQbjF4W33PeI+EXDvMY01hlnexfaDZXlPLzntT5sPeXCInhTm8luWDmc9cXdTuruRFAhaWjkiTygtnn8yynR89GbYg+0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(86362001)(2906002)(8676002)(36756003)(66574015)(478600001)(53546011)(5660300002)(31696002)(16526019)(316002)(186003)(83380400001)(2616005)(66946007)(66476007)(52116002)(66556008)(6486002)(31686004)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RVBscjN2QWJtMUV3RXIySEhFV2FQK3p1Z0dRYXhoR3RVcktrYTFlOHk3eXoz?=
 =?utf-8?B?UWNEWi82OVNaZzVYVCtjbmhGbDV2WlNSby8zSVhmMW84S2xlaVFwWTdJNmx5?=
 =?utf-8?B?Q0RxaUZsRTdQZit6dlM0dFZIMTlPc3dJL0pnOFN3Y1FUbUZIMThVdVg0ekUv?=
 =?utf-8?B?U1JlbWRJMmM1Si8ySTk0VWMxYk5BNVh4SDQxeFFJUVp3MWl0U1NwRXBocUpz?=
 =?utf-8?B?VTRJNTYzeTZkaFY3NStYZXZPam9vMlpMMzg5TXkrME9IZUphM1dlc1VVN1VJ?=
 =?utf-8?B?MDlad2VtQ3lGR3FMU3NHY09tWlNacW9jWi9Kc0krN3R1USsreVJzeUR5SStq?=
 =?utf-8?B?U0RkWGRpR1Arc1dUNWJoQnN5U0g0SG81TUFraHRUWHd1Z29Mb0tPRGRpWS96?=
 =?utf-8?B?YVlvVUJvMUVxMWRoTi81cEtDOExkZ3RMcEZUYUQ3VVY2bDRwaFpkOHMxamhJ?=
 =?utf-8?B?UmV6WjdVNk9IdWlSNk9hN2pKTTlVUml5VTI3OXJHNmVPTVN5dno4RWYralVF?=
 =?utf-8?B?bnV5NzJkczIxZ3NJS2o0cTFaOTBYeE1mTnpNd0lmSWVhUFF6YVQzM3hhZ2Zy?=
 =?utf-8?B?TEUwSS9TdmIzaXFybHp5aVd6aTR6R0lldWRSTGhmbTR1TW5TQmpKN3JZekdH?=
 =?utf-8?B?a3FST0E3SWNVNU90dUhSR3NiQjVxenhBUEF1YUJLYUcrbUtvV1dUbjVnRzJZ?=
 =?utf-8?B?Yno5UjljR2lCOExFRlV5dmhjcnc5Z1U5UzhsTk95M1EyUnc2K2JubmEvS3V5?=
 =?utf-8?B?WlZMSjZTaDB3ekFqYmxoNGoralN6SnZ5WnVsQVpFRWk3ZnYzMkxpdE5XdVlC?=
 =?utf-8?B?UXljZ0M5elU0TG5uQngwWEhTdExRN3BtZGw1cUdhSDNPUjNubmRmOHZNSExu?=
 =?utf-8?B?ZFBYdjlBTEprTUt0bGhUSzhtY2tOWDErY3BPNWpPV0c3b3J3dHZCcURWekh5?=
 =?utf-8?B?aXI2QlkvcllGTXJhaUo1dExUcjd6b3p2K1dTTm9iREpsdHoyZDQxblpId1Vk?=
 =?utf-8?B?TWZUK2xTbVdxNGJJbHU3b05ab3JxMHExVXRzczFQYkZLRGFRQjExM2RtaE1n?=
 =?utf-8?B?a3lSTjluNTZXa2lYQ0VzWXgzV3RSSDFkQlV1eXlCdDVWcU9uWWpEK2J2YTZp?=
 =?utf-8?B?eVJLNWlVYWpzaExXMk5OTTI0aS9QTEw4M25jZHlYYW1PM0lrRjFyWkJiY1Ji?=
 =?utf-8?B?aHo2NUZId3BVZDNHRk9pYXdLR3hPSlRoSTlLZDhoLzA3M3NyazVVcHBJMC9r?=
 =?utf-8?B?ZVArNGdneFRhaHFja3E5SU5YcWNJYmhxeTl6bWFaL2JrMmtNNVpJZ044T240?=
 =?utf-8?B?RjFjZlJjS1luclVSWDVXVm1IN3Z0Q2pOdWtzVko3T1crR3psRDA3MDF2ZVBp?=
 =?utf-8?B?cWo1V2RENkM5TzB4UFhPZnE0bW1Obzl4dHFKaHdZU1FmR0NMR0ZDNWdZNFpM?=
 =?utf-8?B?ckg0SkR6T0xmamY2KzdFam8vRmJzZ3hkYmplWi9WOXBpcnFEVkQ0YU85eTlq?=
 =?utf-8?B?R0Nad0dsSXFIVHhoeFUxUGtEZW4yR1B3angzaWpYM0krS2t6Qk5EZGhmbWw5?=
 =?utf-8?B?K2hKbjlWdWU2UE0zSy80MURZcjVmTS9hWk03MGRLSzJkbm1pMVZoL2tDY2U0?=
 =?utf-8?B?NnFKZ0xrUXdCQkUxNDlYTTZ2ZTlsbGVZWmpXV2pMd2o4aWtiK2hqUVNWMGM0?=
 =?utf-8?B?VmFpZllsUHJEY2NLZVRacDgzQ1A3SW90NmNQTkVHbEEyNkRZaHVvQnhUZEp3?=
 =?utf-8?B?YkRCMWRVMy9RRXlIclpMaHp0NlhOb3pOb1lTcys2b2tSZ3VPdmdnWGJUMG53?=
 =?utf-8?B?VmUvanJVV2p0TVZmZkpVVWhBYi80Mnkzc1pjWkpFQ2FuNU1RYkxrM3hxUEkr?=
 =?utf-8?Q?CxA3XqMIgfqA8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e10ed45-d6b1-42bb-23d2-08d8d38c3d4c
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2021 21:37:35.1426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3C/Gd/s7jqKitL3jrm11hu1WvQiFhWe+nguSoKTdlcQE2NVAUMVZ2Yudu8BzvQeg7DGyDGWh1tjMxUYD8TGfUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2765
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

V2lsbCBkby4KCkFuZHJleQoKT24gMi8xNy8yMSA0OjM3IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdy
b3RlOgo+Cj4KPiBBbSAxNy4wMi4yMSB1bSAyMjozNiBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5
Ogo+Pgo+PiBPbiAyLzE3LzIxIDQ6MzIgUE0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBB
bSAxNi4wMi4yMSB1bSAxODowNyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+IFByb2Js
ZW06IElmIHNjaGVkdWxlciBpcyBhbHJlYWR5IHN0b3BwZWQgYnkgdGhlIHRpbWUgc2NoZWRfZW50
aXR5Cj4+Pj4gaXMgcmVsZWFzZWQgYW5kIGVudGl0eSdzIGpvYl9xdWV1ZSBub3QgZW1wdHkgSSBl
bmNvdW50cmVkCj4+Pj4gYSBoYW5nIGluIGRybV9zY2hlZF9lbnRpdHlfZmx1c2guIFRoaXMgaXMg
YmVjYXVzZSBkcm1fc2NoZWRfZW50aXR5X2lzX2lkbGUKPj4+PiBuZXZlciBiZWNvbWVzIGZhbHNl
Lgo+Pj4+Cj4+Pj4gRml4OiBJbiBkcm1fc2NoZWRfZmluaSBkZXRhY2ggYWxsIHNjaGVkX2VudGl0
aWVzIGZyb20gdGhlCj4+Pj4gc2NoZWR1bGVyJ3MgcnVuIHF1ZXVlcy4gVGhpcyB3aWxsIHNhdGlz
ZnkgZHJtX3NjaGVkX2VudGl0eV9pc19pZGxlLgo+Pj4+IEFsc28gd2FrZXVwIGFsbCB0aG9zZSBw
cm9jZXNzZXMgc3R1Y2sgaW4gc2NoZWRfZW50aXR5IGZsdXNoaW5nCj4+Pj4gYXMgdGhlIHNjaGVk
dWxlciBtYWluIHRocmVhZCB3aGljaCB3YWtlcyB0aGVtIHVwIGlzIHN0b3BwZWQgYnkgbm93Lgo+
Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92
c2t5QGFtZC5jb20+Cj4+Pj4gLS0tCj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9z
Y2hlZF9tYWluLmMgfCAzMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+Pj4gwqAg
MSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYyAKPj4+PiBiL2RyaXZlcnMvZ3B1
L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+Pj4gaW5kZXggOTA4YjBiNS4uMTFhYmY1ZCAx
MDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX21haW4uYwo+
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+Pj4gQEAg
LTg5Nyw5ICs4OTcsNDAgQEAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfaW5pdCk7Cj4+Pj4gwqDC
oCAqLwo+Pj4+IMKgIHZvaWQgZHJtX3NjaGVkX2Zpbmkoc3RydWN0IGRybV9ncHVfc2NoZWR1bGVy
ICpzY2hlZCkKPj4+PiDCoCB7Cj4+Pj4gK8KgwqDCoCBpbnQgaTsKPj4+PiArwqDCoMKgIHN0cnVj
dCBkcm1fc2NoZWRfZW50aXR5ICpzX2VudGl0eTsKPj4+PiDCoMKgwqDCoMKgIGlmIChzY2hlZC0+
dGhyZWFkKQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBrdGhyZWFkX3N0b3Aoc2NoZWQtPnRocmVh
ZCk7Cj4+Pj4gwqAgK8KgwqDCoCAvKiBEZXRhY2ggYWxsIHNjaGVkX2VudGl0ZXMgZnJvbSB0aGlz
IHNjaGVkdWxlciBvbmNlIGl0J3Mgc3RvcHBlZCAqLwo+Pj4+ICvCoMKgwqAgZm9yIChpID0gRFJN
X1NDSEVEX1BSSU9SSVRZX0NPVU5UIC0gMTsgaSA+PSBEUk1fU0NIRURfUFJJT1JJVFlfTUlOOyAK
Pj4+PiBpLS0pIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9zY2hlZF9ycSAqcnEg
PSAmc2NoZWQtPnNjaGVkX3JxW2ldOwo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKCFy
cSkKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+PiArCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIC8qIExvb3AgdGhpcyB3YXkgYmVjYXVzZSBycS0+bG9jayBpcyB0YWtlbiBp
biAKPj4+PiBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eSAqLwo+Pj4+ICvCoMKgwqDCoMKgwqDC
oCBzcGluX2xvY2soJnJxLT5sb2NrKTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgd2hpbGUgKChzX2Vu
dGl0eSA9IGxpc3RfZmlyc3RfZW50cnlfb3JfbnVsbCgmcnEtPmVudGl0aWVzLAo+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSwKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbGlzdCkpKSB7Cj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgc3Bpbl91bmxvY2soJnJxLT5sb2NrKTsKPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBkcm1fc2NoZWRfcnFfcmVtb3ZlX2VudGl0eShycSwgc19lbnRpdHkp
Owo+Pj4+ICsKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBNYXJrIGFzIHN0b3BwZWQg
dG8gcmVqZWN0IGFkZGluZyB0byBhbnkgbmV3IHJxICovCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3Bpbl9sb2NrKCZzX2VudGl0eS0+cnFfbG9jayk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc19lbnRpdHktPnN0b3BwZWQgPSB0cnVlOwo+Pj4KPj4+IFdoeSBub3QgbWFya2lu
ZyBpdCBhcyBzdG9wcGVkIGFuZCB0aGVuIHJlbW92aW5nIGl0Pwo+Pj4KPj4+IFJlZ2FyZHMsCj4+
PiBDaHJpc3RpYW4uCj4+Cj4+Cj4+IFlvdSBtZWFuIGp1c3QgcmV2ZXJzZSB0aGUgb3JkZXIgb2Yg
b3BlcmF0aW9ucyBoZXJlIHRvIHByZXZlbnQgYSByYWNlIHdoZXJlIAo+PiBzb21lb25lIGFkZGlu
ZyBpdCBhZ2FpbiB0byBycSBiZWZvcmUgbWFya2luZyBpdCBhcyBzdG9wcGVkID8KPgo+IEV4YWN0
bHkgdGhhdCwgeWVhaC4KPgo+IENocmlzdGlhbi4KPgo+Pgo+PiBBbmRyZXkKPj4KPj4KPj4+Cj4+
Pj4gKyBzcGluX3VubG9jaygmc19lbnRpdHktPnJxX2xvY2spOwo+Pj4+ICsKPj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBzcGluX2xvY2soJnJxLT5sb2NrKTsKPj4+PiArwqDCoMKgwqDCoMKg
wqAgfQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBzcGluX3VubG9jaygmcnEtPmxvY2spOwo+Pj4+ICsK
Pj4+PiArwqDCoMKgIH0KPj4+PiArCj4+Pj4gK8KgwqDCoCAvKiBXYWtldXAgZXZlcnlvbmUgc3R1
Y2sgaW4gZHJtX3NjaGVkX2VudGl0eV9mbHVzaCBmb3IgdGhpcyBzY2hlZHVsZXIgKi8KPj4+PiAr
wqDCoMKgIHdha2VfdXBfYWxsKCZzY2hlZC0+am9iX3NjaGVkdWxlZCk7Cj4+Pj4gKwo+Pj4+IMKg
wqDCoMKgwqAgLyogQ29uZmlybSBubyB3b3JrIGxlZnQgYmVoaW5kIGFjY2Vzc2luZyBkZXZpY2Ug
c3RydWN0dXJlcyAqLwo+Pj4+IMKgwqDCoMKgwqAgY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZz
Y2hlZC0+d29ya190ZHIpOwo+Pj4KPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK

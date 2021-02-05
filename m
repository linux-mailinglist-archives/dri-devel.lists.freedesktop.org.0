Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF4A310DC8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Feb 2021 17:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B5B16F488;
	Fri,  5 Feb 2021 16:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2074.outbound.protection.outlook.com [40.107.223.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A981E6F488;
 Fri,  5 Feb 2021 16:22:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRIxlsDOzLLtGRErDN1KzsfJUGlsAXoh7glZg4NXAcERxuuB7ebGfVUY4pCo6QQMj7V4gcA0fF2XSsiZuXdRDxCgCrZydKP08M+LcOFu7Y+/3Ljbj98i5Bvm77fsLUB9EdxBh/ZYw+LpeE/fsq8JCvmbLcnVE1AzSnEZCGN6KSevMpexmqFnomrrfnVgg/LflEqETLq6DRz+dwWezMyUI20wVj0gUCz7RE581AYIn1P7vjcuA+fDAfFMBebeJ9ifk7DzwhKh75t5klJ82YoQazmK315mDdrbmkUTIPWNrPENX5UbZvqELMgGaLaEtmUTE8vp6dcAvShY6/IkpiPTaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSpgIRgs0kMWOo9gVLtfhHfdOPg4B/aCdJH7JjLBu+E=;
 b=A3U90npUtqEz0gZNxMVyl18BQ4oygTHu2ML8+IfnvMK0z3w9eQmN42mO51Ak2ENG7hEVWe7nLHJoj1Js/Qnb3vz3vfmOIIGtplaJvCnnxxKxb2PD9HFNzD57G6WBH/Q37RTm7HDvUWf15Inuaiw/GAhVPucoLCqCS1Yn/Aseb3AZRGYbOo0IwKwaeJV+49TL4aVaAhfryD8vlumj1oQpCQtJozi8csQjr/4R50hQ6WqCmPfSyoixbcvNzWzNWk+wrH3y0zA2AQu4nr2QqGDWX3AuphDbbxPQbRO5K/mJpE6qzCaEFla6lGtulOEhT1AclGCbYfyaijx3CQ2gqYX2/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSpgIRgs0kMWOo9gVLtfhHfdOPg4B/aCdJH7JjLBu+E=;
 b=pMZWvDK362/SCZdmA4+gB/tp7ieJS8Yn60eSfljfeYAXRVeXz/OJMRSSQ6uMloJhogx89zIdVDWLtVj3kqupNH1LulBs92DscVdZdBg1SjW4Vh+Cmz/9mg3FHygdvZV26TFyyvFTfC4quxivF6PDQv1P6Hmmtf7NBgrjGmCheRM=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.20; Fri, 5 Feb
 2021 16:22:51 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::41b1:11f5:fd1e:fc5f%5]) with mapi id 15.20.3825.023; Fri, 5 Feb 2021
 16:22:51 +0000
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: christian.koenig@amd.com, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
 <1611003683-3534-12-git-send-email-andrey.grodzovsky@amd.com>
 <35ecd67f-620f-df50-3e03-d24dc12452d6@gmail.com>
 <8925db97-bf81-7e5e-527d-f654713b400d@amd.com>
 <CAKMK7uHCzBpaC2YypKeQwbJiT0JG2Hq7V0BC5yC88f9nqgxUiw@mail.gmail.com>
 <8ed4a153-d503-e704-0a0d-3422877e50fa@amd.com>
 <91b8ea73-aa69-1478-2e7c-63ab1cb250ae@gmail.com>
 <7834dbdf-27ad-f21d-b58b-2772a598ea8a@amd.com>
 <07dceec0-0be9-1531-0357-353f04d1cb2b@amd.com>
 <69f036e2-f102-8233-37f6-5254a484bf97@amd.com>
 <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <78e4705d-c55f-6c68-d0f9-b1939b636121@amd.com>
Date: Fri, 5 Feb 2021 11:22:46 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <0b502043-5a66-dcd5-53f9-5c190f22dc46@gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:5454:6ba:dbb:af87]
X-ClientProxiedBy: YT1PR01CA0125.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::34) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:5454:6ba:dbb:af87]
 (2607:fea8:3edf:49b0:5454:6ba:dbb:af87) by
 YT1PR01CA0125.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Fri, 5 Feb 2021 16:22:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4c83ffa2-9561-49fc-b871-08d8c9f2485d
X-MS-TrafficTypeDiagnostic: SA0PR12MB4416:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44160D8246EE4BBFADF0D70FEAB29@SA0PR12MB4416.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OtLAt2YnncK0go8dOCThJHamKV2XIQuYP0vtzhwTwBiAKwjgG68WBE1zQTBgIWN6+lJfPCNIhDcxqJ/IdLROBiQcj97x7p/PB7R3V9Zv75NdDdV5bvhZIHm4qjdawEf+jYJqDtm6EomlLvOp1ksRlafE15BUo3y27M2cP5/UHAYNpi5lzKSbf5bQH6qe1rSxrjqkCYlsW4znTLg8gaW9Q0T2SFwvshFM5loGF5k6dk5fuB4K7/X14+PNM0s386Mckn5kUNSiujzlkNSrPuV6naldfItELeYOHZ1LWKUOfkQqXfE+pSND4VAwwu/WSKvRHw9bwfKJKO39bKk/PPyZaL1uNIlQm5hZuAlZnw77etrzZMRR4hI6fvA3Wao6G4Jyt1F0EPE6egMVZ6PaTpzBqPBHZpoRD5s7giTGhaEqztgNhGyh2uHk2OFmT4ML5xw2zsy9SdYzeXA2jqoCtePSpJol7V1kBxXVE5n41KnMvLv654ZJA/l7vEc/imrgyiI5OFa2AGKBJFhJlyU07aibndungu/hx4WechI29i4DSl921I5ytE3hwqTvmhv6Q50kl/rysdjLD3sJLAmsxUgL0fGSvghMtxzcTa6A2YblG2DE9LWqJskQPmCgpuDbWDjKnXEFy+4NXjtkssHvtgF79Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(346002)(366004)(39860400002)(54906003)(186003)(6486002)(2906002)(316002)(31696002)(31686004)(66946007)(966005)(66476007)(66556008)(2616005)(53546011)(16526019)(45080400002)(478600001)(4326008)(83380400001)(6916009)(6666004)(52116002)(5660300002)(86362001)(36756003)(8936002)(8676002)(66574015)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?cDdlZXliTW1ObmpMNTNXc3Y2ZmdXUGxBWGoydC9TQzVhZUl2VUlXQWw3eXA1?=
 =?utf-8?B?OXJTcm1sS1djVlNxZlRmbk5XaEJUM0d4QW1QTGdFUDkzNjVYaTNkOG1kbmZp?=
 =?utf-8?B?WU9JRTdPb1IzdDNOQWFWdlhtTFdtVktFZzJ1aVVwVHpLaElvQllmTEdsOGpk?=
 =?utf-8?B?Mzd6bGFLQXBPTXljSXV6WWlHU1lObC9zRW16elcwREI0NXNmNWxidG5YN2VJ?=
 =?utf-8?B?aTkvbGJLc0hLbkdkaHcyczYyQjFieXhRaFE2Z2RqM3k3dk40WTh4VW1rSjk2?=
 =?utf-8?B?aGVaU2Q5UGNlblpNbEVaVXo2a3dQLzdINWpoOG02c2N5ZEYyMi8za2hvUjNG?=
 =?utf-8?B?TldRdjI2WjB6dGVlQzZSYXIweGdtNG9ITVRUMEhndGNxcDhiNWt2MERrN242?=
 =?utf-8?B?VkFzNCtERWtxV292eUQ0cWd2UUFaeDdpL1Izb2IxNjcyNmVlZUZJV3YxVUdl?=
 =?utf-8?B?L2hXZkc2Q1V1ZERIU1NTQldSS2FYUnRyYmxtcm1aKzRRc1RFUXJTcFZ5VVU5?=
 =?utf-8?B?ZWcvaXI2dUV2NE8zanpacExqYW9Xbm5sWnNCM0pvd0dnTmhEYlhXTTViV0tv?=
 =?utf-8?B?Q28zMlNhakZHMGtaZlliTGFFOHBib2gyazByMzRNL1QraGdpZWZQclIxZHpa?=
 =?utf-8?B?c2h4aEgwYlRtY2g2Q0VSVldtR2wrenBxMlJoVGtIWGtQd0xrTHZvTTJnbFds?=
 =?utf-8?B?OWpaVDBiTTJMY3h4Z2dzZEJ6c1hWaDJqMDFWVG93ckduaHNHdE9BY2R3Q1Jk?=
 =?utf-8?B?RkhKY3F5V0hJejhidk45UVorRGpwZmZiVnE3WDBmaGwrOFVTREgyR1lubkg1?=
 =?utf-8?B?amY3eTlzenFkWlB5cGIvd0lRcmRrYzIrMHk2VnVZcmtzUzIxN3NuUWpyVlIr?=
 =?utf-8?B?QS90dExobGJoM3JkMmpiMlJlalFCYThhWnVTVnZuWTlNMVRUQWw2MUdaRXho?=
 =?utf-8?B?cUtuYjJDMTAvcElMamhMN1FmQ29nemZ3eXh6NHRQUHlLTXlrQVZJNllZZWFN?=
 =?utf-8?B?UG1IOXNraHJEWFRBRU5hdWhCZ0tYbTFDNkhSNE13QmRuLzg1dkwxRHN1Q2Ft?=
 =?utf-8?B?dFEzU1FvMm9rTFhFdURwVFRraDNLd2ErZ3FaR3JVRG5QZ1Y5THkxK2wra3dl?=
 =?utf-8?B?ZUJoNkJoc3I0VTZIL3VGb1RBU2tRM3drVTBmQlE4ZGhiRGd0eURmNVJHMXRw?=
 =?utf-8?B?R1doYVJ3bGRGamZTeFQwRUVPTUwydmhMaUVOVFpvTmhpWVpKdTJqL1h3OSsx?=
 =?utf-8?B?ZXgwWkU4Q1V0eXZBZ1JaanRWWlhxQTVnTTAzamdaYVNmbFVnWTc5YlpUdHhs?=
 =?utf-8?B?Vm4vNzl1QVNGMmdUUlRCUWVkWWNzZ0ZKYmhqSTZwNWQvUjJEK05GcVBKTWNY?=
 =?utf-8?B?M3NyU3ArbnZoRnFwcUNjZXFQcjZCaVd5aWhEMm56bUFETGRpbXBpYWc3aFlD?=
 =?utf-8?B?RXFRS0hpVTJ2Sm1xaGRvMnJkcjJvV0tDME5WV2lkZVREN1FGc2pBdmozOUNt?=
 =?utf-8?B?aEdYQkVSb0ZMdmVyRWl2NmFHdlRaZnJsa3lLaktaNGpjeGROL05xUjhkN3NN?=
 =?utf-8?B?M2t0SGd1Q2VkUkxjSlIzcHlKZ0ZNUXVFREI1ZW56UmRJZ3Ywa1Mzd3ROTmth?=
 =?utf-8?B?dTkxU0lyM1dSYWl4bmFRaW4rUlJRM0JtdFpXaUF6b0xwaWVnUWtHdkFJS3Rh?=
 =?utf-8?B?b0RDaUJzMnBnVC9BaTU1T1c5NGF5RUhPMEtJY28xTTNxQzgrU0FPTWxqbmlW?=
 =?utf-8?B?ai9CbVpMdlJjNzgwMkR3WE5RaUJGdThBZUJKQmJGMStWajAyMDhJMjRWM2Fh?=
 =?utf-8?B?emQzTGN1T05lMmJLbjNLenNRb1hTZW41V3FEWEw1TEVGYjNQVGlsczBCUWZ0?=
 =?utf-8?Q?XPw95qmjSaEAt?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c83ffa2-9561-49fc-b871-08d8c9f2485d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2021 16:22:50.8434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgnguTPAlqbvKnU6DV6Ge/wV2gSTJ0WKDC2C6Bq/GIPQgmcYuXJ7BSjwTNq3DrBJV6y1kWryw2EIRnJZLBBSzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416
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
Cc: Greg KH <gregkh@linuxfoundation.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <Alexander.Deucher@amd.com>, Qiang Yu <yuq825@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuaWVsLCBwaW5nLiBBbHNvLCBwbGVhc2UgcmVmZXIgdG8gdGhlIG90aGVyIHRocmVhZCB3aXRo
IEJqb3JuIGZyb20gcGNpLWRldgpvbiB0aGUgc2FtZSB0b3BpYyBJIGFkZGVkIHlvdSB0by4KCkFu
ZHJleQoKT24gMS8yOS8yMSAyOjI1IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDI5
LjAxLjIxIHVtIDE4OjM1IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Cj4+IE9uIDEvMjkv
MjEgMTA6MTYgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+PiBBbSAyOC4wMS4yMSB1bSAx
ODoyMyBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Cj4+Pj4gT24gMS8xOS8yMSAxOjU5
IFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+PiBBbSAxOS4wMS4yMSB1bSAxOToyMiBz
Y2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4KPj4+Pj4+IE9uIDEvMTkvMjEgMTowNSBQ
TSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+Pj4+PiBbU05JUF0KPj4+Pj4+IFNvIHNheSB3cml0
aW5nIGluIGEgbG9vcCB0byBzb21lIGhhcm1sZXNzIHNjcmF0Y2ggcmVnaXN0ZXIgZm9yIG1hbnkg
dGltZXMgCj4+Pj4+PiBib3RoIGZvciBwbHVnZ2VkCj4+Pj4+PiBhbmQgdW5wbHVnZ2VkIGNhc2Ug
YW5kIG1lYXN1cmUgdG90YWwgdGltZSBkZWx0YSA/Cj4+Pj4+Cj4+Pj4+IEkgdGhpbmsgd2Ugc2hv
dWxkIGF0IGxlYXN0IG1lYXN1cmUgdGhlIGZvbGxvd2luZzoKPj4+Pj4KPj4+Pj4gMS4gV3JpdGlu
ZyBYIHRpbWVzIHRvIGEgc2NyYXRjaCByZWcgd2l0aG91dCB5b3VyIHBhdGNoLgo+Pj4+PiAyLiBX
cml0aW5nIFggdGltZXMgdG8gYSBzY3JhdGNoIHJlZyB3aXRoIHlvdXIgcGF0Y2guCj4+Pj4+IDMu
IFdyaXRpbmcgWCB0aW1lcyB0byBhIHNjcmF0Y2ggcmVnIHdpdGggdGhlIGhhcmR3YXJlIHBoeXNp
Y2FsbHkgZGlzY29ubmVjdGVkLgo+Pj4+Pgo+Pj4+PiBJIHN1Z2dlc3QgdG8gcmVwZWF0IHRoYXQg
b25jZSBmb3IgUG9sYXJpcyAob3Igb2xkZXIpIGFuZCBvbmNlIGZvciBWZWdhIG9yIAo+Pj4+PiBO
YXZpLgo+Pj4+Pgo+Pj4+PiBUaGUgU1JCTSBvbiBQb2xhcmlzIGlzIG1lYW50IHRvIGludHJvZHVj
ZSBzb21lIGRlbGF5IGluIGVhY2ggYWNjZXNzLCBzbyBpdCAKPj4+Pj4gbWlnaHQgcmVhY3QgZGlm
ZmVyZW50bHkgdGhlbiB0aGUgbmV3ZXIgaGFyZHdhcmUuCj4+Pj4+Cj4+Pj4+IENocmlzdGlhbi4K
Pj4+Pgo+Pj4+Cj4+Pj4gU2VlIGF0dGFjaGVkIHJlc3VsdHMgYW5kIHRoZSB0ZXN0aW5nIGNvZGUu
IFJhbiBvbiBQb2xhcmlzIChnZng4KSBhbmQgCj4+Pj4gVmVnYTEwKGdmeDkpCj4+Pj4KPj4+PiBJ
biBzdW1tYXJ5LCBvdmVyIDEgbWlsbGlvbiBXV1JFRzMyIGluIGxvb3Agd2l0aCBhbmQgd2l0aG91
dCB0aGlzIHBhdGNoIHlvdSAKPj4+PiBnZXQgYXJvdW5kIDEwbXMgb2YgYWNjdW11bGF0ZWQgb3Zl
cmhlYWQgKCBzbyAwLjAwMDAxIG1pbGxpc2Vjb25kIHBlbmFsdHkgZm9yIAo+Pj4+IGVhY2ggV1dS
RUczMikgZm9yIHVzaW5nIGRybV9kZXZfZW50ZXIgY2hlY2sgd2hlbiB3cml0aW5nIHJlZ2lzdGVy
cy4KPj4+Pgo+Pj4+IFAuUyBCdWxsZXQgMyBJIGNhbm5vdCB0ZXN0IGFzIEkgbmVlZCBlR1BVIGFu
ZCBjdXJyZW50bHkgSSBkb24ndCBoYXZlIG9uZS4KPj4+Cj4+PiBXZWxsIGlmIEknbSBub3QgY29t
cGxldGVseSBtaXN0YWtlbiB0aGF0IGFyZSAxMDBtcyBvZiBhY2N1bXVsYXRlZCBvdmVyaGVhZC4g
Cj4+PiBTbyBhcm91bmQgMTAwbnMgcGVyIHdyaXRlLiBBbmQgZXZlbiBiaWdnZXIgcHJvYmxlbSBp
cyB0aGF0IHRoaXMgaXMgYSB+NjclIAo+Pj4gaW5jcmVhc2UuCj4+Cj4+Cj4+IE15IGJhZCwgYW5k
IDY3JSBmcm9tIHdoYXQgPyBIb3cgdSBjYWxjdWxhdGUgPwo+IAo+IE15IGJhZCwgKDMwODUwMS0y
MDk2ODkpLzIwOTY4OT00NyUgaW5jcmVhc2UuCj4gCj4+Pgo+Pj4gSSdtIG5vdCBzdXJlIGhvdyBt
YW55IHdyaXRlIHdlIGRvIGR1cmluZyBub3JtYWwgb3BlcmF0aW9uLCBidXQgdGhhdCBzb3VuZHMg
Cj4+PiBsaWtlIGEgYml0IG11Y2guIElkZWFzPwo+Pgo+PiBXZWxsLCB1IHN1Z2dlc3RlZCB0byBt
b3ZlIHRoZSBkcm1fZGV2X2VudGVyIHdheSB1cCBidXQgYXMgaSBzZWUgaXQgdGhlIHByb2JsZW0g
Cj4+IHdpdGggdGhpcyBpcyB0aGF0IGl0IGluY3JlYXNlIHRoZSBjaGFuY2Ugb2YgcmFjZSB3aGVy
ZSB0aGUKPj4gZGV2aWNlIGlzIGV4dHJhY3RlZCBhZnRlciB3ZSBjaGVjayBmb3IgZHJtX2Rldl9l
bnRlciAodGhlcmUgaXMgYWxzbyBzdWNoIAo+PiBjaGFuY2UgZXZlbiB3aGVuIGl0J3MgcGxhY2Vk
IGluc2lkZSBXV1JFRyBidXQgaXQncyBsb3dlcikuCj4+IEVhcmxpZXIgSSBwcm9wc2VkIHRoYXQg
aW5zdGVhZCBvZiBkb2luZyBhbGwgdGhvc2UgZ3VhcmRzIHNjYXR0ZXJlZCBhbGwgb3ZlciAKPj4g
dGhlIGNvZGUgc2ltcGx5IGRlbGF5IHJlbGVhc2Ugb2Ygc3lzdGVtIG1lbW9yeSBwYWdlcyBhbmQg
dW5yZXNlcnZlIG9mCj4+IE1NSU8gcmFuZ2VzIHRvIHVudGlsIGFmdGVyIHRoZSBkZXZpY2UgaXRz
ZWxmIGlzIGdvbmUgYWZ0ZXIgbGFzdCBkcm0gZGV2aWNlIAo+PiByZWZlcmVuY2UgaXMgZHJvcHBl
ZC4gQnV0IERhbmllbCBvcHBvc2VzIGRlbGF5aW5nIE1NSU8gcmFuZ2VzIHVucmVzZXJ2ZSB0byBh
ZnRlcgo+PiBQQ0kgcmVtb3ZlIGNvZGUgYmVjYXVzZSBhY2NvcmRpbmcgdG8gaGltIGl0IHdpbGwg
dXBzZXQgdGhlIFBDSSBzdWJzeXRlbS4KPiAKPiBZZWFoLCB0aGF0J3MgbW9zdCBsaWtlbHkgdHJ1
ZSBhcyB3ZWxsLgo+IAo+IE1heWJlIERhbmllbCBoYXMgYW5vdGhlciBpZGVhIHdoZW4gaGUncyBi
YWNrIGZyb20gdmFjYXRpb24uCj4gCj4gQ2hyaXN0aWFuLgo+IAo+Pgo+PiBBbmRyZXkKPj4KPj4+
Cj4+PiBDaHJpc3RpYW4uCj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+IGFtZC1nZnhAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5j
b20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZs
aXN0aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDQlN0MwMSU3Q0FuZHJleS5Hcm9kem92c2t5JTQw
YW1kLmNvbSU3QzdlNjNjN2JhOWFjNDRkODAxNjMxMDhkOGM0OGI5NTA3JTdDM2RkODk2MWZlNDg4
NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQ3NTQ1MTA3ODczMTcwMyU3Q1Vua25v
d24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pC
VGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1Tb3pJWVltSHBrayUy
QjRQUnljczhUN3gxRFlhZ1RoeTZsUW9GWFY1RGRhbWslM0QmYW1wO3Jlc2VydmVkPTAgCj4+Cj4g
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=

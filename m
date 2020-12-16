Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 185A92DC66D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 19:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8AF89ADC;
	Wed, 16 Dec 2020 18:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C570789ADC;
 Wed, 16 Dec 2020 18:26:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8Xca/wGF5sMjX8s+3XuoqQsDFK34b/vYUBOPW5oeyEYtEvgMIb/FrOagO+HaTjyIpM0UHZVvhiMq41OfoWTp8c/JgOhyOLsm4sahob9PHlmg9yean5w60jp+1+gTOC7aDeQkafSiLR33UQ4PzwBA3i7A0CY7wCTVv92Ii59PPNTGLEYE5LoAhwrYub0x++eHTSzudNDqbC00wpSx6+Pylqi/dL3tLF/JyRAcj/vkaqCex8b6FG785axnKgR6AIYl0kGYSQchSvJPn6uiV/zUIceyVsh5PGGpzrTPsTb+fVuZyznheTBtYUpO3+NuqSzdqr+7pFvBmCZfrVrM6bXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgB6K+QGy7FeN6g0JSEvWTrWIepC0EJE9ZdvhW1JgIk=;
 b=AFCWEiqTAbNYu7My7OZVjYZ8goeDPZFmff6Be99nC4ccFQN7My/rNj6l8LXZ2cbZYTe6wMYb3GV5DNp+lZs8x7LadkcTkgSLKuxn8ZXvh61Z/ec07fytfRsgiRcpxDvtZUJ/xxkdLuxhrc3H/D9fHBM0iqyiqIh8JVoOxXJon1U6ncyliAhHn57ZVKWAR2HUqNghxOyPwET7GVhZcsUwse0CLnuTbkrk76OKhLYWqDNyLmhLa5qus0x0ihzzDwujdRC47cnRMgT+dwKMcCqT6JnwnQ/B7v5rRkLs7kAyIl+xCQgRx1nF+ZCWQ5tSicFjUHuTFNptEV7J24Udkmnp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgB6K+QGy7FeN6g0JSEvWTrWIepC0EJE9ZdvhW1JgIk=;
 b=UXDQ3kUlNGOZBH5eezDlPrTTgHHDTZkU4pZYPACenR6X9OY6SCUmo1aZ0fO0aMOmyikmemDGoGopZtkKv/Tmo+se+Wts3PDtqXv3cF+YbMsvySjHFmUUP1lAHgWZrLK/UsdZMtXyQvDJ4TUvfBLZDvMsDR0UBZ3Ez6z4nMky6MY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1664.namprd12.prod.outlook.com (2603:10b6:301:b::15)
 by MW2PR12MB2458.namprd12.prod.outlook.com (2603:10b6:907:8::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.19; Wed, 16 Dec
 2020 18:26:34 +0000
Received: from MWHPR12MB1664.namprd12.prod.outlook.com
 ([fe80::1d8a:6f7b:1bb1:28bb]) by MWHPR12MB1664.namprd12.prod.outlook.com
 ([fe80::1d8a:6f7b:1bb1:28bb%4]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 18:26:34 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
 <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <1fa4dd77-deec-aa7b-7499-0537e9a01919@amd.com>
 <a818be68-518c-754d-f63b-3754ce882fdc@gmail.com>
 <CAKMK7uEx631E1NB1=NYh7V2_+X=pK0WhA_sBwpxCGOhFaYw9wQ@mail.gmail.com>
 <e389b7d7-196c-ee03-ff94-ffd110c1013f@amd.com>
 <77cdb5bf-a418-bafd-2360-163e428c7394@amd.com>
 <CAKMK7uEgY4gYqowUZP0FZYHB7FNPCqApWojmSnuwhQ9WnY6hLA@mail.gmail.com>
From: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>
Message-ID: <8083b9f8-ee43-504f-0690-7add68472ca9@amd.com>
Date: Wed, 16 Dec 2020 13:26:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
In-Reply-To: <CAKMK7uEgY4gYqowUZP0FZYHB7FNPCqApWojmSnuwhQ9WnY6hLA@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2607:fea8:3edf:49b0:1a8:981c:b82c:9d66]
X-ClientProxiedBy: BN6PR14CA0047.namprd14.prod.outlook.com
 (2603:10b6:404:13f::33) To MWHPR12MB1664.namprd12.prod.outlook.com
 (2603:10b6:301:b::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:3edf:49b0:1a8:981c:b82c:9d66]
 (2607:fea8:3edf:49b0:1a8:981c:b82c:9d66) by
 BN6PR14CA0047.namprd14.prod.outlook.com (2603:10b6:404:13f::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 18:26:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ca04d644-d135-48b2-b495-08d8a1f01e50
X-MS-TrafficTypeDiagnostic: MW2PR12MB2458:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB2458956DAA1C7F48E61F4FC3EAC50@MW2PR12MB2458.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9kLqlMTiplkcLID5LSlAawQ4NKWJJ2Xl84PilALDOKvmll2Ct+yOykNMJL2FPMzr1+sJa9qyjgozwk3hqKMO+VqBBPYll0ANREHf34mbQ+m4a/qkTosLgUG4EwOFl2fhbSkBvbxpFEeH7r3Pdy7ubzbyIjq1pDDK2XecjNzP8kYxCJUS4gA00ecwlxPUOK47WTR7FggPFjTWdfrWS23C96KCqS9/klj7Lowcynz+qhM3YoJzSHFIqj72Q8xICNL6KXbrlKl8KRyQYlRtKqLTfMOGr2fP4NQdLBNeuoptKnuP48ec7MjgZ5XjFzMYU0tyUWtbIQ1hg8cLyq5Mf0u4ul1Z6xFTmbO6kt6I7AhY0RQsCYGQDdk5rinRSdLAAw65hN9i0GdSbqRuGnrlFsVP8jUvsmNhMZPCeJRDGJj3soqN6EDzXXAv6yhA0mYv2bMFoOCJyCwrZMKwHNwTWp/69g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1664.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(478600001)(2906002)(4326008)(6636002)(31696002)(54906003)(53546011)(110136005)(8676002)(66946007)(86362001)(316002)(52116002)(5660300002)(66574015)(66476007)(8936002)(6486002)(45080400002)(2616005)(966005)(16526019)(186003)(66556008)(31686004)(36756003)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RmZFRmluVDkva0hQTnFOZzB6eW9XSEFTekw1d2l4Q3gwL1lmbVJud0MxdVJa?=
 =?utf-8?B?ZFFaOGU5T2V3RUVhd0YrTnNGc2VJVG1jM0Ztb2kvQSsvdWR6Q3FQWUx6T3g1?=
 =?utf-8?B?RGFIajdmeDYwVVNFZ2RSV2QvRnZMQkMyNEJjZndxYXNqd3NSM0l3SjYzSSs5?=
 =?utf-8?B?eUJWOEsxbE9yV0pWcm9wY0VleXZtaVdiOGYwWlZKT1lYV2N1MHA0M1Z0Vkdr?=
 =?utf-8?B?dTdRWndHMUkweTlKUHBjVlI1WDBTMVRwMmtBZk44aTdEaEJReG95dDhrWFBu?=
 =?utf-8?B?Q0xGYXkwN205USsvMWMybGRHRlFsRUNhZjcxSnkvL0JVeFlRN0pHd2tkclNk?=
 =?utf-8?B?MGlhR2JwNENHYjhOZDVoVTEva3VKdVVGZXk3YWZMa0ppMXBtYjFaZzZyem9V?=
 =?utf-8?B?MlhtbDZQRDE3OTVlc0krSExkM2lwMEduWUx2RWl3SGxuVXNWaldScXZmMWVD?=
 =?utf-8?B?MnhuamtjNEIrM0Y0d25kMFVzWjFsSlNJQXVxYklOYStRU0pqc0w5ZWxNR0tJ?=
 =?utf-8?B?QnpSSWd6TUY4ci83WmxhVWJDd1VEdkdLbTZMaC9SM0ZQV3BCVVZYSER1eFll?=
 =?utf-8?B?MzRhNnl6SlcxUEcvUUN6VHZmUlJwamROR3hzUnk1eXVncmtDVEtaZS9hZGFl?=
 =?utf-8?B?cHVGb1RmWHFHVFlTWEF5Wi9TK2NaZHVia3luNTRiSm1xeHNqR2RHYW5TTHRx?=
 =?utf-8?B?cExmNEJrdmh2aldHR0VSZmsySWU5Qkk0c053RWZzamdWeUZYWUovOEZBdHJ1?=
 =?utf-8?B?YVJNdGxWYzVXbXB5S3NVcnlrZGNDNGxqOVZCVTNRREFQRHJqN29UK2lsTm9P?=
 =?utf-8?B?RngrTnlvOHBYeDNzZ1RvZk11UHZhdFhRUVRqb3VNV0orZ21Panh5NWQ4ZUJQ?=
 =?utf-8?B?dXVFbllQTjM0Rmw0ZlVnSUhKMmsyMUZSMVVFbnFhY0NtNkFWNHhIK2xyVmN3?=
 =?utf-8?B?WUdmeGxDWHdOcVJ3ZTQzbm9ybi8vL0dySkl4VlArOGlvR3Z1T3duNmNwajZr?=
 =?utf-8?B?dHgwb1NJeUI2NytYbnNPS282aFFoVEFaT29aYmdjTGRGeGpSKzlMUzhIcVNz?=
 =?utf-8?B?RE40dGhHV01abXhleEd4emF6aGlxWjdMZ01CTVFPVktoS25UeDE5N2crQTRw?=
 =?utf-8?B?cmxWVEUwNHFYYzFhMUtER3N6SDNVNHBtWGRtZWh0eFpvVk5JL1VDazJhSGMv?=
 =?utf-8?B?WUdNODdCZ2lOUmF3RWFNMEt2QlAxQUVMS2ttMmdva3RxVktFQVRSbXVzcWFj?=
 =?utf-8?B?UXNRK2FFNzJSTVIyZFZqWms1VHB4YlZETHpCb3I1RENXWmV2Yk1IOE1od21j?=
 =?utf-8?B?QXFNamFaSEx3R0ZHVmpqeU1JcVY0bDV5RnU2czl5Wkt0QTZySWFsZzMrWFpJ?=
 =?utf-8?B?dTAyVS9LMVhPT1gxOWRod1dJU0FrS2xNNnRQeVBMQzZBVmdCclFXMW5XL21Z?=
 =?utf-8?Q?1PWr+kZ8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1664.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 18:26:34.4824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: ca04d644-d135-48b2-b495-08d8a1f01e50
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qFDU184qllMnDiGOYICruvEYmB7JzuycMNXX6TmDL4QsxIv4GfKwrgg88mFnfHuNvlvhQ1QUrRMtoWpUl9QELA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2458
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDEyLzE2LzIwIDEyOjEyIFBNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IE9uIFdlZCwgRGVj
IDE2LCAyMDIwIGF0IDU6MTggUE0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IHdyb3RlOgo+PiBBbSAxNi4xMi4yMCB1bSAxNzoxMyBzY2hyaWViIEFuZHJleSBH
cm9kem92c2t5Ogo+Pj4gT24gMTIvMTYvMjAgOToyMSBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToK
Pj4+PiBPbiBXZWQsIERlYyAxNiwgMjAyMCBhdCA5OjA0IEFNIENocmlzdGlhbiBLw7ZuaWcKPj4+
PiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+PiBBbSAxNS4x
Mi4yMCB1bSAyMToxOCBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4gW1NOSVBdCj4+
Pj4+Pj4+IFdoaWxlIHdlIGNhbid0IGNvbnRyb2wgdXNlciBhcHBsaWNhdGlvbiBhY2Nlc3NlcyB0
byB0aGUgbWFwcGVkCj4+Pj4+Pj4+IGJ1ZmZlcnMgZXhwbGljaXRseSBhbmQgaGVuY2Ugd2UgdXNl
IHBhZ2UgZmF1bHQgcmVyb3V0aW5nCj4+Pj4+Pj4+IEkgYW0gdGhpbmtpbmcgdGhhdCBpbiB0aGlz
ICBjYXNlIHdlIG1heSBiZSBhYmxlIHRvIHNwcmlua2xlCj4+Pj4+Pj4+IGRybV9kZXZfZW50ZXIv
ZXhpdCBpbiBhbnkgc3VjaCBzZW5zaXRpdmUgcGxhY2Ugd2VyZSB3ZSBtaWdodAo+Pj4+Pj4+PiBD
UFUgYWNjZXNzIGEgRE1BIGJ1ZmZlciBmcm9tIHRoZSBrZXJuZWwgPwo+Pj4+Pj4+IFllcywgSSBm
ZWFyIHdlIGFyZSBnb2luZyB0byBuZWVkIHRoYXQuCj4+Pj4+Pj4KPj4+Pj4+Pj4gVGhpbmdzIGxp
a2UgQ1BVIHBhZ2UgdGFibGUgdXBkYXRlcywgcmluZyBidWZmZXIgYWNjZXNzZXMgYW5kIEZXCj4+
Pj4+Pj4+IG1lbWNweSA/IElzIHRoZXJlIG90aGVyIHBsYWNlcyA/Cj4+Pj4+Pj4gUHVoLCBnb29k
IHF1ZXN0aW9uLiBJIGhhdmUgbm8gaWRlYS4KPj4+Pj4+Pgo+Pj4+Pj4+PiBBbm90aGVyIHBvaW50
IGlzIHRoYXQgYXQgdGhpcyBwb2ludCB0aGUgZHJpdmVyIHNob3VsZG4ndCBhY2Nlc3MgYW55Cj4+
Pj4+Pj4+IHN1Y2ggYnVmZmVycyBhcyB3ZSBhcmUgYXQgdGhlIHByb2Nlc3MgZmluaXNoaW5nIHRo
ZSBkZXZpY2UuCj4+Pj4+Pj4+IEFGQUlLIHRoZXJlIGlzIG5vIHBhZ2UgZmF1bHQgbWVjaGFuaXNt
IGZvciBrZXJuZWwgbWFwcGluZ3Mgc28gSQo+Pj4+Pj4+PiBkb24ndCB0aGluayB0aGVyZSBpcyBh
bnl0aGluZyBlbHNlIHRvIGRvID8KPj4+Pj4+PiBXZWxsIHRoZXJlIGlzIGEgcGFnZSBmYXVsdCBo
YW5kbGVyIGZvciBrZXJuZWwgbWFwcGluZ3MsIGJ1dCB0aGF0IG9uZQo+Pj4+Pj4+IGp1c3QgcHJp
bnRzIHRoZSBzdGFjayB0cmFjZSBpbnRvIHRoZSBzeXN0ZW0gbG9nIGFuZCBjYWxscyBCVUcoKTsg
OikKPj4+Pj4+Pgo+Pj4+Pj4+IExvbmcgc3Rvcnkgc2hvcnQgd2UgbmVlZCB0byBhdm9pZCBhbnkg
YWNjZXNzIHRvIHJlbGVhc2VkIHBhZ2VzIGFmdGVyCj4+Pj4+Pj4gdW5wbHVnLiBObyBtYXR0ZXIg
aWYgaXQncyBmcm9tIHRoZSBrZXJuZWwgb3IgdXNlcnNwYWNlLgo+Pj4+Pj4gSSB3YXMganVzdCBh
Ym91dCB0byBzdGFydCBndWFyZGluZyB3aXRoIGRybV9kZXZfZW50ZXIvZXhpdCBDUFUKPj4+Pj4+
IGFjY2Vzc2VzIGZyb20ga2VybmVsIHRvIEdUVCBvdCBWUkFNIGJ1ZmZlcnMgYnV0IHRoZW4gaSBs
b29rZWQgbW9yZSBpbgo+Pj4+Pj4gdGhlIGNvZGUKPj4+Pj4+IGFuZCBzZWVtcyBsaWtlIHR0bV90
dF91bnBvcHVsYXRlIGp1c3QgZGVsZXRlcyBETUEgbWFwcGluZ3MgKGZvciB0aGUKPj4+Pj4+IHNh
a2Ugb2YgZGV2aWNlIHRvIG1haW4gbWVtb3J5IGFjY2VzcykuIEtlcm5lbCBwYWdlIHRhYmxlIGlz
IG5vdAo+Pj4+Pj4gdG91Y2hlZAo+Pj4+Pj4gdW50aWwgbGFzdCBibyByZWZjb3VudCBpcyBkcm9w
cGVkIGFuZCB0aGUgYm8gaXMgcmVsZWFzZWQKPj4+Pj4+ICh0dG1fYm9fcmVsZWFzZS0+ZGVzdHJv
eS0+YW1kZ3B1X2JvX2Rlc3Ryb3ktPmFtZGdwdV9ib19rdW5tYXApLiBUaGlzCj4+Pj4+PiBpcyBi
b3RoCj4+Pj4+PiBmb3IgR1RUIEJPcyBtYXBlZCB0byBrZXJuZWwgYnkga21hcCAob3Igdm1hcCkg
YW5kIGZvciBWUkFNIEJPcyBtYXBwZWQKPj4+Pj4+IGJ5IGlvcmVtYXAuIFNvIGFzIGkgc2VlIGl0
LCBub3RoaW5nIHdpbGwgYmFkIHdpbGwgaGFwcGVuIGFmdGVyIHdlCj4+Pj4+PiB1bnBvcHVsYXRl
IGEgQk8gd2hpbGUgd2Ugc3RpbGwgdHJ5IHRvIHVzZSBhIGtlcm5lbCBtYXBwaW5nIGZvciBpdCwK
Pj4+Pj4+IHN5c3RlbSBtZW1vcnkgcGFnZXMgYmFja2luZyBHVFQgQk9zIGFyZSBzdGlsbCBtYXBw
ZWQgYW5kIG5vdCBmcmVlZCBhbmQKPj4+Pj4+IGZvcgo+Pj4+Pj4gVlJBTSBCT3Mgc2FtZSBpcyBm
b3IgdGhlIElPIHBoeXNpY2FsIHJhbmdlcyBtYXBwZWQgaW50byB0aGUga2VybmVsCj4+Pj4+PiBw
YWdlIHRhYmxlIHNpbmNlIGlvdW5tYXAgd2Fzbid0IGNhbGxlZCB5ZXQuCj4+Pj4+IFRoZSBwcm9i
bGVtIGlzIHRoZSBzeXN0ZW0gcGFnZXMgd291bGQgYmUgZnJlZWQgYW5kIGlmIHdlIGtlcm5lbCBk
cml2ZXIKPj4+Pj4gc3RpbGwgaGFwcGlseSB3cml0ZSB0byB0aGVtIHdlIGFyZSBwcmV0dHkgbXVj
aCBidXN0ZWQgYmVjYXVzZSB3ZSB3cml0ZQo+Pj4+PiB0byBmcmVlZCB1cCBtZW1vcnkuCj4+Pgo+
Pj4gT0ssIGkgc2VlIGkgbWlzc2VkIHR0bV90dF91bnBvcHVsYXRlLT4uLi0+dHRtX3Bvb2xfZnJl
ZSB3aGljaCB3aWxsCj4+PiByZWxlYXNlCj4+PiB0aGUgR1RUIEJPIHBhZ2VzLiBCdXQgdGhlbiBp
c24ndCB0aGVyZSBhIHByb2JsZW0gaW4gdHRtX2JvX3JlbGVhc2Ugc2luY2UKPj4+IHR0bV9ib19j
bGVhbnVwX21lbXR5cGVfdXNlIHdoaWNoIGFsc28gbGVhZHMgdG8gcGFnZXMgcmVsZWFzZSBjb21l
cwo+Pj4gYmVmb3JlIGJvLT5kZXN0cm95IHdoaWNoIHVubWFwcyB0aGUgcGFnZXMgZnJvbSBrZXJu
ZWwgcGFnZSB0YWJsZSA/IFdvbid0Cj4+PiB3ZSBoYXZlIGVuZCB1cCB3cml0aW5nIHRvIGZyZWVk
IG1lbW9yeSBpbiB0aGlzIHRpbWUgaW50ZXJ2YWwgPyBEb24ndCB3ZQo+Pj4gbmVlZCB0byBwb3N0
cG9uZSBwYWdlcyBmcmVlaW5nIHRvIGFmdGVyIGtlcm5lbCBwYWdlIHRhYmxlIHVubWFwcGluZyA/
Cj4+IEJPcyBhcmUgb25seSBkZXN0cm95ZWQgd2hlbiB0aGVyZSBpcyBhIGd1YXJhbnRlZSB0aGF0
IG5vYm9keSBpcwo+PiBhY2Nlc3NpbmcgdGhlbSBhbnkgbW9yZS4KPj4KPj4gVGhlIHByb2JsZW0g
aGVyZSBpcyB0aGF0IHRoZSBwYWdlcyBhcyB3ZWxsIGFzIHRoZSBWUkFNIGNhbiBiZQo+PiBpbW1l
ZGlhdGVseSByZXVzZWQgYWZ0ZXIgdGhlIGhvdHBsdWcgZXZlbnQuCj4+Cj4+Pgo+Pj4+IFNpbWls
YXIgZm9yIHZyYW0sIGlmIHRoaXMgaXMgYWN0dWFsIGhvdHVucGx1ZyBhbmQgdGhlbiByZXBsdWcs
IHRoZXJlJ3MKPj4+PiBnb2luZyB0byBiZSBhIGRpZmZlcmVudCBkZXZpY2UgYmVoaW5kIHRoZSBz
YW1lIG1taW8gYmFyIHJhbmdlIG1vc3QKPj4+PiBsaWtlbHkgKHRoZSBoaWdoZXIgYnJpZGdlcyBh
bGwgdGhpcyBoYXZlIHRoZSBzYW1lIHdpbmRvd3MgYXNzaWduZWQpLAo+Pj4KPj4+IE5vIGlkZWEg
aG93IHRoaXMgYWN0dWFsbHkgd29ya3MgYnV0IGlmIHdlIGhhdmVuJ3QgY2FsbGVkIGlvdW5tYXAg
eWV0Cj4+PiBkb2Vzbid0IGl0IG1lYW4gdGhhdCB0aG9zZSBwaHlzaWNhbCByYW5nZXMgdGhhdCBh
cmUgc3RpbGwgbWFwcGVkIGludG8KPj4+IHBhZ2UKPj4+IHRhYmxlIHNob3VsZCBiZSByZXNlcnZl
ZCBhbmQgY2Fubm90IGJlIHJldXNlZCBmb3IgYW5vdGhlcgo+Pj4gZGV2aWNlID8gQXMgYSBndWVz
cywgbWF5YmUgYW5vdGhlciBzdWJyYW5nZSBmcm9tIHRoZSBoaWdoZXIgYnJpZGdlJ3MKPj4+IHRv
dGFsCj4+PiByYW5nZSB3aWxsIGJlIGFsbG9jYXRlZC4KPj4gTm9wZSwgdGhlIFBDSWUgc3Vic3lz
dGVtIGRvZXNuJ3QgY2FyZSBhYm91dCBhbnkgaW9yZW1hcCBzdGlsbCBhY3RpdmUgZm9yCj4+IGEg
cmFuZ2Ugd2hlbiBpdCBpcyBob3RwbHVnZ2VkLgo+Pgo+Pj4+IGFuZCB0aGF0J3MgYmFkIG5ld3Mg
aWYgd2Uga2VlcCB1c2luZyBpdCBmb3IgY3VycmVudCBkcml2ZXJzLiBTbyB3ZQo+Pj4+IHJlYWxs
eSBoYXZlIHRvIHBvaW50IGFsbCB0aGVzZSBjcHUgcHRlcyB0byBzb21lIG90aGVyIHBsYWNlLgo+
Pj4KPj4+IFdlIGNhbid0IGp1c3QgdW5tYXAgaXQgd2l0aG91dCBzeW5jaW5nIGFnYWluc3QgYW55
IGluIGtlcm5lbCBhY2Nlc3Nlcwo+Pj4gdG8gdGhvc2UgYnVmZmVycwo+Pj4gYW5kIHNpbmNlIHBh
Z2UgZmF1bHRpbmcgdGVjaG5pcXVlIHdlIHVzZSBmb3IgdXNlciBtYXBwZWQgYnVmZmVycyBzZWVt
cwo+Pj4gdG8gbm90IGJlIHBvc3NpYmxlCj4+PiBmb3Iga2VybmVsIG1hcHBlZCBidWZmZXJzIEkg
YW0gbm90IHN1cmUgaG93IHRvIGRvIGl0IGdyYWNlZnVsbHkuLi4KPj4gV2UgY291bGQgdHJ5IHRv
IHJlcGxhY2UgdGhlIGttYXAgd2l0aCBhIGR1bW15IHBhZ2UgdW5kZXIgdGhlIGhvb2QsIGJ1dAo+
PiB0aGF0IGlzIGV4dHJlbWVseSB0cmlja3kuCj4+Cj4+IEVzcGVjaWFsbHkgc2luY2UgQk9zIHdo
aWNoIGFyZSBqdXN0IDEgcGFnZSBpbiBzaXplIGNvdWxkIHBvaW50IHRvIHRoZQo+PiBsaW5lYXIg
bWFwcGluZyBkaXJlY3RseS4KPiBJIHRoaW5rIGl0J3MganVzdCBtb3JlIHdvcmsuIEVzc2VudGlh
bGx5Cj4gLSBjb252ZXJ0IGFzIG11Y2ggYXMgcG9zc2libGUgb2YgdGhlIGtlcm5lbCBtYXBwaW5n
cyB0byB2bWFwX2xvY2FsLAo+IHdoaWNoIFRob21hcyBaaW1tZXJtYW5uIGlzIHJvbGxpbmcgb3V0
LiBUaGF0IHdheSBhIGRtYV9yZXN2X2xvY2sgd2lsbAo+IHNlcnZlIGFzIGEgYmFycmllciwgYW5k
IG9mYyBhbnkgbmV3IHZtYXAgbmVlZHMgdG8gZmFpbCBvciBoYW5kIG91dCBhCj4gZHVtbXkgbWFw
cGluZy4KClJlYWQgdGhvc2UgcGF0Y2hlcy4gSSBhbSBub3Qgc3VyZSBob3cgdGhpcyBoZWxwcyB3
aXRoIHByb3RlY3RpbmcKYWdhaW5zdCBhY2Nlc3NlcyB0byByZWxlYXNlZCBiYWNraW5nIHBhZ2Vz
IG9yIElPIHBoeXNpY2FsIHJhbmdlcyBvZiBCTwp3aGljaCBpcyBhbHJlYWR5IG1hcHBlZCBkdXJp
bmcgdGhlIHVucGx1ZyBldmVudCA/CgpBbmRyZXkKCgo+IC0gaGFuZGxlIGZiY29uIHNvbWVob3cu
IEkgdGhpbmsgc2h1dHRpbmcgaXQgYWxsIGRvd24gc2hvdWxkIHdvcmsgb3V0Lgo+IC0gd29yc3Qg
Y2FzZSBrZWVwIHRoZSBzeXN0ZW0gYmFja2luZyBzdG9yYWdlIGFyb3VuZCBmb3Igc2hhcmVkIGRt
YS1idWYKPiB1bnRpbCB0aGUgb3RoZXIgbm9uLWR5bmFtaWMgZHJpdmVyIHJlbGVhc2VzIGl0LiBm
b3IgdnJhbSB3ZSByZXF1aXJlCj4gZHluYW1pYyBpbXBvcnRlcnMgKGFuZCBtYXliZSBpdCB3YXNu
J3Qgc3VjaCBhIGJyaWdodCBpZGVhIHRvIGFsbG93Cj4gcGlubmluZyBvZiBpbXBvcnRlciBidWZm
ZXJzLCBtaWdodCBuZWVkIHRvIHJldmlzaXQgdGhhdCkuCj4KPiBDaGVlcnMsIERhbmllbAo+Cj4+
IENocmlzdGlhbi4KPj4KPj4+IEFuZHJleQo+Pj4KPj4+Cj4+Pj4gLURhbmllbAo+Pj4+Cj4+Pj4+
IENocmlzdGlhbi4KPj4+Pj4KPj4+Pj4+IEkgbG9hZGVkIHRoZSBkcml2ZXIgd2l0aCB2bV91cGRh
dGVfbW9kZT0zCj4+Pj4+PiBtZWFuaW5nIGFsbCBWTSB1cGRhdGVzIGRvbmUgdXNpbmcgQ1BVIGFu
ZCBoYXNuJ3Qgc2VlbiBhbnkgT09QcyBhZnRlcgo+Pj4+Pj4gcmVtb3ZpbmcgdGhlIGRldmljZS4g
SSBndWVzcyBpIGNhbiB0ZXN0IGl0IG1vcmUgYnkgYWxsb2NhdGluZyBHVFQgYW5kCj4+Pj4+PiBW
UkFNIEJPcwo+Pj4+Pj4gYW5kIHRyeWluZyB0byByZWFkL3dyaXRlIHRvIHRoZW0gYWZ0ZXIgZGV2
aWNlIGlzIHJlbW92ZWQuCj4+Pj4+Pgo+Pj4+Pj4gQW5kcmV5Cj4+Pj4+Pgo+Pj4+Pj4KPj4+Pj4+
PiBSZWdhcmRzLAo+Pj4+Pj4+IENocmlzdGlhbi4KPj4+Pj4+Pgo+Pj4+Pj4+PiBBbmRyZXkKPj4+
Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+Pj4+
PiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+Pj4+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPj4+Pj4+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20v
P3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWVkZXNrdG9wLm9yZyUyRm1haWxtYW4lMkZsaXN0
aW5mbyUyRmFtZC1nZngmYW1wO2RhdGE9MDQlN0MwMSU3Q0FuZHJleS5Hcm9kem92c2t5JTQwYW1k
LmNvbSU3QzM3YjQzNjdjYmRhYTQxMzNiMDFkMDhkOGExZTViZjQxJTdDM2RkODk2MWZlNDg4NGU2
MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzQzNzM1NTQzMDAwNzE5NiU3Q1Vua25vd24l
N0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJ
NklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1yMGJJSlMzSFVEa0ZQcXlG
aW5BdDRlYWhNJTJCakYwMURPYlo1YWJnc3R6U1UlM0QmYW1wO3Jlc2VydmVkPTAKPj4+Pj4+Cj4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==

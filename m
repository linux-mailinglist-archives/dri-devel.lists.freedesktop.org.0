Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 323AC3152F5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 16:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99C2C6EB69;
	Tue,  9 Feb 2021 15:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2046.outbound.protection.outlook.com [40.107.237.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866226EB69;
 Tue,  9 Feb 2021 15:40:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LVaZ0HPLkqxCQCatXJqdUxT9tIXfm9TQsLRXPR0MB7p3V2fPy31yDtPNBHup7GQr4ZFgsHXJELjtgv2RjC9pMhmW/VGbryK+i34imvB13QU/hULK5W76l8ZCxbMrukTDuIAspcaUFJtxoKivxWjyulLaOmzS61r7DlYv7OYvPb/NUJsdO5BU4SVzQPuCbginjylisi999r1psJERAoQHnkvEgzgsgnNr2m01zQGSDE0do11KXguM5jLnZ3YXC2gQMysEpo4AHC001lFATJTR06nVAG/c7EVGl7h7bNMAJciZgnNGBxMX/X+5mkVoa2/L0cWsr4xln1PmWSxFhnJ5WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDr66Mf9lCf1b/mlb3+4964k9gqzZ8I3t8ZcfE7cioU=;
 b=JHDF0zeAEULM7lW902+fFGbksFJ0IPF0fJIHJM53IHfA7Q1io/feyGKpwuxFNnQNmFfTE5Yp08RLeaa3PzHjYNdKy2Web3/tfZsZhJWqw1+NGSoE7UNVvxkuhpbh/NP7wT6WscYlE3f52v7uGKnAX5dY6lQFFV/kYOj/KkLP0eHPFccf+lVa1M38qAvKSTfvc53jPZ2Xu5dHsZmdUomhdMD2RGmiOR5BcKWWgB6N7iG3fVzFols0aSxoQ7BwIGEiEDQXgDzM7LgsiQB/DDSKDHluiPlPXLjn+xsFeDvcSzIXPBl912Ylteq3P5xJ1ubOt74EqdSofokNIoDC1cyBhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDr66Mf9lCf1b/mlb3+4964k9gqzZ8I3t8ZcfE7cioU=;
 b=5sfM8mJQmSxTjOn+l50frerMJx4JBo1B7m0SiznL14DKzEZMJ0mf9UoWTq0JTp4h+a3eI6svDhUFbYauCy3RhFliwWkLq7sAIGzgKGLgtRxEhigAchUSadJKDgrJnu6Hix3uIN3X0S/NdZaQHumwQ7DJV8iy+j0iUs9PiQOGB2Q=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4946.namprd12.prod.outlook.com (2603:10b6:208:1c5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.30; Tue, 9 Feb
 2021 15:40:50 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 15:40:50 +0000
Subject: Re: [PATCH v4 11/14] drm/amdgpu: Guard against write accesses after
 device removal
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
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
 <90eb7a73-1981-6d20-a83d-1690321212c7@amd.com>
 <CAKMK7uF3HkTgDhM5Lk3hnGB+35Vi-Nt7YOBJ_rpO8wZw9ifhcA@mail.gmail.com>
 <f8b3417f-a697-c8c7-b131-5c8823f969d7@amd.com>
 <55862d1f-42da-4a9c-0720-e6abf72615f5@amd.com>
 <da7b71c6-5045-5a52-2ec6-504d0bfb6761@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <28c0f887-2f9d-2964-77ef-e56b3e0a8482@amd.com>
Date: Tue, 9 Feb 2021 16:40:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <da7b71c6-5045-5a52-2ec6-504d0bfb6761@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e917:9982:33ce:f3fb]
X-ClientProxiedBy: AM8P192CA0027.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e917:9982:33ce:f3fb]
 (2a02:908:1252:fb60:e917:9982:33ce:f3fb) by
 AM8P192CA0027.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21b::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.20 via Frontend Transport; Tue, 9 Feb 2021 15:40:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 24bb23e2-3cb1-4a4e-c9e5-08d8cd11136b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4946:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4946705845D42419F9DC3918838E9@BL0PR12MB4946.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z+8L2CR/hCjECE1/gl6pwH3Dp9FYS1pjeqteQ/EEpzrz85vIif88QBq7z/jmc9yDsjHvboJhwDiwk/LQXFKM1QoOTFWzemE+lyTFUQS4XLwbg+V3m8VpMQp4qjsuH6DoSr5NcNh6hlDeRCGHk/OXfmBcX1Xhnk1lBo7bw+WMF58z//1gUXMsvv9Jkoe8CAHVp3DTNxCFkt8274+SdLu2x3spl/ENCN3CUVQ1q5vfo568396hL09Eu/FZ5jsfhEPFHUWtKpBf+34aUun3k2pUlEwCdRLgcg0OUyd7nJ9VjyISnvgQoQW2kyTNUKmSdRj0r905Kw84aO+2Xs9C4sflf3O25oZnEy2Eo2yRIIWScTvpoH3dRqI8nH+9HCFeKB1WqzAz940u00KoptIvf1paWH4redpUn8aCcYQ1cJ94ZtdiWa/5MtclJI2pspP8coKkI08rUPCNSiugl044FxP8a9BfTxUotyBQT/kOowxWxp6BHnfzteP2PFuPs52chxBoBlktYBoInicuzqBwoMwB29q0rU1D4JF4dij6BJ7GJL7iSTToLqjoodGCDoE6/Mi7sDfP6fi94V91EjvdxbxgHCojJxR9AsnyO2ra6T5dIh7cenTkwuMkJpik/sykcviOEHtTBwo8jzAPmmZU2jDfRbXnzAAqKOj7r8fPiVq17alr29VQ8ufeUd3GEy+lxg+Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(5660300002)(8676002)(36756003)(66556008)(478600001)(66946007)(186003)(66476007)(16526019)(52116002)(2906002)(31686004)(6666004)(966005)(8936002)(2616005)(86362001)(31696002)(6486002)(316002)(83380400001)(54906003)(4326008)(110136005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NCtJM1VpUS92aVBhTWlPNC9pL216c2tCRis3WC9BSFRWV3o0dUNWV3VpUHRF?=
 =?utf-8?B?d0JURHdadUxXcmRYcDJhbGFHblBnekFBeTYyaGZYZUFKUWJzVHEyQ3VuMWwy?=
 =?utf-8?B?QWtuSEczTW5JZWk4Wi85U25pTStCV3paUDRsbVU2NDZ2VzR4ak9JdW1aZTcv?=
 =?utf-8?B?Y2tPOG14MkphbXRBSUp2NU1ScG5CeWFEVXpLWmxOM0M0SFZBL2h0SElPRmty?=
 =?utf-8?B?b0pCRGd3QVZDVVZaeWRTOWJCZm9iRk03WGt3NWg2dHBsbEhvYzFOWE5oZk9u?=
 =?utf-8?B?UEZIb1RNUG0xbEp0aXFIOEM2bno3K2RKWDNocXE4VjRzcFF5Smlpa3hCS0VK?=
 =?utf-8?B?ZC8zbC96RndOWXNBY1hoV1E3cGRGeGNHRjhTM0UxSDhpWGdSdVNHS0dhY0hS?=
 =?utf-8?B?cHoxL3BpcnZpSHBwd1V4Umh4Z1pWUkIzMm5nbkdMR2Fhc3c5ay9IUkVteG5E?=
 =?utf-8?B?MHFhWXlYSDFzUGpaamxCWmE5WFN6TFl0NUFBRXZkZUVwUm1mZmhoak83VEZX?=
 =?utf-8?B?K3RWZ2RFakhUbzBSKy9IVnFYSzc5NnhsVzZxTFRJT3FzWHNFUEppc3M3b3NB?=
 =?utf-8?B?bDVDaXRQaHE3M2txRE45T1I4TUdJZnN6OHdVNjlMekJoYXg2ZURQSndFRjBR?=
 =?utf-8?B?SmVUa3BEcmhlK3hxaTM4UDFTbkNrbEVxenpUd2oyLzl5eHY3RzNxQm9Pc0FN?=
 =?utf-8?B?SlV0WHJkMDdYUjNzSHE0WThZNThIYjlmL2tkVFQrWGlLaC9jVWFKVjFvYjh4?=
 =?utf-8?B?QzR6MVZzR2ovR3YzT2Q0anZUTjV4a3hZbWJBYXJyTkYzU3F3VElGVXRPTS9h?=
 =?utf-8?B?MUdGOHVmTXVYbEJzQU8reDdYWkZackl6Rm42ai92R2VLUExZZW42TEpMRlRJ?=
 =?utf-8?B?STE5OFl4VW5xRTFVb3FURmVBdHJUbzZ3WU11OWN2QzljSnp6anNZeUNlRW9W?=
 =?utf-8?B?aGRWS3p2ams4NVpCeVg3Ry9UblZ6RHJHNGhKcFdVbzBBNXE4Y3lZeTZYMmhh?=
 =?utf-8?B?bTBubHZnb0diNkVheldobVVubmcrWGwrQlhCbllFamFqTGJhd0pjRlRjc09a?=
 =?utf-8?B?eFJ1OURXOTN0ck1ZQkVBL01RdVdjTEMrN2dEdVRSQnZYWkRMMU1lT3g4eStV?=
 =?utf-8?B?S09tQjJiS2J5KzdSamFZSitrQ2EyQXdjV29vN29kdEg2WFdMK25qNXJ6R1Jp?=
 =?utf-8?B?SFo3YVNUYnhUMFhCMHF5MXREKzd3NDhFejVsMUJzZW5nOGc0Nk4xU0d0Q3Br?=
 =?utf-8?B?RjJPbnd1Qk5haHNLTmVrQ3RyTXNWbEZldUhlUHRvcnd2cGpTclV6cjRsak50?=
 =?utf-8?B?bkZaYUkyUzZIVDFSdUNBTVFGS0lDSjJsbFV2dXFIL3JSYmtLakQ1cXgvM2Zv?=
 =?utf-8?B?aDlsKzl2TXkwY2NnbzhtQjZ3SDk0TzlGWSt2V20zMXg1STBHdmRmTkFpejR0?=
 =?utf-8?B?MXdSWm43WERaZmhIWndKMmtVL1JaYWxmdDcycGxhMGV6YkdEaytZSFVjVW1Y?=
 =?utf-8?B?eHBHYWdaZW5hRXhHcldZeHFlRm80Y1hvbExNQjhQc05GcDd3RzVseUJJTExJ?=
 =?utf-8?B?VDBMNkJ0WE1aLzNWRC9ab3Y1YXVRQTZjUWVYaSs4M1orbjFyQ2JYT1FkR3Yv?=
 =?utf-8?B?UkJXekxBeGtYV3VaSnNVZHd2LzRjOWR1SE4va3ZYRkhaZFpxUkxreGlqemNx?=
 =?utf-8?B?UXNjcDY3UGJqcVJYZVF5S1JCeDJtY0FtcnpHU2tSc2oxWk81NHg4ZTRDWjVR?=
 =?utf-8?B?b2ZFSzNGRjFWM1NFcTNhbHBiK2kwNXc3VE5kZjloNzRZUEhheTJ3YXplM0ZC?=
 =?utf-8?B?aCtBdndidCtVQ0poMHdkYjN6VEVNWUZya2grSTZuTVhDM2UrZnd1QkdXWWh2?=
 =?utf-8?Q?nz4pQB07OuVmq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24bb23e2-3cb1-4a4e-c9e5-08d8cd11136b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 15:40:49.9083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S7oHB9DF2eZLiTDAyt1UtR216Pd43CCzj1OHBqt5WXum17wWD7gKDPtXMV23rOic
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4946
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

QW0gMDkuMDIuMjEgdW0gMTU6MzAgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBbU05JUF0K
Pj4+IFF1ZXN0aW9uIC0gV2h5IGNhbid0IHdlIGp1c3Qgc2V0IHRob3NlIFBURXMgdG8gcG9pbnQg
dG8gc3lzdGVtIAo+Pj4gbWVtb3J5IChhbm90aGVyIFJPIGR1bW15IHBhZ2UpCj4+PiBmaWxsZWQg
d2l0aCAxcyA/Cj4+Cj4+Cj4+IFRoZW4gd3JpdGVzIGFyZSBub3QgZGlzY2FyZGVkLiBFLmcuIHRo
ZSAxcyB3b3VsZCBjaGFuZ2UgdG8gc29tZXRoaW5nIAo+PiBlbHNlLgo+Pgo+PiBDaHJpc3RpYW4u
Cj4KPgo+IEkgc2VlIGJ1dCwgd2hhdCBhYm91dCBtYXJraW5nIHRoZSBtYXBwaW5ncyBhcyBSTyBh
bmQgZGlzY2FyZGluZyB0aGUgCj4gd3JpdGUgYWNjZXNzIHBhZ2UgZmF1bHRzIGNvbnRpbnVvdXNs
eSB1bnRpbCB0aGUgZGV2aWNlIGlzIGZpbmFsaXplZCA/Cj4gUmVnYXJkaW5nIHVzaW5nIGFuIHVu
dXNlZCByYW5nZSBiZWhpbmQgdGhlIHVwcGVyIGJyaWRnZSBhcyBEYW5pZWwgCj4gc3VnZ2VzdGVk
LCBJIHdvbmRlciB3aWxsIHRoaXMgaW50ZXJmZXJlIHdpdGgKPiB0aGUgdXBjb21pbmcgZmVhdHVy
ZSB0byBzdXBwb3J0IEJBUnMgbW92ZW1lbnTCoCBkdXJpbmcgaG90IHBsdWcgLSAKPiBodHRwczov
L3d3dy5zcGluaWNzLm5ldC9saXN0cy9saW51eC1wY2kvbXNnMTAzMTk1Lmh0bWwgPwoKSW4gdGhl
IHBpY3R1cmUgaW4gbXkgaGVhZCB0aGUgYWRkcmVzcyB3aWxsIG5ldmVyIGJlIHVzZWQuCgpCdXQg
aXQgZG9lc24ndCBldmVuIG5lZWRzIHRvIGJlIGFuIHVudXNlZCByYW5nZSBvZiB0aGUgcm9vdCBi
cmlkZ2UuIFRoYXQgCm9uZSBpcyB1c3VhbGx5IHN0dWZmZWQgZnVsbCBieSB0aGUgQklPUy4KCkZv
ciBteSBCQVIgcmVzaXplIHdvcmsgSSBsb29rZWQgYXQgcXVpdGUgYSBidW5jaCBvZiBOQiBkb2N1
bWVudGF0aW9uLiBBdCAKbGVhc3QgZm9yIEFNRCBDUFVzIHdlIHNob3VsZCBhbHdheXMgaGF2ZSBh
biBNTUlPIGFkZHJlc3Mgd2hpY2ggaXMgbmV2ZXIgCmV2ZXIgdXNlZC4gVGhhdCBtYWtlcyB0aGlz
IHBsYXRmb3JtL0NQVSBkZXBlbmRlbnQsIGJ1dCB0aGUgY29kZSBpcyBqdXN0IAptaW5pbWFsLgoK
VGhlIHJlYWxseSByZWFsbHkgbmljZSB0aGluZyBhYm91dCB0aGlzIGFwcHJvYWNoIGlzIHRoYXQg
eW91IGNvdWxkIHVuaXQgCnRlc3QgYW5kIGF1ZGl0IHRoZSBjb2RlIGZvciBwcm9ibGVtcyBldmVu
IHdpdGhvdXQgKnJlYWwqIGhvdHBsdWcgCmhhcmR3YXJlLiBFLmcuIHdlIGNhbiBzd2FwIHRoZSBr
ZXJuZWwgUFRFcyBhbmQgc2VlIGhvdyB0aGUgd2hvbGUgcG93ZXIgCmFuZCBkaXNwbGF5IGNvZGUg
cmVhY3RzIHRvIHRoYXQgZXRjLi4uLgoKQ2hyaXN0aWFuLgoKPgo+IEFuZHJleQo+Cj4KPj4KPj4K
Pj4+Cj4+PiBBbmRyZXkKPj4+Cj4+Pgo+Pj4+Cj4+Pj4+IENocmlzdGlhbi4KPj4+Pj4KPj4+Pj4+
IEl0J3MgYSBuaWZ0eSBpZGVhIGluZGVlZCBvdGhlcndpc2UgLi4uCj4+Pj4+PiAtRGFuaWVsCj4+
Pj4+Pgo+Pj4+Pj4+IFJlZ2FyZHMsCj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4+Cj4+Pj4+Pj4K
Pj4+Pj4+Pj4+Pj4+IEJ1dCB1Z2ggLi4uCj4+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+Pj4gT3RvaCB2
YWxpZGF0aW5nIGFuIGVudGlyZSBkcml2ZXIgbGlrZSBhbWRncHUgd2l0aG91dCBzdWNoIGEgCj4+
Pj4+Pj4+Pj4+PiB0cmljawo+Pj4+Pj4+Pj4+Pj4gYWdhaW5zdCAweGZmIHJlYWRzIGlzIHByYWN0
aWNhbGx5IGltcG9zc2libGUuIFNvIG1heWJlIHlvdSAKPj4+Pj4+Pj4+Pj4+IG5lZWQgdG8gYWRk
Cj4+Pj4+Pj4+Pj4+PiB0aGlzIGFzIG9uZSBvZiB0aGUgdGFza3MgaGVyZT8KPj4+Pj4+Pj4+Pj4g
T3IgSSBjb3VsZCBqdXN0IGZvciB2YWxpZGF0aW9uIHB1cnBvc2VzIHJldHVybiB+MCBmcm9tIGFs
bCAKPj4+Pj4+Pj4+Pj4gcmVnIHJlYWRzIGluIHRoZSBjb2RlCj4+Pj4+Pj4+Pj4+IGFuZCBpZ25v
cmUgd3JpdGVzIGlmIGRybV9kZXZfdW5wbHVnZ2VkLCB0aGlzIGNvdWxkIGFscmVhZHkgCj4+Pj4+
Pj4+Pj4+IGVhc2lseSB2YWxpZGF0ZSBhIGJpZwo+Pj4+Pj4+Pj4+PiBwb3J0aW9uIG9mIHRoZSBj
b2RlIGZsb3cgdW5kZXIgc3VjaCBzY2VuYXJpby4KPj4+Pj4+Pj4+PiBIbSB5ZWFoIGlmIHlvdXIg
cmVhbGx5IHdyYXAgdGhlbSBhbGwsIHRoYXQgc2hvdWxkIHdvcmsgdG9vLiAKPj4+Pj4+Pj4+PiBT
aW5jZQo+Pj4+Pj4+Pj4+IGlvbW1hcHBpbmdzIGhhdmUgX19pb21lbSBwb2ludGVyIHR5cGUsIGFz
IGxvbmcgYXMgYW1kZ3B1IGlzIAo+Pj4+Pj4+Pj4+IHNwYXJzZQo+Pj4+Pj4+Pj4+IHdhcm5pbmcg
ZnJlZSwgc2hvdWxkIGJlIGRvYWJsZSB0byBndWFyYW50ZWUgdGhpcy4KPj4+Pj4+Pj4+IFByb2Js
ZW0gaXMgdGhhdCB+MCBpcyBub3QgYWx3YXlzIGEgdmFsaWQgcmVnaXN0ZXIgdmFsdWUuCj4+Pj4+
Pj4+Pgo+Pj4+Pj4+Pj4gWW91IHdvdWxkIG5lZWQgdG8gYXVkaXQgZXZlcnkgcmVnaXN0ZXIgcmVh
ZCB0aGF0IGl0IGRvZXNuJ3QgCj4+Pj4+Pj4+PiB1c2UgdGhlIHJldHVybmVkCj4+Pj4+Pj4+PiB2
YWx1ZSBibGluZGx5IGFzIGluZGV4IG9yIHNpbWlsYXIuIFRoYXQgaXMgcXVpdGUgYSBiaXQgb2Yg
d29yay4KPj4+Pj4+Pj4gWWVhaCB0aGF0J3MgdGhlIGVudGlyZSBjcnV4IGhlcmUgOi0vCj4+Pj4+
Pj4+IC1EYW5pZWwKPj4+PgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==

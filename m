Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D292035F43E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 14:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E8F6E7D9;
	Wed, 14 Apr 2021 12:49:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE296E4B6;
 Wed, 14 Apr 2021 12:49:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNo0pdYVVclx+WwnodSY/udrvVl8ZtALvAGnviUjwpK1xqBCeVDa7ngpFQsnaVcFaRGiRpxLm72iSQqSJhuor6EaCEMuOUtxDb7MMuft05bO+kNbJMf+q7ayb7JDMzF16iMTRwpPJ5dhUrwGz0iL4wxrpBspJ+vCKRo+d0Tl1ZrnR21A95OXQvmo8PFlqakpPfKKlS0O0R+LDRpkkEDOS5Sq4oG+w2PG5Iug7Cn63dapsT7vunSgz1hAs3Il2McSU4I/7bahtxODV4H386M8YkEvYtIDPV5mH48QOE3X3pjVW+15zqWslRCXrmmqFRnTQHQHalGU+gtdAbFdYDpFWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fopHtokEYdrC/GEzPM8pppeyWfGJDXhe7Et83qui/Lg=;
 b=JLzEl9dmVJNY0juMQqKGX8Ltb5y3LnyP8fW9QyC6yhZiqRiGeInnEsAVuvk/Be9DDVsdcamkvyKrT94fuTZTdBvrpMi/rhLrF9nFnrwIQtcFQwiB5krKpDTLuMDLD/SFcOoHk9S5wKkkApfNvXszKwx/W20Ao3bcP0la+Wj+BdvIfYCTla2F+V9nNnktEtcuhnMWMIpcueGG3yZtv9/9YKVfAQ25r+tT0DlopNM9ohbwz+CopZo0wmnwxySK+Sw4ByE8prlFbBVEGt3OTGTgsLgEf8sNE0SFqJAS92nNU3YzhY5i0XxWj+w48UatC+CQhhNqCdKcaQWbEQegiN6r6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fopHtokEYdrC/GEzPM8pppeyWfGJDXhe7Et83qui/Lg=;
 b=cKQ3SKUzTaHANrGG2D5dK5MbkYgtbw6SodK+sLkJ/JhsO4PapZ+j4TQ9qIIEISkvaj8R2RaXyv9kWa+R8lV5OqgcpfTJML7yBQVDci7yYKiaxymZBXcoLNIKbWvXmyc440SVMbmrVKJ9ztrgY+YU2OrLGWpmLqhRa3Fkjwoopxk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4754.namprd12.prod.outlook.com (2603:10b6:208:8e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 14 Apr
 2021 12:49:35 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 12:49:35 +0000
Subject: Re: [PATCH 8/9] drm/ttm: Don't count pages in SG BOs against
 pages_limit
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
 <20210414064804.29356-9-Felix.Kuehling@amd.com>
 <60d08770-e4f5-4e8f-0a93-2270ae02aa26@gmail.com>
 <YHayqD3IbupkY7b+@phenom.ffwll.local>
 <18a18e85-7b0d-649f-64a3-028376d8de15@amd.com>
 <YHbDQcr6Yl1Lljep@phenom.ffwll.local>
 <7ac3a5e9-abf6-6ea5-af21-25c04e984d57@gmail.com>
 <CAKMK7uFniPaRLpO9KmPe22xP69yahTwVomCE2FuMRG97_K_NVQ@mail.gmail.com>
 <18af0d4e-1ec8-a761-e4df-d4904755a432@amd.com>
 <CAKMK7uFpyLW1X0hWtS71kKMSQRgh=6AK3O+KtCJNw-8y9smiZQ@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f933cad2-a56e-4e1b-bcac-d36f9393145b@amd.com>
Date: Wed, 14 Apr 2021 14:49:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <CAKMK7uFpyLW1X0hWtS71kKMSQRgh=6AK3O+KtCJNw-8y9smiZQ@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e934:1a45:3324:73c2]
X-ClientProxiedBy: PR0P264CA0126.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1a::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e934:1a45:3324:73c2]
 (2a02:908:1252:fb60:e934:1a45:3324:73c2) by
 PR0P264CA0126.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.19 via Frontend Transport; Wed, 14 Apr 2021 12:49:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61d7a9cb-cc6e-495f-6b7f-08d8ff43c19b
X-MS-TrafficTypeDiagnostic: BL0PR12MB4754:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4754066A10320C55C0298D0C834E9@BL0PR12MB4754.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X5X1ORXLmILK2CJUAGs/3nbCTAb7ark18yTFE88YxpKP0bFj9pTkNyyUnWftl6vY/q5tnBKCtBMjjef5ikU4PfJOWJx+/cSXNmLpbMCswfTI/H1egYtwNG2klgj+0D4BPpEsEsGTdMw6214jE286K3M96Dj1xu2KH0oYHBDh0fkzRoZ7ud7lXoRSwA4GMBbmF6gbXTRA7G7iDt5XSz7j5/qKek+608L/ppogTe/tDNXsNAEuiFvDaPaZ6c4H+rz0wlQ8z70HlAdWn1AEIpFA5ombiUzzsAo53qLN03ERr97DaXEGWOP3E0kBbz+/ux47hONyoE98v84RH+E5KxqNvAl2X3ogVjsq5KyuIFMltPH4FBNlAdaBM2R6XumNVbDaLl7UeKVKQQdIHDcYsDRWYAbHgeZbx07UNN2ihILThbWwdNIw7m8TomUQIfu+0FC35y9id8Vb9fK97fNwoFuFCWDHJYSoQR/LUmD20xsKq5Xunfymzjczl2yCwXVe7xVq/fOF6iBtCxMhI5+WKOHa84mzyDdO8YMsOfzXtaVmuQ41MUz47RROi+H7rmR8ok1A4+0Ce14Q/YNgh+3lUF4UzXA0vLueZz6EkXQ+RJEF1GuKkGYD2yMgeCDGIuONMl6FBGP18zkhjEmg2khm2q5xgZesPR5P8pNpsO0sac0Qq2ml6PvM+ECq7x9XvY1yOhZv7Mn6F+x3wUrTFODwz+ZI9QFjCu/M74iU7CApemRZ8Sc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(376002)(366004)(136003)(31686004)(186003)(8936002)(83380400001)(86362001)(8676002)(66574015)(4326008)(5660300002)(36756003)(66946007)(2906002)(66556008)(316002)(2616005)(54906003)(38100700002)(6666004)(53546011)(52116002)(6486002)(31696002)(66476007)(45080400002)(966005)(478600001)(6916009)(16526019)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RGFwZ000WGpQTElNYVdhbVU0OVlaWUIycXFNblhuSUd5YnRmR042MW96NWpw?=
 =?utf-8?B?Wk1KVFNtU3lER0VjS3E1am5PNGl5SnpJMG9WcFptaDlEdXBLMG9Ha0NkNTJw?=
 =?utf-8?B?ZEJzclVNTXhxRFdWTWR5dm1GWE9hZktIby9lbzVyamFWaFM4eWdmOUxnWkZu?=
 =?utf-8?B?T0FCRy9iQlY0N3dMVUIzSi9lMzNaYUJ1aWg5MGlqYTdWV203MW1SWTd6UlFG?=
 =?utf-8?B?QVZpRlMzVENkSXJEMW5MOTAvOHRJbklKdFQ1WU5CKzl5N1dkVm85NzJuYWoz?=
 =?utf-8?B?N2NBdTBDOTNQT25pU3gwVXcxYXg0dmZBNXkwcGxBT0NGR1o3LzQwd2Q1OXpO?=
 =?utf-8?B?RXNoUy9CdUV0dW82SjBpVzZCTkZabmdYd1lPRFBQdnQ2MnoyUm1FTDFIUFpH?=
 =?utf-8?B?aWxzSlEwMUNWcjVCd1VsNEU2M1NWZHBtUW5IalJXdUovSDJnZkYyN3VJSjBM?=
 =?utf-8?B?SndtZWJkK2RCM3VBU0l5VG1iWXJsZGlWWkY4MEhKNFZybGxVRjlQekZzcHRV?=
 =?utf-8?B?ZHNGVnEzWlhXOUVBdjNpZjdNZnAzTXRud1N0U1dXaGt5VmlteFl6OEhjN2xa?=
 =?utf-8?B?dGVZWTMwVVhqU24wRnV0VHRNU2FvYzY0Um5lWEc0Z2V2SG5VZSs1bWsrMmtr?=
 =?utf-8?B?aG9PMkRGQ3ZRZ3dyelczWlhHUzNHaXBEc3p2V2JhSEF5R04yWFlUQ2Q2ODVJ?=
 =?utf-8?B?aHJiK0k0SW1vK0V4YW04UkM0bCtKc1dqdDVxUmFBZ0xjOW93cVNjb0lUWTNM?=
 =?utf-8?B?S3Jja0xaVW5ZREc4RTJDVStUS3ZlUWl0VGZHQlJjWXNNOWczRGVmM05INlR5?=
 =?utf-8?B?UkdIbUZlSHQyKzNnK2hSMUNLMlZRUHNzNG5SN1FJOTJtVk5mZ29QaTdEbnJD?=
 =?utf-8?B?ZEQ4ZmVGbUpLYmtSWG5hUCthMDZ3VnRIdHBrSkxxQ1UwWEhLb2VsaFEvblVv?=
 =?utf-8?B?WVBqd25EVHluY3F5ZTIwbW00bHdHYTdvNWpQTTc3bFJHaytJN2xBV2ZSQm1O?=
 =?utf-8?B?Vi9vSWFlWW9FVFJYaEtaTTJ0RmRLc1NaQTMwNHRyQm5ZcmF4WjlEdXE2RVp3?=
 =?utf-8?B?aSsrUmR0VE9YWWxRdUYveTJibGZ3SXBseTNzWUlwbzB3a0dqNm0xdkxzdEN1?=
 =?utf-8?B?V08vVnIybWpoWk5ZUnZMbjNnWmZpaUYzajg4b2MraFR3YmMyR0kvTWdTTjls?=
 =?utf-8?B?RnBOK012VTB3MVcyNGlvU2ZKSTVEMWNlbGdpck1NU3VpSzBPSnhHdWJuVU9O?=
 =?utf-8?B?Q3BRYWYzWHRoM3RoYTZTWFY5Yy8zaFE5MWZzSlBFOEVlWXk2djBiUGVOYkYr?=
 =?utf-8?B?NGxOeVlHbE5LVm9VQndWQzdlUTJWeVJkbUJ4Sld1YTBrTTV4c1VZa2hRcFVv?=
 =?utf-8?B?cHNvVjFoVkVQaEM1ekZ0Y2FVK1N5UjR2VkJXd0JMRmpQdFp6MjVoQXNZZkEw?=
 =?utf-8?B?UjlFUlI3bENlS2FRVzJLc1I4Sk8xeW82Vjk2V0haczcrMGlWYll4OE1hNndz?=
 =?utf-8?B?ams4NE41QnA3SXViU2pjWW5uUVd4eHhlaElrOUJjTGozUzlzNmJSWitxSmpH?=
 =?utf-8?B?OExFTXZieVNkSlk5SzF2Tlpid2hXVWF6ZzVJSDNKV1VhdUxab1NqcU1KemRn?=
 =?utf-8?B?N1lmd094U1NHTkIwNlJSUWN3aXhnV2MxV0tGN0JidFB3S0gySXpoVHIxVllw?=
 =?utf-8?B?c0pkK0orbi9WTGFEOWNXbVoxaTNHdGR0NVh6N2ZzdE14RlhvbkxUSnpIVXY5?=
 =?utf-8?B?RkRKZGV1cUc1RnhwT3JjNThxa1RhY1EwZTYzcm5hbVJuUisvNFBGZS9lWmdY?=
 =?utf-8?B?SHozVHF0Q3hIN1V6dFROZDliYVgzU1FxbXM2NjV2cnRkalRlc2szaTM1T2p5?=
 =?utf-8?Q?tr+kn1OFa//GE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d7a9cb-cc6e-495f-6b7f-08d8ff43c19b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 12:49:35.1483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NV4s03aTqoCFA6O74bUEWOFvC466+NduTT9SjSgxun6YjXp+Xe8pbWKJktpLOze+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4754
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTQuMDQuMjEgdW0gMTQ6NDcgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgQXBy
IDE0LCAyMDIxIGF0IDI6NDMgUE0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IHdyb3RlOgo+PiBBbSAxNC4wNC4yMSB1bSAxNDoyNSBzY2hyaWViIERhbmllbCBW
ZXR0ZXI6Cj4+PiBPbiBXZWQsIEFwciAxNCwgMjAyMSBhdCAxMjo0OSBQTSBDaHJpc3RpYW4gS8O2
bmlnCj4+PiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Pj4+IEFt
IDE0LjA0LjIxIHVtIDEyOjI2IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+Pj4gT24gV2VkLCBB
cHIgMTQsIDIwMjEgYXQgMTE6MTk6NDFBTSArMDIwMCwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToK
Pj4+Pj4+IEFtIDE0LjA0LjIxIHVtIDExOjE1IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoKPj4+Pj4+
PiBPbiBXZWQsIEFwciAxNCwgMjAyMSBhdCAwODo1MTo1MUFNICswMjAwLCBDaHJpc3RpYW4gS8O2
bmlnIHdyb3RlOgo+Pj4+Pj4+PiBBbSAxNC4wNC4yMSB1bSAwODo0OCBzY2hyaWViIEZlbGl4IEt1
ZWhsaW5nOgo+Pj4+Pj4+Pj4gUGFnZXMgaW4gU0cgQk9zIHdlcmUgbm90IGFsbG9jYXRlZCBieSBU
VE0uIFNvIGRvbid0IGNvdW50IHRoZW0gYWdhaW5zdAo+Pj4+Pj4+Pj4gVFRNJ3MgcGFnZXMgbGlt
aXQuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZl
bGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4+Pj4+Pj4+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IEdvaW5nIHRv
IHBpY2sgdGhhdCBvbmUgdXAgZm9yIGluY2x1c2lvbiBpbiBkcm0tbWlzYy1uZXh0Lgo+Pj4+Pj4+
IFNlZSBteSBvdGhlciBlbWFpbCwgYnV0IHdoeSBkbyB3ZSBuZWVkIHRoaXM/IEEgYml0IG1vcmUg
ZXhwbGFuYXRpb24gaXMgaW1vCj4+Pj4+Pj4gbmVlZGVkIGhlcmUgYXQgbGVhc3QsIHNpbmNlIHdl
IHN0aWxsIG5lZWQgdG8gZ3VhcmFudGVlIHRoYXQgYWxsb2NhdGlvbnMKPj4+Pj4+PiBkb24ndCBv
dmVyIHRoZSBsaW1pdCBpbiB0b3RhbCBmb3IgYWxsIGdwdSBidWZmZXJzIHRvZ2V0aGVyLiBBdCBs
ZWFzdCB1bnRpbAo+Pj4+Pj4+IHRoZSBzaHJpbmtlciBoYXMgbGFuZGVkLgo+Pj4+Pj4+Cj4+Pj4+
Pj4gQW5kIHRoaXMgaGVyZSBqdXN0IG9wZW5zIHVwIHRoZSBiYXJuIGRvb3Igd2l0aG91dCBhbnkg
ZXhwbGFuYXRpb24gd2h5IGl0J3MKPj4+Pj4+PiBvay4KPj4+Pj4+IFRoZSBTRyBiYXNlZCBCT3Mg
bWlnaHQgbm90IGV2ZW4gYmUgYmFja2VkIGJ5IHBhZ2VzLiBFLmcuIGV4cG9ydGVkIFZSQU0uCj4+
Pj4+Pgo+Pj4+Pj4gU28gZWl0aGVyIHRoZXkgYXJlIGV4cG9ydGVkIGJ5IGEgZHJpdmVyIHdoaWNo
IHNob3VsZCBoYXZlIGFjY291bnRlZCBmb3IgdGhlCj4+Pj4+PiBhbGxvY2F0aW9uLCBleHBvcnRl
ZCBieSBUVE0gd2hpY2ggYWxyZWFkeSBkaWQgdGhlIGFjY291bnRpbmcgb3IgZG9lc24ndCBldmVu
Cj4+Pj4+PiBwb2ludCB0byBwYWdlcyBhdCBhbGwuCj4+Pj4+Pgo+Pj4+Pj4gVGhpcyBpcyByZWFs
bHkgYSBidWcgZml4IHRvIHJlY3JlYXRlIHRoZSBiZWhhdmlvciB3ZSBoYWQgYmVmb3JlIG1vdmlu
ZyB0aGUKPj4+Pj4+IGFjY291bnRpbmcgdG8gdGhpcyBwbGFjZS4KPj4+Pj4gVGhyb3cgdGhhdCBp
bnRvIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgYS1iOiBtZS4gSWRlYWxseSB3aXRoIGEgRml4ZXM6
IGxpbmUKPj4+Pj4gb3Igc28gcG9pbnRpbmcgYXQgdGhlIG9mZmVuZGluZyBjb21taXQgdGhhdCBi
cm9rZSBzdHVmZi4gQ29tbWl0IG1lc3NhZ2VzCj4+Pj4+IHNob3VsZCByZWFsbHkgZ28gaW50byBt
b3JlIGRldGFpbCB3aGVuIHRoZXJlJ3MgYW4gZW50aXJlIHN0b3J5IGJlaGluZCBhCj4+Pj4+IHNt
YWxsIGNoYW5nZSBsaWtlIHRoaXMgb25lLgo+Pj4+IFNvcnJ5IEkgdGhvdWdoIHRoYXQgdGhpcyB3
b3VsZCBiZSBvYnZpb3VzIDopCj4+Pj4KPj4+PiBJJ3ZlIGFscmVhZHkgcHVzaGVkIHRoZSBwYXRj
aCBpbiB0aGUgbW9ybmluZywgYnV0IGdvaW5nIHRvIGtlZXAgdGhhdCBpbgo+Pj4+IG1pbmQgZm9y
IHRoZSBuZXh0IHRpbWUuCj4+PiBJJ2xsIGtlZXAgcmVtaW5kaW5nIHlvdSB0byBwbHMgZWxhYm9y
YXRlIG1vcmUgaW4gY29tbWl0IG1lc3NhZ2VzLCBpdCdzCj4+PiBjb21pbmcgdXAgZXZlcnkgb25j
ZSBpbiBhIHdoaWxlIDotKQo+PiBXZWxsLCBkZXNjcmliaW5nIHN0dWZmIGluIGEgY29tbWl0IG1l
c3NhZ2Ugd2hpY2ggaXMgb2J2aW91cyBpcyBqdXN0Cj4+IHJlZHVuZGFudC4KPj4KPj4gSSBjYW4g
b2YgY291cnNlIGV4cGxhaW4gdGhlIHdob2xlIGJhY2tncm91bmQgb2YgdGhlIGNvZGUgaW4gcXVl
c3Rpb24gaW4KPj4gdGhlIGNvbW1pdCBtZXNzYWdlLCBidXQgZm9yIG9idmlvdXMgYnVnIGZpeGVz
IGxpa2UgdGhpcyBpdCBpcyBqdXN0IG92ZXJraWxsLgo+Pgo+Pj4gQWxzbyBpbiBnZW5lcmFsIEkg
dGhpbmsgYSBmZXcgZGF5cyBvZiBsZXR0aW5nIHBhdGNoZXMgc29hayBvdXQgdGhlcmUsCj4+PiBl
c3BlY2lhbGx5IHNoYXJlZCBjb2RlLCBpcyBnb29kIGN1cnRlc3kuIFNvbWUgZm9sa3MgZGVtYW5k
IDIgd2Vla3MsCj4+PiB3aGljaCBJIHRoaW5rIGlzIHRvbyBtdWNoLCBidXQgbGVzcyB0aGFuIDI0
aCBqdXN0IG1lYW5zIHlvdSdyZQo+Pj4gZ3VhcmFudGVlZCB0byBsZWF2ZSBvdXQgaGFsZiB0aGUg
Z2xvYmUgd2l0aCB0aGVpciBmZWVkYmFjay4gV2hpY2gKPj4+IGlzbid0IGdyZWF0Lgo+PiBXZWxs
IGZvciBzdHJ1Y3R1cmFsIGNoYW5nZXMgSSBjZXJ0YWlubHkgYWdyZWUsIGJ1dCBub3QgZm9yIGEg
YnVnIGZpeAo+PiB3aGljaCBhZGRzIGEgbWlzc2luZyBjaGVjayBmb3IgYSBzcGVjaWFsIGNhc2Uu
Cj4gV2VsbCBpZiBpdCdzIGEgYnVnZml4IHNob3VsZCBhdCBsZWFzdCBpbmRpY2F0ZSB0aGF0LCBh
bmQgcmVncmVzc2lvbgo+IGZpeGVzIHNob3VsZCBjb21lIHdpdGggRml4ZXM6IHRhZ3MuIE9idmlv
dXMgZm9yIHlvdSB3aG8gc2NyZWFtZWQgYXQKPiB0aGUgY29kZSBpcyBnZW5lcmFsbHkgbm90IGlt
cGx5aW5nIGl0J3Mgb2J2aW91cyBmb3IgYW55b25lIGVsc2UuIFNvCj4geWVhaCBJIHRoaW5rIGlu
IGdlbmVyYWwgbW9yZSBleHBsYW5hdGlvbnMgd291bGQgYmUgZ29vZC4KCk9rLCBzZWNvbmRlZC4g
VGhlIG1pc3NpbmcgRml4ZXMgdGFnIGlzIGEgZ29vZCBwb2ludCBhbmQgdGhlIHdvcmRpbmcgCmRv
ZXNuJ3QgbWFkZSBpdCBjbGVhciB0aGF0IHRoaXMgaXMgYSBidWcgZml4LgoKR29pbmcgdG8ga2Vl
cCB0aGF0IGluIG1pbmQuCgpDaHJpc3RpYW4uCgo+IC1EYW5pZWwKPgo+PiBDaHJpc3RpYW4uCj4+
Cj4+PiBEcml2ZXIgY29kZSBJIGRvbid0IGNhcmUgc2luY2UgdGhlcmUgeW91IGtub3cgYWxsIHRo
ZSBzdGFrZWhvbGRlcnMgb2ZjLgo+Pj4gLURhbmllbAo+Pj4KPj4+PiBDaHJpc3RpYW4uCj4+Pj4K
Pj4+Pj4gLURhbmllbAo+Pj4+Pgo+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4KPj4+Pj4+PiAtRGFu
aWVsCj4+Pj4+Pj4KPj4+Pj4+Pj4gUmVnYXJkcywKPj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4+
Pgo+Pj4+Pj4+Pj4gLS0tCj4+Pj4+Pj4+PiAgICAgICBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90
dC5jIHwgMjcgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4+Pj4+Pj4+PiAgICAgICAxIGZp
bGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPj4+Pj4+Pj4+Cj4+
Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPj4+Pj4+Pj4+IGluZGV4IDVkODgyMDcyNWI3NS4uZThi
OGMzMjU3MzkyIDEwMDY0NAo+Pj4+Pj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
dHQuYwo+Pj4+Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+Pj4+Pj4+
Pj4gQEAgLTMxNyw5ICszMTcsMTIgQEAgaW50IHR0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2Rl
dmljZSAqYmRldiwKPj4+Pj4+Pj4+ICAgICAgICAgICAgIGlmICh0dG1fdHRfaXNfcG9wdWxhdGVk
KHR0bSkpCj4+Pj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Pj4+Pj4+Pj4g
LSBhdG9taWNfbG9uZ19hZGQodHRtLT5udW1fcGFnZXMsICZ0dG1fcGFnZXNfYWxsb2NhdGVkKTsK
Pj4+Pj4+Pj4+IC0gaWYgKGJkZXYtPnBvb2wudXNlX2RtYTMyKQo+Pj4+Pj4+Pj4gLSAgICAgICAg
IGF0b21pY19sb25nX2FkZCh0dG0tPm51bV9wYWdlcywgJnR0bV9kbWEzMl9wYWdlc19hbGxvY2F0
ZWQpOwo+Pj4+Pj4+Pj4gKyBpZiAoISh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9GTEFHX1NH
KSkgewo+Pj4+Pj4+Pj4gKyAgICAgICAgIGF0b21pY19sb25nX2FkZCh0dG0tPm51bV9wYWdlcywg
JnR0bV9wYWdlc19hbGxvY2F0ZWQpOwo+Pj4+Pj4+Pj4gKyAgICAgICAgIGlmIChiZGV2LT5wb29s
LnVzZV9kbWEzMikKPj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgIGF0b21pY19sb25nX2FkZCh0
dG0tPm51bV9wYWdlcywKPj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmdHRtX2RtYTMyX3BhZ2VzX2FsbG9jYXRlZCk7Cj4+Pj4+Pj4+PiArIH0KPj4+Pj4+Pj4+ICAg
ICAgICAgICAgIHdoaWxlIChhdG9taWNfbG9uZ19yZWFkKCZ0dG1fcGFnZXNfYWxsb2NhdGVkKSA+
IHR0bV9wYWdlc19saW1pdCB8fAo+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgIGF0b21pY19s
b25nX3JlYWQoJnR0bV9kbWEzMl9wYWdlc19hbGxvY2F0ZWQpID4KPj4+Pj4+Pj4+IEBAIC0zNTAs
OSArMzUzLDEyIEBAIGludCB0dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYs
Cj4+Pj4+Pj4+PiAgICAgICAgICAgICByZXR1cm4gMDsKPj4+Pj4+Pj4+ICAgICAgIGVycm9yOgo+
Pj4+Pj4+Pj4gLSBhdG9taWNfbG9uZ19zdWIodHRtLT5udW1fcGFnZXMsICZ0dG1fcGFnZXNfYWxs
b2NhdGVkKTsKPj4+Pj4+Pj4+IC0gaWYgKGJkZXYtPnBvb2wudXNlX2RtYTMyKQo+Pj4+Pj4+Pj4g
LSAgICAgICAgIGF0b21pY19sb25nX3N1Yih0dG0tPm51bV9wYWdlcywgJnR0bV9kbWEzMl9wYWdl
c19hbGxvY2F0ZWQpOwo+Pj4+Pj4+Pj4gKyBpZiAoISh0dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFH
RV9GTEFHX1NHKSkgewo+Pj4+Pj4+Pj4gKyAgICAgICAgIGF0b21pY19sb25nX3N1Yih0dG0tPm51
bV9wYWdlcywgJnR0bV9wYWdlc19hbGxvY2F0ZWQpOwo+Pj4+Pj4+Pj4gKyAgICAgICAgIGlmIChi
ZGV2LT5wb29sLnVzZV9kbWEzMikKPj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgIGF0b21pY19s
b25nX3N1Yih0dG0tPm51bV9wYWdlcywKPj4+Pj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAmdHRtX2RtYTMyX3BhZ2VzX2FsbG9jYXRlZCk7Cj4+Pj4+Pj4+PiArIH0KPj4+
Pj4+Pj4+ICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4+Pj4+Pj4+PiAgICAgICB9Cj4+Pj4+Pj4+
PiAgICAgICBFWFBPUlRfU1lNQk9MKHR0bV90dF9wb3B1bGF0ZSk7Cj4+Pj4+Pj4+PiBAQCAtMzgy
LDkgKzM4OCwxMiBAQCB2b2lkIHR0bV90dF91bnBvcHVsYXRlKHN0cnVjdCB0dG1fZGV2aWNlICpi
ZGV2LCBzdHJ1Y3QgdHRtX3R0ICp0dG0pCj4+Pj4+Pj4+PiAgICAgICAgICAgICBlbHNlCj4+Pj4+
Pj4+PiAgICAgICAgICAgICAgICAgICAgIHR0bV9wb29sX2ZyZWUoJmJkZXYtPnBvb2wsIHR0bSk7
Cj4+Pj4+Pj4+PiAtIGF0b21pY19sb25nX3N1Yih0dG0tPm51bV9wYWdlcywgJnR0bV9wYWdlc19h
bGxvY2F0ZWQpOwo+Pj4+Pj4+Pj4gLSBpZiAoYmRldi0+cG9vbC51c2VfZG1hMzIpCj4+Pj4+Pj4+
PiAtICAgICAgICAgYXRvbWljX2xvbmdfc3ViKHR0bS0+bnVtX3BhZ2VzLCAmdHRtX2RtYTMyX3Bh
Z2VzX2FsbG9jYXRlZCk7Cj4+Pj4+Pj4+PiArIGlmICghKHR0bS0+cGFnZV9mbGFncyAmIFRUTV9Q
QUdFX0ZMQUdfU0cpKSB7Cj4+Pj4+Pj4+PiArICAgICAgICAgYXRvbWljX2xvbmdfc3ViKHR0bS0+
bnVtX3BhZ2VzLCAmdHRtX3BhZ2VzX2FsbG9jYXRlZCk7Cj4+Pj4+Pj4+PiArICAgICAgICAgaWYg
KGJkZXYtPnBvb2wudXNlX2RtYTMyKQo+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgYXRvbWlj
X2xvbmdfc3ViKHR0bS0+bnVtX3BhZ2VzLAo+Pj4+Pj4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICZ0dG1fZG1hMzJfcGFnZXNfYWxsb2NhdGVkKTsKPj4+Pj4+Pj4+ICsgfQo+
Pj4+Pj4+Pj4gICAgICAgICAgICAgdHRtLT5wYWdlX2ZsYWdzICY9IH5UVE1fUEFHRV9GTEFHX1BS
SVZfUE9QVUxBVEVEOwo+Pj4+Pj4+Pj4gICAgICAgfQo+Pj4+Pj4+PiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+Pj4+PiBkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0Cj4+Pj4+Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+Pj4+Pj4g
aHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBz
JTNBJTJGJTJGbGlzdHMuZnJlZWRlc2t0b3Aub3JnJTJGbWFpbG1hbiUyRmxpc3RpbmZvJTJGZHJp
LWRldmVsJmFtcDtkYXRhPTA0JTdDMDElN0NjaHJpc3RpYW4ua29lbmlnJTQwYW1kLmNvbSU3QzFi
ZTMwZGU2Nzc0YjQ0Y2UzMDI4MDhkOGZmNDM3Nzc0JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJk
OTk0ZTE4M2QlN0MwJTdDMCU3QzYzNzU0MDAxMjU0MzUxMDExNCU3Q1Vua25vd24lN0NUV0ZwYkda
c2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dp
TENKWFZDSTZNbjAlM0QlN0MxMDAwJmFtcDtzZGF0YT1SNUlraktKViUyQm1HRHVsNVlxb1VDRFFL
Q05hWXRibTNvT3FUOWZURiUyQmd1ayUzRCZhbXA7cmVzZXJ2ZWQ9MAo+CgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK

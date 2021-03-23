Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9451E34645F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 17:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9648B6EC4A;
	Tue, 23 Mar 2021 16:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2055.outbound.protection.outlook.com [40.107.237.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02DA86EC4A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 16:06:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pk3oxfMJeXK3Ecms0g93k8itVrIfI6nt7wUdSt09spTzI+q1UsT8AgXSbRx+qCTviT7tc0Z0MvBofDHJC0JtPFOlCci2HhkVue/4Y/nvwnqd6DazS3WAa7Pb6CR4evKgfi16ZdYNCpyAvIL3XTekdmJ+h9Th3r+qeyXkbDbGBMaThU6E2MwjnIPxTUTU5IVE8y4qCYrW/0mcIqs0o18LuOIveimCKzITT+JqDTQdJArOxV25MHfQpcykvzTABCYYcnEkk7XTUrD7laV9j4uWfHMjzKIhqP2aVJFe42Pqf4TJm/noqG0vJXItOoBflr/wTczscEx9DCtcsEj3HfqjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DDjsVvsUgpru7W/bGS4fLINUAKStH/Qd2dArkyWlWI=;
 b=Y6uSQIEYVHzFdQeWvkqOr2EJfoGLmUYQb+2/+gBBuEKpl20NjARYKNuG2hniq2PJx2tj+BIfKUxzaSgMuf+lP9qMeseWOLb46SA76jVsjLrKRfayQe21pCkCNlGsKU51lZIy1R82MPpsbot9C1cH7yiaRiBY5KvpWBy2DLimVlZoFx8UYtSu2ZyleB9J8AowBAyHbFRbdJwTbMBItaRaCJGU+mjzaGIrC4Lt2toYGqsAIKo86h8zLtPN9uaiU7Z6VJccVuEq097IMkM9ekxQd4jmxLwwJhpaQsEjQxVcVJy4AjQ7l9ROFhSrE9s6JVafhpqaq4QBzo9kqyOhwuGBaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6DDjsVvsUgpru7W/bGS4fLINUAKStH/Qd2dArkyWlWI=;
 b=NBDkBv0LoGQMLpVdreDHutuBvs1N1IP/V3E68VAblmZqDBphi+snj6NO+BJ3BOw2IKkKvSs+J2pJZPnwAYq0XdwVQWakxXW9us52Ma6edum4jjsMkr5Ua4wwKJ0yw8J6sYrBtsWkaborDQYm6RSu/05CKEkd+2IK0MzeHMisDhNN+iourZDWL1YcrmH4Woanq0wC6oilFkQm2zomSzeSmoBAwfeKWr9XrU+hCtXoh8LGz5Hz5GyWHxsaBXiV3uNuDDdsa8QEY+aBBwH536tIemF3XtbBhTX3Y11IlMLFAwdcEssO/fxhZkZnWgfQE54JaR0jethL1OaKzZoDbK64Dw==
Authentication-Results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3210.namprd12.prod.outlook.com (2603:10b6:5:185::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Tue, 23 Mar
 2021 16:06:16 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 16:06:16 +0000
Date: Tue, 23 Mar 2021 13:06:14 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 2/2] mm,drm/ttm: Use VM_PFNMAP for TTM vmas
Message-ID: <20210323160614.GI2356281@nvidia.com>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-3-thomas_os@shipmail.org>
 <20210323140030.GE2356281@nvidia.com>
 <dff54e6f-91bf-8cb9-4d15-259a45154ceb@shipmail.org>
Content-Disposition: inline
In-Reply-To: <dff54e6f-91bf-8cb9-4d15-259a45154ceb@shipmail.org>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: MN2PR20CA0021.namprd20.prod.outlook.com
 (2603:10b6:208:e8::34) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 MN2PR20CA0021.namprd20.prod.outlook.com (2603:10b6:208:e8::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24 via Frontend Transport; Tue, 23 Mar 2021 16:06:16 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lOjXq-001Zij-Jg; Tue, 23 Mar 2021 13:06:14 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 111c5d47-29ee-470a-5d1b-08d8ee1596d3
X-MS-TrafficTypeDiagnostic: DM6PR12MB3210:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3210D31EB19D4F8C9B4D39F0C2649@DM6PR12MB3210.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3968;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GAGoOy+uOZOSooCMC7CdILFJs9/+X/LThF3Eos7BE3S7Mce90Tuwbh4cpsHLsR0m1XxONjphimKlinkyX4p9M31Y7ndt9iKSl6kcoMs4/oq9RyrxANYnzqEDrSM5BBTQYGPz+c5T3fPLwEptmV90mIOcSzkRev1OxPF3sWLjBf4jAKuBIjnO//j65wvavCIn4lFAcyoiL+ypl6L45O2bWlToBHZBm+T8TEBNushBiiIzWMsrCYzgjTuQ/MVsgGRqpy2PAkjQKQyZ8Ur847Q9Xrgr6HKvnm14AUuzWftxi2OTiAI6+d72s2KVOnOAjkeSjpjP1cUzjfWZbw+tSF2ST0huRbNkzgg9GulgT03OBsf9HKts4xRtbstCbvmXuTwhx6OPfpd7kHNY1BnqwR09kERSvhr16Hb7zsPxtd6YDtqmsZw7m5KHJWoywKbmiRx4ET2kfnxWbALCjIxwWeEH101w1NphhTwAMtt7CK7y40SXLDiwb49VAOg1eFeDJ2FFnQ1Kadjk+Tx9wqX00W9B4BLx09kwuGVxG0Vrt4LQ1YIEfEHvvgruLFGT0wsbYaewVdo0ZeMWPW7v1TrVqWP5PcmsBiBL7j5rkr1aP2bLjFwsoWyJAOzUiewW9ebnzyaXWepmmG0adf4D7rE/CpnuW3uqP5ZXPAz6ZAQLpopuWIE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(9786002)(4744005)(9746002)(5660300002)(8936002)(36756003)(38100700001)(2906002)(66946007)(1076003)(66556008)(66476007)(8676002)(33656002)(2616005)(316002)(26005)(66574015)(83380400001)(54906003)(6916009)(478600001)(186003)(426003)(4326008)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UytTNWdzcDJWSjl2S2t1eTI0NXFtOW9NQzVDdTMwU2VNRW42Y1V1N3B0SjNF?=
 =?utf-8?B?d0lWVHM3OUNmdkNZWmZoM1laYWtIQXI0Q3VZMXY1U3cvdW1JMHBiWlA0d1Yr?=
 =?utf-8?B?SXA3TDNzaGluT0RsdlloVkZpcXpHUDc2NDkwUnJGQS9UZHFYMUZOazNES1Z4?=
 =?utf-8?B?TWdVSm5KYmdsa2lUUVZyUmpJU2JhNHYyOEFaaE5najk3ckZ0c1VWNFU3YlVt?=
 =?utf-8?B?MG0rcll1eWdVaDBQWUxUbjIwQmpONFRvM1dvK3JNNFVnbEZUYk1WOTJ1NGFh?=
 =?utf-8?B?Sld0NlZYcW5pcG9LbUYvd1BwUjhiSkdVU1ptVjFFa0pFUEt6TkYvb05jaU1F?=
 =?utf-8?B?NnArclgySkpTMFdoaUNmVm01cW54U0FlY1UxQlE2WmgrcE5tb2UrZmltaER2?=
 =?utf-8?B?U3ZNVDlPeUFKQ0lXTG1sRzRMekVLejZrTjFNMTRKTmNiK2RsVnZEcHFRc2JV?=
 =?utf-8?B?NHg3TFZXeXRITCtGeEFUMWdZMHJCdzZXemliZUVyUlNEUnNxUTRsREdNQ3pK?=
 =?utf-8?B?bG9CQkZROU5FZjVoNGxFU2YwcGFTK3oyT0ZXRlc5OFdaQ1VHQUttNFY0SGtP?=
 =?utf-8?B?SnFKTHRoaXZPN0NwSlhoRDFKM2lZUnBseEV0endoczhyZzl0V2JlOTVBODBv?=
 =?utf-8?B?NGFLWW5VT2JPMHlOcVlyMXNCRGgzVjR5NjRud3VqWWZETDZNZXNzbHphUjV0?=
 =?utf-8?B?NHE0WGNYd3dWalEySW1Vbm9sbFJiV0V2WUYzdkd5a0JUNk9NNTQxaVdMNU9D?=
 =?utf-8?B?ZWR5NC9jcEJoTHZYaEh5OGNON1A0Tk5kQWhYQXMwMlNUbUNyUHNGVUxxWmxZ?=
 =?utf-8?B?TGRwdk4xL0c3bTNJL3lwcTk1L3oyQ3FsVVM4UUE2OVc0ZExpYyt0eEYwRDIr?=
 =?utf-8?B?cFl0d1VuT0dDS2hTZFVxMUgvL1BRYXVBQ0FDMFAwR0RwUGpkZzJRKzJ0d3lK?=
 =?utf-8?B?dW4yTFp1c2JUMjl4QzhwNEEzQ3RVQ0s2eVNnWnBqeDdvemkvVEFPSis4eEkw?=
 =?utf-8?B?dnh3Y2diRW1QaHVPT1JwUU9GNGVMd01YUmVUSm9MbU81Q3pKL0xleENWRkZz?=
 =?utf-8?B?VDkraFp4dWhjckxGVlVIaitSYlREejFiQ2VRMXQ0M3BGUDZKVUhubE0yTHVF?=
 =?utf-8?B?TlBvdW53a2JpUk9yNG1JUnVoQmtMWXlJWXFJNGl3cFN2WEtQV2tid2ZFQy9Y?=
 =?utf-8?B?a0Z5ZlB6RkpQUWM4OWNyYUZVM0FiQ1l0MmgvRTNESXRqN25vczdGeDQ1SkR0?=
 =?utf-8?B?bWZSUFZyZXJYOUxGanBaTWtYdTVrQndaNWZrMHVBbzRESjEzbVVZcFdLbEV2?=
 =?utf-8?B?Q0x4MW4yMDgrSmNidzQ1a0FUWjNxRnVpekdYYWVRMnBVSTJPbWhaMUFWODRC?=
 =?utf-8?B?eFVzOHZOcUVvdUcxMWhkeWVZcjIwZ0NkbDZ2Z1I1K0xjWnI4eTc5TjFaUGs0?=
 =?utf-8?B?bVJpVVBQWmhPSTBsVkJLbDNqZlYwWXUzYVRUV1B0Q1pna1lSbThiUk1KNDZ3?=
 =?utf-8?B?OVk3OTZyMUVOZnphNjl5NzVPSEJyOU5WOHNFZUZGRjBWUGxtdnF4NUFGNGZx?=
 =?utf-8?B?SUpuLzJnWjJzMEtxc2NmcGJlejlQc3g4SWpnVm5VUm8wZG1PaGg1NHNxMHN6?=
 =?utf-8?B?WUZoMnlQMk9wUWpoTDE4WG9Jejl2cFk2SFV1TzZYbTd2NGZ1bHI1cXJlYm00?=
 =?utf-8?B?WlhMdnJ6Q1d0aGkvSnJlSXZzQkYxRmlTdThGUTVJQ2I4LzVhOXZQUndHajIy?=
 =?utf-8?Q?A2I8GIidJ2/xytHR6wjDtVi7kydT7Ijj20TpcPN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 111c5d47-29ee-470a-5d1b-08d8ee1596d3
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 16:06:16.6142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNcuaDPFgYRJUk1lQqMXN+MgsxY0TyFOL26D1oJ35ihD/DLs1xonBOd7du7x4WMA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3210
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXIgMjMsIDIwMjEgYXQgMDQ6NDY6MDBQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKPiA+ID4gK3N0YXRpYyBpbmxpbmUgYm9vbCBpc19jb3dfbWFwcGlu
Zyh2bV9mbGFnc190IGZsYWdzKQo+ID4gPiArewo+ID4gPiArCXJldHVybiAoZmxhZ3MgJiAoVk1f
U0hBUkVEIHwgVk1fTUFZV1JJVEUpKSA9PSBWTV9NQVlXUklURTsKPiA+ID4gK30KPiA+IE1vc3Qg
ZHJpdmVyIHBsYWNlcyBhcmUganVzdCBiYW5uaW5nIFZNX1NIQVJFRC4KPiA+IAo+ID4gSSBzZWUg
eW91IGNvcGllZCB0aGlzIGZyb20gcmVtYXBfcGZuX3JhbmdlKCksIGJ1dCB0aGF0IGxvZ2ljIGlz
IHNvCj4gPiBzcGVjaWFsIEknbSBub3Qgc3VyZS4uCj4gCj4gSXQncyBhY3R1YWxseSB1c2VkIGFs
bCBvdmVyIHRoZSBwbGFjZS4gQm90aCBpbiBkcml2ZXJzIGFuZCBhbHNvIHJlZGVmaW5lZAo+IHdp
dGgKPiBDT05GSUdfTUVNX1NPRlRfRElSVFkgd2hpY2ggbWFrZXMgbWUgdGhpbmsgRGFuaWVscyBp
ZGVhIG9mCj4gdm1hX2lzX2Nvd19tYXBwaW5nKCkgaXMgYmV0dGVyIHNpbmNlIGl0IHdvbid0IGNs
YXNoIGFuZCBjYXVzZSBjb21waWxhdGlvbgo+IGZhaWx1cmVzLi4uCgpXZWxsLCBsZXRzIHVwZGF0
ZSBtb3JlIG1tYXAgZm9wcyB0byB1c2UgdGhpcyBuZXcgaGVscGVyIHRoZW4/ClNlYXJjaGluZyBm
b3IgVk1fU0hBUkVEIGdpdmVzIGEgZ29vZCBsaXN0LCB0aGVyZSBhcmUgc2V2ZXJhbCBpbgpkcml2
ZXJzL2luZmluaWJhbmQKCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=

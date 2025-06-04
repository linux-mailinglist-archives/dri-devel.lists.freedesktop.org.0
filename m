Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D78DACE694
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 00:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7D210E23B;
	Wed,  4 Jun 2025 22:01:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QNtD1rPR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA96010E8E2;
 Wed,  4 Jun 2025 22:01:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhydJjzD0nk1So8KG3aMQwLPw8IgZvJps8E5qI7469kUH2JcQYKh0IyAqUESmwyUJFeutIH7pnlxeX5qfd+gNb4HjdiZzG/PBYHirkbof7/dp7Mob4ThT3S3FyYkKTkhtjEewvFKA4xtN+kLF4uPU/ZcLrLg8pZUUGGLAUwAvwp0fCO7kftNFr8ZvmaGxx5Ekz7WL45oRL1oRUjY9zrsGhUtOnCozdjAK2ZtwsqrZyHDYHTT7ivrSpRVaO3r91LP/YibW6663WkoBi/EPFt68rLhdGPx2oAAw0j6y6W/QqUZxibIl6NMvtQbDADjFZ75Xvia9RuzX7mp3xCOxRZjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=elNZchCTjEW+lyAfYzRMg2PJl1cnmFYCyEmVSfT+WV4=;
 b=XCFuf9eLpgamWM28tXluVyth7uIryMbMBQ1BL0Tz/jiUicHlevPUFV0ak9Fmsu4lZXaBv0h7eOT++I/+ec8dG+iQd+e1Bl6NC1VelBgwaQQHN0F07kMACrzWM5ZC+cr+3QI5rhy3N03RkDtuEs/nUq+d/zT8ttCEUjASwKAwsVHOEiUMWGuuzBaBp0R4FefeItMpTk3F5Mwjl+9X4ByzFEi6MjEfxovy0plE1BvtDERfkGZeh9fvPJGodkFzvAJuNSX7QchVj5ZZG/DJDxYOUBmSioMILz68IUOqJf8Q4RE/y5LjRZsDPm756O8zcbNKgVd7jaZaPAY3srQKcCP2JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=elNZchCTjEW+lyAfYzRMg2PJl1cnmFYCyEmVSfT+WV4=;
 b=QNtD1rPRDdS09MyFxLfoAT3bKZ6p9oaHRY4WPStVQQQr0eVNVWpU8zZto1JgFebyDpBbJY4DkpEV727Y1rg4qvHXJzJuvQe/k+UsyCMF1qx9rvu6Yea4NGO1sQthjkYxwcmn29my66DK9NwBL9ElLoqCfalzND24gqMxhof+8W7diJdKyR9imeIamQWPezzsZbQG1CGOJMgvUFtTn4CJPGuj/mCOErPBWIWjnr5dwDvpWqGvu6KnFRFyXEyvD0i9gMIihBGGKZGAjwdh4yT8hjeu9ykXnOzNsN+v1JkDmbrcCSSfWHRgO/PKxbo9BnsSxRJ4wcELBxs93DnIwrsmLQ==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SA1PR12MB8162.namprd12.prod.outlook.com (2603:10b6:806:33a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 4 Jun
 2025 22:01:35 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 22:01:35 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "christophe.jaillet@wanadoo.fr" <christophe.jaillet@wanadoo.fr>,
 "philip.li@intel.com" <philip.li@intel.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "lyude@redhat.com" <lyude@redhat.com>,
 "pierre.morrow@free.fr" <pierre.morrow@free.fr>, "airlied@gmail.com"
 <airlied@gmail.com>, "jacob.e.keller@intel.com" <jacob.e.keller@intel.com>,
 "dakr@kernel.org" <dakr@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/nouveau/bl: Use kasprintf for interface name
Thread-Topic: [PATCH] drm/nouveau/bl: Use kasprintf for interface name
Thread-Index: AQHb1ZQiNSaKGMGvIUubP3nhiam5ArPzjVAA
Date: Wed, 4 Jun 2025 22:01:35 +0000
Message-ID: <704b69a6af32e0d89a6d88051c12f29fdadfa638.camel@nvidia.com>
References: <20250604-jk-nouveua-drm-bl-snprintf-fix-v1-1-79b1593ad664@intel.com>
In-Reply-To: <20250604-jk-nouveua-drm-bl-snprintf-fix-v1-1-79b1593ad664@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SA1PR12MB8162:EE_
x-ms-office365-filtering-correlation-id: 87f82155-12d4-4552-68ba-08dda3b35f64
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?ZTErWnROU2F4Sy9HaTgvSDJzVUhHSGIwYlJvaXQ4Q08xdTU2bm53T3NlNENu?=
 =?utf-8?B?Tjc5ZlcxVzBFWXprN2FvTXA4QUNNaHBrdnhPK0huM21KUXMreDlrczhJM3hV?=
 =?utf-8?B?dFpGQjFmbHBEZ3Bzb2RxcWdZMHlPM3A3TXl6K2JSeGt3cTJnOVhiQzlLNGMy?=
 =?utf-8?B?VVM3eGNBeXlnTXRCRHFlUUwzL3RkYkgxMERTc0NRM0o4bkE5VGpkTVR4YnpC?=
 =?utf-8?B?M2V0Z3lrcHdGOFlXa2JGUjZ2Y1p6WEQrcUc3Q0VtQ29ac3BSN1g2UGUvSnBO?=
 =?utf-8?B?aEI1cldWV05xOUZxcW1pay85MXFZbTVtN1ZpL2c0SThrUFZjVmY2bVh1MG1K?=
 =?utf-8?B?SVVNMUh1a0NVaDFhclhYbVkrSXhDVEEvcGV1MnpMVG5lYmNpZDc5OHJnN3hN?=
 =?utf-8?B?clZ4Nk5MMjFYbUNEbnJUZEd5aE5mOUVIUVg4NWdkS3FoRi9jSnQ2REVtR2Ru?=
 =?utf-8?B?eUJhMXBjVVJBb1ZkVTVuTG1WNDBmdXFCbEFqSXZHT3dtNUFwSFRqUkpVcjNx?=
 =?utf-8?B?K0ZMelNiQVVJYWxTVUZiNW1JdE0wT2ErM2JVMHFINFI1dVpaUnkrVEFvYmdl?=
 =?utf-8?B?US9EYlN5K2c1WURoejQ3cmcwRjdoREdqTUN1cGticEx4SmF0ZTR6K0FObzZq?=
 =?utf-8?B?NGw5dUR0TEhSNGJYalNpSXM0NDExemhCdFVRYUxRYnZJa3VNMjFieVlzNkcz?=
 =?utf-8?B?L0h0NHM1SFo5MGZXT0s4RUJSL1VwTzFVWE0yamRrUDc5N2xRb0l5a1R6anhI?=
 =?utf-8?B?WERjVmNDSkNZUmQwbk5hUWJLTmxqdkhiNzR0RVk2elkyVHVvaU9tSjlwVmNs?=
 =?utf-8?B?YlBqdElyYmZxYzg4eHBKTG4zcWpLVWgxRmQ2b1NuTjJWa3ZXaVo4cm8rdmFl?=
 =?utf-8?B?ZkVDWmp5S3pWeDlnUUZyd1Q2MiszQUxIR2l0VnErMDVmczJJam5jVFlsRmp6?=
 =?utf-8?B?VGRVcWgrMFFDckoxeEl0Ryt4YXhJOUY2VUlyMjdVNGVaMFArWGxsaUduZnhG?=
 =?utf-8?B?NnVVM2RMYXpFaTZBYzBiVG5yZDhhRXJ3NTJWN2VrRjdFNG4wUjRkbzVWYVUw?=
 =?utf-8?B?L1M4Z1VOczZYdlZtSWFHVWVCdEFRbTlNMGpWd3p2d2d1SXFYRU9Kd1pobmdi?=
 =?utf-8?B?Slg4amkrYnYwRlNQQmZkSm9na2xnMnZ2WE1UK2dpUGR5MUg1STlwUkN2TUxj?=
 =?utf-8?B?R3E1R1RkaUk4dGRWTEFhbzQ1QWdNcW14QytKY1hzWTl2azFlTnNiM2lUeGF0?=
 =?utf-8?B?WlBuMEtlSGdUNzJwT0VKTEtYWGJSbyt2UlJGOWhoTUozM3ZwMTlJdVBsUHlL?=
 =?utf-8?B?SFlsU2JuMVRWdWk1SW05UVNrSHB5TnU3Umo3ajl3UG9zR29wWDAwR3ZOSGpZ?=
 =?utf-8?B?QzRHaERJRVZka3pnQk1QSGFsVmQyaTRWYXBVN1ZwTzJxbGZXSW5iL0RjSVhx?=
 =?utf-8?B?Qk91V0QrV2Uwc2JjMjd3UE4yU1ZBQjNvMHlhdEVlY1ZCeC9ER01XNmJBT3lR?=
 =?utf-8?B?MU9HcVc5SkxsTitSYnRIV0Zhd2sxU3IzZlQ1d1dWb0lsS21hNGJEMW16aDQy?=
 =?utf-8?B?eXZyTHBiNGFCOHgxdlUvbWZmL2lGazE3c0dDTVJkQ01ZZzNSQlRBSFpIbWdZ?=
 =?utf-8?B?MTZMUmh1ZFZ1WkI1VElnLzBOWkdrRzN4Y2ZSYUtDTlViSXNZMzNpdEpMSkVR?=
 =?utf-8?B?ajBadGx4S2VCREdod2g3MGpXMFpnY1ZaVTJKN1dIaFV6VlA0YVo3UXdhSzBa?=
 =?utf-8?B?S1Q2bnRIRUtFNUYrZ3BNYnVBcHhDc2NSajk0QUo5QTFIaTFHaFloaFMrWFl4?=
 =?utf-8?B?SkZaSURiR1JlTWRLOVJCK3hqdFpKOVJhZWYrT1kyYVMyUWN4TFRMWTNrNjNH?=
 =?utf-8?B?QUhEUVlKeUFjdmR2aFNHVWVQNmRsQ3RTTUlRU0pjZ1VHZ2ZOclA3aXVnU1Vr?=
 =?utf-8?B?T0pFZWYrQWxBZmRsN0Q5VjVhMDVPQWNmdmg2cnQ5eTB1MldJbS9ITmdlUmdK?=
 =?utf-8?B?bXN3Um9Rd1UrTDZ4NzBpUU9IRW1KZjBrM0FFZzA1RmV4UU9uSVVVME8rVHRR?=
 =?utf-8?Q?xxDp/a?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2JnNURKNHpUQlFnelVjSGMvWnN1WjBZMXZGMTlRdWl0SzhuU3BGYytzTFpF?=
 =?utf-8?B?aTNROHkxeGoyWFZqMkVPYzlDVUxPZjBaSi9NQ1BpNG11aWs4K1ZkTS9PajA3?=
 =?utf-8?B?N2hUZXpDWVpNeWJTZ2lsL0F1MWJsNDlGelMzaUV3M1dtRGVKZG10ZXduYkQ3?=
 =?utf-8?B?NlRwRFJWQm5CMmt3aDZEd2ErN0QwRktCbjdudUw0ZDhZUDRuMW44bmxCalN2?=
 =?utf-8?B?YWM4TUNYbGdMaTdXZ21Wc1NoMGs1dWNtRDRlTDFaNzdHeVVKZUJlUGZ4VERP?=
 =?utf-8?B?TjQ1OVVmVHdGVGtpNlBjYlhpZTNyamsybzlCcnZseXRrVlRvNlo5WUFjeGdr?=
 =?utf-8?B?OWVjellobllnc2hkWWZrdks2Uk9NZk5hVXZhaXFUcUQzSkpJSUNyaWQ3ZDNQ?=
 =?utf-8?B?cEpFUUFuOFJGSGlvM1pHUjNzK3BjTjFlUkRGdWllT0haTWt0Q0FRcGdyRjJi?=
 =?utf-8?B?NDlMQTNZWXpkaVRjQ2MraWc1N2dJSC9NbUVTY2pBODJ4RG1jbGtSdDh0K2VU?=
 =?utf-8?B?MXVSVzBTRDhnVnZIdTlySkxUV2tpNVF0SDdib2hZdFUrd1k5elhhbk8ycEtu?=
 =?utf-8?B?eUczVDUvWFA4RmtmblRnSzM0OXhFeWpMUUg3anJUbTM1Snh2QzV2OVM2ZkdD?=
 =?utf-8?B?aEpham5tVkpuS1J1RXdxQ2JHYVgydTAyTW9pdkNydmI5ZlBycjhSNU5MV0Mr?=
 =?utf-8?B?VnJDb1VvK2orNlBlMVpqdDBjYzRDV1hyeWFiMkRRTHcrVFpJVDFjVWY0T1Vk?=
 =?utf-8?B?VEVmRjRMMUJDMTdILzE4S2k0cjVXYTM2VUswaTU4aFo2U1F0OGtjeGVaS1pl?=
 =?utf-8?B?bCtlYzFkTWorVUJCZXlaVzcvZDhDeHhVcXRDQjhWU3puT3dUQldyU1I5U3Zj?=
 =?utf-8?B?TytwdG5venEvUStNR0pMTURqM0Rtd2dzNUxYYmFNN1c5RHJjOUxoMjFmeEp2?=
 =?utf-8?B?M21EUVI4alFtVlpKMGhXL2gwU3pNWFdNYkNrVEY1OEhsNWxFOWhKQVJSYWhO?=
 =?utf-8?B?N2pxa3U0RGVFZndoQVptRThDZ2kxN0JZMlUraXBqRkV3ZEFUMXZiMnBiczJJ?=
 =?utf-8?B?S3FPeE1nSjBlZ1VMQWpUMjRrcm0xenpxZ0ZFdDJvN0c0Tk9xOXpyc3pCTXR5?=
 =?utf-8?B?c0FvY1FRSzljczRsUlFiNkpObVNleXRaWHRkNURpLzVXUEJzRWRaOHpIYU5q?=
 =?utf-8?B?eWI5YjdnaVA0dnpyVDB6TmlFWlVPOEREbGhuN21wcldUdnNLL0dYUnJaUWhU?=
 =?utf-8?B?Mm5Ia1BraEdEYmlnRndNbVhOLy9IdDVVajJNSWgvMmNveXMrYms1MG1HQk9T?=
 =?utf-8?B?ekYyVkZ1VEhXaXEyandJYUQzdmlxeFFKT28rMU9rMWJGbGJGdzJuVWozTzhI?=
 =?utf-8?B?SDZaZEkzZHFOZjlzdEl4bVlJNDdKVTNBdjlERXc1YzJaS2J0MnBPUy9OU0JR?=
 =?utf-8?B?RzZieFBkTmdXUm0wREQ3SUdoQTFkMkszWVEwRXg5cFYrNVpzSjJqWHlJMVFG?=
 =?utf-8?B?ZzdiZ0UrRDN5ZGc2a2RVb0I3dWdCLzdwcnJrWXIrK1hoVDkrU2pDb1crcE5o?=
 =?utf-8?B?Nm53cUlXTU5TVjlSRDhzZWE0UzB6WXNvNjlGRFJTRFNxNkVEdll3eHZONWcr?=
 =?utf-8?B?NmVKMUloQVh6dHBlMTUwVGVlUk5XaExkSlRBeWZZMjVvRkprQVpJVVVKUFlh?=
 =?utf-8?B?R0dLcHVJR3pnYmJjY3ZUa1lqeHk4NjhQOU9kM2NPanpvZ0tEa283K0dnYnRI?=
 =?utf-8?B?eEtIQm5ydlNpL0E3M2IybVluTVBNY2RDL1U2bTVoR2hYVjcwVWprZXlLa0s5?=
 =?utf-8?B?bjJjUklzZGFwdDBLVEcvZDRUTnR5dW5mcDBsWEpQTXlhaS9HUFpDeTllSXpw?=
 =?utf-8?B?eUhRSzN0N1VndFdQSU5meUhtVi9PRUJ0eW1WenpUaXlza29NTkJXUDZsTWVn?=
 =?utf-8?B?dUhCV0pRUTZNM0JQQUpxWUpVVGJ6M2E3VEovUkRKQXY0R25vU3pPZ1U5eHZW?=
 =?utf-8?B?dFNZOVRQR0NPUExqdlJVbVNPdWtQdFhUNUtSenQ2SEZKZ1o4NTJBVExyZ1My?=
 =?utf-8?B?ZXFTdFJBSldKZHI1Vkw3cHJ5SU9MOWk2aUFiK2xCbm5nTklaZ25rcDJBQlEv?=
 =?utf-8?Q?mKR13DlcOkROF/4MSzBgmsDX1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C9CA21B583B42468FC1733695684032@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f82155-12d4-4552-68ba-08dda3b35f64
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 22:01:35.0939 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a2TdGBKIv/EKnJqo76aYLYif4JEzslqnlXCs/z4qR4RuAQjO3QjAE4O1nDOjK2hkJUQ4xMqKtm3iQ8XYGJGR9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8162
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCAyMDI1LTA2LTA0IGF0IDE0OjAzIC0wNzAwLCBKYWNvYiBLZWxsZXIgd3JvdGU6DQo+
IFRoaXMgY291bGQgYWxzbyBiZSBmaXhlZCBieSBzaW1wbHkgaW5jcmVhc2luZyBCTF9OQU1FX1NJ
WkUgdG8gMjQsIG1ha2luZyBpdA0KPiBsYXJnZSBlbm91Z2ggdG8gZml0IGFueSBzaXplIGludGVn
ZXIgaW50byBpdHMgZm9ybWF0IHN0cmluZywgb3IgYnkgY2hlY2tpbmcNCj4gdGhlIHJldHVybiB2
YWx1ZSBvZiBzbnByaW50Zi4NCg0KSSB0aGluayB0aGlzIHdvdWxkIGJlIGEgYmV0dGVyIGFwcHJv
YWNoLiAgYmFja2xpc3RfbmFtZVsyNF0gaXMgc3RpbGwgc21hbGwgZW5vdWdoIHRvIGZpdCBvbiB0
aGUNCnN0YWNrIHdpdGggZWFzZSwgYW5kIGl0IHdvdWxkIGVsaW1pbmF0ZSB0aGUgYWxsb2MvZnJl
ZSBjaHVybi4gIGthc3ByaW50ZigpIHNob3VsZCBiZSByZXNlcnZlZCBmb3INCmxvbmctdGVybSBv
ciBsYXJnZXIgYWxsb2NhdGlvbnMsIElNSE8uDQo=

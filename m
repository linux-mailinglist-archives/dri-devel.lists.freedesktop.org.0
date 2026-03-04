Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iM1vEjX0p2mtmwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:58:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3141FD081
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 09:58:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B90910E983;
	Wed,  4 Mar 2026 08:58:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z9xUnyHM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD1610E981;
 Wed,  4 Mar 2026 08:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772614706; x=1804150706;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6XrPrTbHt44tof4qyO+TzL9MLEGW91HmHtfP2bRG/6I=;
 b=Z9xUnyHMgj9wkiCkYTC2NH4wwbgSmV0lKYLYsGaL5tzsaj11HgvUKiN1
 WPgWIwuz8Zx/CPKSDlGJ9Re22Gh9ApApxvJkIjAQJOjMV7TLYyF4HlBuT
 F2rAQwTT9U+8eY6yIt9zthDeAmDz8M4ycpzwM2kU7vIq1hPPyX8mcHEvY
 xvGn72AmnzlNGnS2e1K4aqFws+HMWErxkiD4Ql2bHrIorkUJveyhryhN2
 l6Aj57APdtc7BLCfTu1n8/woFk/oUxn6KU15cthccz5cJ2fGFDGI3znfM
 nZzTO4RdxivVrZ9Gy9F2sETqZ6LepYZZHYZVjTvmwcqFtNF4p4YiIWZpF g==;
X-CSE-ConnectionGUID: ScIHYtrpQY2kB5wqseKBEQ==
X-CSE-MsgGUID: 1bExj3kxSXCc0bVcm4WWFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99142582"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="99142582"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 00:58:24 -0800
X-CSE-ConnectionGUID: /x70lnUoS1C+58tTG3zUEA==
X-CSE-MsgGUID: 5p+7ZA6YSbaE+G1WHr61cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="222942321"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 00:58:24 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 00:58:24 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 00:58:24 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.53) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 00:58:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bMRx/qG9uhqAGl7G59ZHFVPWsbZKd5S4AH/yd+4Fbg1GTb8hBCkEXin0OSUPF15/vjaOGsGuFKEQHJ0uDioTksB8GztVVFPuHVZFfBry1VHu4gGQpFEtUrz0cnU+yxBMwzKnhWPuapsJeAvHDRlD9UbV8L+ANKONfYX4q15mHbfpCpqrqTfvM14cLCPvICi2nWy/LR8yLayTewHkNJ7bl9qBfvOM0mCBfJbBwAjb33vXlni3eyOW4erjSOVZgXaHjbj8yTJ8N8zSspd3Ip7EW2sx1awaIUCLyH+xLPTtM88BRIg82KEAu/G2CTT0BtNsqzTUfnK2YoZQouJ4IqVyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6XrPrTbHt44tof4qyO+TzL9MLEGW91HmHtfP2bRG/6I=;
 b=BkCa0lLq4nkSUOmHhYFvceAtFyWYK30dmjUrvJjx0Zqob3kcHlYmvJIRwsuhMaOb42a9xs/nT/m6B5AeGoAn/oDE9ug6pY4GLtuwoIH9atn88FG8X/CPKMbEsLGmOogBcifkR/MRRUC1ovoGtRBoqNH+A4pp3Iuwkfg+tglG9FRO99EpMHy3sJC+GZjvuOVgkLJ9OZGNrrHkbo49BapEaLpRNnX+HZRYoWl/k53idrNwheqA8agAgEBk45FH69KTfNhlIHaly7PYNNHdvDXHqvVoG3qj7Sh6nUpyMLzDB/9xuMvp/qgZSom9rieSeKJofuIooWw8iEV3KvqzFXAfQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 IA1PR11MB6243.namprd11.prod.outlook.com (2603:10b6:208:3e7::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.22; Wed, 4 Mar 2026 08:58:21 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 08:58:21 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "dev@lankhorst.se" <dev@lankhorst.se>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, lkp
 <lkp@intel.com>
Subject: Re: [PATCH v2] drm/ttm/tests: Fix build failure on PREEMPT_RT
Thread-Topic: [PATCH v2] drm/ttm/tests: Fix build failure on PREEMPT_RT
Thread-Index: AQHcq7TVCMd4zTu8R0GG6QAxq0nQG7WeEq8A
Date: Wed, 4 Mar 2026 08:58:21 +0000
Message-ID: <d98e78d4b24b8b18db6a8d82d52ebf8f91c6fbfb.camel@intel.com>
References: <20260304085616.1216961-1-dev@lankhorst.se>
In-Reply-To: <20260304085616.1216961-1-dev@lankhorst.se>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|IA1PR11MB6243:EE_
x-ms-office365-filtering-correlation-id: fea79569-9a60-4253-6b06-08de79cc2fc9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700021; 
x-microsoft-antispam-message-info: 7nMD7Pfo0X1vmOH6628MoqsAJd4GMUfic4cXD9kIwp+IIoiNAlVJ7d2P4cMMHL+kgY+ovnhO2kNELKBubRbn6iv9RqnG0Wi0ZcM5/r57TJUZcGiMZOb976Xujx7cB1wLl7QCAWMGDnYKeLYBDIhnH8Glr187/u4VCeVTg587GMmZVLzeuzy299BtliPvfNZ+6FD6B9ZFa3uvidOKrMe7WJHwRhr6HWgqdwy8NZidfn2Jf1dAdz0moAjOHUmbTLS9ilI3gXhxU6J92LwFj7BIYpIFj6Y232cz3zJYDs8dej7kaLXvFw5FwDy/vfe096r/tytEI5Y55VoHymDILhZNakt0itFuq4ggSvKsjGuiTLiSL2V36jahX2YgpRCFswvDpDcQoZtYrqyogmOHMwOC9wA+tCWvnjREed3gAeYJfeBjif4Ut9IB8BPoytSI1QHN+SFC0Hy1HlBWtJ+aFPv6qu2jb/Hj/nzI0Cz45rg5o3CmUA0Ry6Y4Nixc082sg0vslZjuzbFfBUpbU4KBmqNMC78fYPo3UL/q/Y7kMGEyX0bEezTPEUJGG5HluA3YvzcijrLhzBKSMEEKuwoO0iSVKhL0HXwj+WhcZO+QGch+Gc+fwz8s2Xt7QlKuI45U2dzrbIKkzkJTfw1fgPoshX4CEEB3Zg1wFkthCvqaahao1YqcrfutGZjvCVaYR7Uv1ZFY7fSkk/dGPOsNwEblFXdaaCymomPSwcCM8OedtIz21Oniv2DJAlbCHManpkksUd9uPbJaHdFOWm8hMrrlrxZ4VCBycREDXe9yCuRZHJIBsUE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDhTTW9GR2JySDFCWmk0UVBBd3Y5Q1liY3dNN21zREppeXRkVStsSFJLK0Jv?=
 =?utf-8?B?QXRVdDQ5eE11elJPL2I5Y2FsNndQUUJWa2V5MWtFTkJvTkxvSlJPNjlEUXlv?=
 =?utf-8?B?Y0Y4QjRCYVdoUXZrRForZ2pyRzh1Z1ZjV3BadnJnRGx6R2Q4bkFnN1lkWHpy?=
 =?utf-8?B?M250bFdBN1owL3F5dW1jbGxvL09oZmtTbUlqSng5bDFCSGROTWNzUGlFc2p3?=
 =?utf-8?B?MGxJNTVIank1S3N6UGNoRkN0UlRZZHBMZmVBZWZiS21ZaDdueGhhakpFZEsz?=
 =?utf-8?B?N0VvMXV3QVM3bEMvNGtSYkpGTERWbDAxMkQ2czdvblcrbllhbEtUVFlPSU9i?=
 =?utf-8?B?NXlIeHhWQ0lSVlJkclk0bmZiVFJsS294dE9VTk9rZ2dFNGhwYTZ4NGZZTkJk?=
 =?utf-8?B?RDdNMHlZelVocWE4SlQ4Ukc0Q0tCRjZWM1BCYjVJcmlXUGpQUXZnVU1FcXAr?=
 =?utf-8?B?bGg0cHk0aWpDTkVLQnVCMjRxOVRlS2xhVWlmVjlvUVZDSVowZWF3MytxSGxE?=
 =?utf-8?B?cFVlSnZubHc1bmM2VGowZExBT2trRGZwUk85MklUOFpoR2tQOHQ5dGYvL2Y1?=
 =?utf-8?B?VUg3d2VjRGJncy8rZ04wcVpXazdDWWVhMFc3QUJTUFhBWlBUTThHYUU2MTFK?=
 =?utf-8?B?L0wycmJ4ODM0KzFjbTFYRDdaWld2M1RXQThWL0hXUWcrZUhiZ3FYOTFGcW9q?=
 =?utf-8?B?UjJ2MGNIa1pqZWtwQTZMVzFOSnErYnZ5cG9RYUVkOFpqVEtqWEJRcW1kR0Uv?=
 =?utf-8?B?YUVBV1VwelBKV1BsTVBoWG5JN2wvVk8xRmFxbDM1RDlCRktwWkNIZ21vdmtJ?=
 =?utf-8?B?TzIyV0xPSUhYSkV4Z2kyOFZOV0NaV0t6alVUUWplbGJyNStxRWhyVXVDWHpa?=
 =?utf-8?B?alRxdWQzODhXcmM2c1JpRk9ON3ZucC9NaDhrUFVGME4vd3hTK0NLdUhqQlZE?=
 =?utf-8?B?VTNOK0UrSlNtUkErMHV1MERoNVJrU2s0MUZ4N3pIKyswT2phSFFUTkZoVVlo?=
 =?utf-8?B?QUplak1HN2Z1cVpIZlU0eVkzN2pZSVNXMDFBeWpLNkNON0dnek5Pa0NkNVlh?=
 =?utf-8?B?KzBYeVJaeWs1OXVkYVJBV1A3R0QvSzNNdDIxUEhIa1RDVUpuUFV6SVdQSlIx?=
 =?utf-8?B?Zm9tSkxjWk1XOTRJUVk1bkZnN3g3Z3dNZVYvbVVRb2ZoNVd5ek9lTVRYRnht?=
 =?utf-8?B?WERPVHJFN2VxanVZOFZZVXJ1bUNEdjN3TjFpVlFiV3NNMmpNa0tGd1VpTkxH?=
 =?utf-8?B?eWxqU1RkM3NBd1FMdjl3WnRCa3FsSWpKN0p5d2dIWFR5OU84ek1EMDJLZXRZ?=
 =?utf-8?B?N3B5QkpISEVmVXJsNXgrbktvcnhlcmNoZEhvZXd4Vkozb09nb0tEVlROUWxz?=
 =?utf-8?B?UEF1Sm1oZG83TUFqMkxEMzNCaHk2alAxSm8yQUN0WFVTN0pQTGZpZzZxa1h5?=
 =?utf-8?B?T09BQjU1Sld2NTN5TVRTTm9aZEtPcEY1UWxDbE5xYTR6ZDVHemJMMEptT0tC?=
 =?utf-8?B?R2k5b1hsWFFzZXhKN3JncTk5Mk5ZZUIyZE1BYVJzb21VQTlmMC84Rk1MajVm?=
 =?utf-8?B?N0kxVDNSNHpkQzdvaTRheFJ0L2RSRTZmZHFLSjE1YWdweTBOeEhUakIyWGdZ?=
 =?utf-8?B?MlIxY2NYRURoblJEb1NkNW9OdUY0dmo2NUhsT2ttTHZ3Qm1ta2hoanVNd3o5?=
 =?utf-8?B?SXlvS29OWmJTZW1NTmduekNsdVN2V1NGOEd2alB0UFRQVk1Ea0M4Z0tSQk9t?=
 =?utf-8?B?NGNxVTNia2h6NlJnTzN3U1cwbXN6NjlxL3lYY1YxcE1WU1lzZnIvL0RhN3JM?=
 =?utf-8?B?WHVJaEpoOGxqM0x4R1hDZURubDZObWp6VVhDdkFIUFREMENSVUJOdFFldDQ1?=
 =?utf-8?B?dkNLSS9uM3FoZ1JscFYrTGtIdnRmdjNhS3NUc2ZvMHh0cG1vMThYRUdPcytN?=
 =?utf-8?B?TkV0T1JWeXgzcUkyL053aWJKZDU5V3VxQllTY0FQR0VyWHh0eGU2TEF2M2ls?=
 =?utf-8?B?a1hGQ3IxbFFnZE9Ob2FjTWpUcXZlZnp4TnMzS2R0UEVMZzRpZmRnRlprbnNi?=
 =?utf-8?B?UU9lM2JZNlp6K2VDN3JkVmpseFdTQlRteEN0RTJVYyt6OHBSdm9Hajc4ZmVL?=
 =?utf-8?B?TE4vRUFTaGhmS3ZkVGRGMGYxem5rR2E1WjMvM1JUNHlhbndLVGRCNk1maENt?=
 =?utf-8?B?UUFjMWJHRnJxRHpQaUxYTWE1bDZnNk1BckpUOEJydFBCL2FkSEJHd2pjT01z?=
 =?utf-8?B?SEtZNzFiWGNWK0h5OGdUQU5WeGthWHRIQ2RjYjlnbW1EeU1vM2wzQSs3ZXVI?=
 =?utf-8?B?bjh2MDJvdi9ZeFB4cmNjdDR5MTAvR3pYcVhSM0hidXU3czNGZG1yMmNGc3ht?=
 =?utf-8?Q?yN7rR85kHDDb9De84BOSE2Wi6vz1+HdFyGsG5WXVteleI?=
x-ms-exchange-antispam-messagedata-1: A5/RzjSmr05MyT7PfuY/5jj2HRW45/Lpv8g=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3BC94DAFFDAE04492E7E60D0EB85D94@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fea79569-9a60-4253-6b06-08de79cc2fc9
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 08:58:21.4867 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: U6B26C2OS5lyiO0K7OCbzclJyd4uiY4FdyzfPeD3QaIvbo9uZmdcuhNHopnb1EhdVpAqUl6iuJWvrsCP8PWOBEMoKRXmoGUThNkQ+z0l/Wg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6243
X-OriginatorOrg: intel.com
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
X-Rspamd-Queue-Id: AE3141FD081
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,lankhorst.se:email,intel.com:dkim,intel.com:email,intel.com:mid];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[jouni.hogander@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

T24gV2VkLCAyMDI2LTAzLTA0IGF0IDA5OjU2ICswMTAwLCBNYWFydGVuIExhbmtob3JzdCB3cm90
ZToNCj4gRml4IGEgY29tcGlsZSBlcnJvciBpbiB0aGUga3VuaXQgdGVzdHMgd2hlbiBDT05GSUdf
UFJFRU1QVF9SVCBpcw0KPiBlbmFibGVkLCBhbmQgdGhlIG5vcm1hbCBtdXRleCBpcyBjb252ZXJ0
ZWQgaW50byBhIHJ0bXV0ZXguDQo+IA0KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3Qg
PGxrcEBpbnRlbC5jb20+DQo+IENsb3NlczoNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Ut
a2J1aWxkLWFsbC8yMDI2MDIyNjE1NDcuM2JNNnlWQVMtbGtwQGludGVsLmNvbS8NCj4gU2lnbmVk
LW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPGRldkBsYW5raG9yc3Quc2U+DQoNClJldmlld2Vk
LWJ5OiBKb3VuaSBIw7ZnYW5kZXIgPGpvdW5pLmhvZ2FuZGVyQGludGVsLmNvbT4NCg0KPiAtLS0N
Cj4gQ2hhbmdlcyBzaW5jZSB2MToNCj4gLSBVc2UgdGhlIGNvcnJlY3QgbG9ja2luZyBwcmltaXRp
dmUgKEpvdW5pKQ0KPiANCj4gwqBkcml2ZXJzL2dwdS9kcm0vdHRtL3Rlc3RzL3R0bV9ib190ZXN0
LmMgfCA0ICsrLS0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdGVzdHMvdHRt
X2JvX3Rlc3QuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdGVzdHMvdHRtX2JvX3Rlc3QuYw0K
PiBpbmRleCBkNDY4ZjgzMjIwNzIwLi5mMzEwMzMwN2I1ZGY5IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3Rlc3RzL3R0bV9ib190ZXN0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3R0bS90ZXN0cy90dG1fYm9fdGVzdC5jDQo+IEBAIC0yMjIsMTMgKzIyMiwxMyBAQCBzdGF0
aWMgdm9pZCB0dG1fYm9fcmVzZXJ2ZV9pbnRlcnJ1cHRlZChzdHJ1Y3QNCj4ga3VuaXQgKnRlc3Qp
DQo+IMKgCQlLVU5JVF9GQUlMKHRlc3QsICJDb3VsZG4ndCBjcmVhdGUgdHRtIGJvIHJlc2VydmUN
Cj4gdGFza1xuIik7DQo+IMKgDQo+IMKgCS8qIFRha2UgYSBsb2NrIHNvIHRoZSB0aHJlYWRlZCBy
ZXNlcnZlIGhhcyB0byB3YWl0ICovDQo+IC0JbXV0ZXhfbG9jaygmYm8tPmJhc2UucmVzdi0+bG9j
ay5iYXNlKTsNCj4gKwlkbWFfcmVzdl9sb2NrKGJvLT5iYXNlLnJlc3YsIE5VTEwpOw0KPiDCoA0K
PiDCoAl3YWtlX3VwX3Byb2Nlc3ModGFzayk7DQo+IMKgCW1zbGVlcCgyMCk7DQo+IMKgCWVyciA9
IGt0aHJlYWRfc3RvcCh0YXNrKTsNCj4gwqANCj4gLQltdXRleF91bmxvY2soJmJvLT5iYXNlLnJl
c3YtPmxvY2suYmFzZSk7DQo+ICsJZG1hX3Jlc3ZfdW5sb2NrKGJvLT5iYXNlLnJlc3YpOw0KPiDC
oA0KPiDCoAlLVU5JVF9BU1NFUlRfRVEodGVzdCwgZXJyLCAtRVJFU1RBUlRTWVMpOw0KPiDCoH0N
Cg0K

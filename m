Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id w2iqNFkwoWkLrAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 06:49:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8EA1B2F7E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 06:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA41410EA3F;
	Fri, 27 Feb 2026 05:49:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FcLB1NRD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4234210EA3F;
 Fri, 27 Feb 2026 05:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772171349; x=1803707349;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=udskAzHT01jNRvevkOGc9l5eL1raRnaR+Xwp4swv/Js=;
 b=FcLB1NRDywY9/JtdEvm0/RH6H88QGZDHA2K2aV3RdksCP23Z+q8kCtnW
 WsToO85Gja+X3BCN5uP7riN6lQMgPmpOexGKjTpF2/xe1RHfZ9fTFzcqX
 MgplcyMCJtLPwAIEtJjRtjQT+Y0gP5a6m4vbQMGh0Vv76cP0dO0sXtK0S
 CRL8Nas+Tfhmj85S2uIlaQUKeO8zfY77m+aXCvtNokqTyTKzT9SrqqGMN
 hB8aceUI5i0/2CuGSZmsjoe1nueUl+M+Mfn42f/g1j8dmQBin0Yx+Gx0i
 pelHrbBM68CXeLILpFQMAKF7bxdXJr7IkSGUMUwjCI6yuYdad3FeiNy1K A==;
X-CSE-ConnectionGUID: f9U7zxCxT0mQ93mTElyMsQ==
X-CSE-MsgGUID: 8iSFvPJvQ0KDLJzLkrfegw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72280849"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="72280849"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 21:49:08 -0800
X-CSE-ConnectionGUID: CTk9E/DeSVeUugUsOwed1A==
X-CSE-MsgGUID: CFGlGGxmRkGFamwAFGnVgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="216031552"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 21:49:08 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 21:49:08 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 21:49:08 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.61) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 21:49:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FN7U5GQST2ilBabl7yXcrB+YQQPL5B2+I+1R34yfWcPumHY7EMj5t2G+bnSJdpQVcW4hUosGIE8b7LysDp/tBTry5GtTOIoMTcIjdyRHOUOQDzVWKQwhszjjHdD+2b6o9JoJShVvYpmEDotnd3wvGQZDCm6gH3YDLOx4YG3IU10FVpYUZik8sV0OJKcly2GBfjvwc3weRMQQiNPXF0aPsyuGHZcsBvBJqEE53DfI5BUPgSX9OrUQLXa+iMG4sjvW5tQRM6O2NhFuBZrs5NwHRdCKozMvgnPmlJFWz93awHRfU8O/v0dKOD4/qhO29V0D4TuDXAFZP3DtiiRbe4d/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udskAzHT01jNRvevkOGc9l5eL1raRnaR+Xwp4swv/Js=;
 b=pA21M4dc0yJXDjIC+VzegZ7UuUgisWzHdXwEZ0fUKdRlE49qVneHFU7iOABYHi6Ck5nuKCJgg5PYSo8+X4WDMiVEXhWLamNgnG3k0Js2QQz72dSeGnj4It/56kqf0tQjS7+UJ1oiPpTHJiEqiQSM/+FAOPSMvzeBHaVG8TIleNA5kIIgYrdxF8Jp5HXO9BtWmIOKWBqiii81yaFb1touawlGMv4WL6gHfGouiALgLbLYfnN3bWaFnEMqksZ/uWdEgTEZnGR1N0CsPkz1I9rXYC+yCYS+1aB3E/QZqghhNoEERRq0/U2ZUvleK7wFBKsJWV7HGouVvq+gQBRA+idNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 MW4PR11MB6837.namprd11.prod.outlook.com (2603:10b6:303:221::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Fri, 27 Feb
 2026 05:49:05 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 05:49:04 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/dp: Add definition for Panel Replay full-line
 granularity
Thread-Topic: [PATCH 1/2] drm/dp: Add definition for Panel Replay full-line
 granularity
Thread-Index: AQHcpipTwbOSHXU0dUWsHDoCApMvP7WVehyAgACTHAA=
Date: Fri, 27 Feb 2026 05:49:03 +0000
Message-ID: <f84e9e8b9147cabfd86996c6d81d9767668db949.camel@intel.com>
References: <20260225074221.1744330-1-jouni.hogander@intel.com>
 <DM4PR11MB63607DE2CD6A445F51C9925DF472A@DM4PR11MB6360.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB63607DE2CD6A445F51C9925DF472A@DM4PR11MB6360.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|MW4PR11MB6837:EE_
x-ms-office365-filtering-correlation-id: 15371c0b-3816-4fb6-458a-08de75c3ea9c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: YAM71+dAw/2F5z1aBRtPmkyWIM10R549QfEiDwoA5rMPz6EdR/poieZcbJVWHk5dT3oibPnzOg1x7IqPZgorLEKHo/pkSJq6S0pL7QWYa/HJ7ex9sOdTqRLyHFHGV9feppx0W7rzSz/mJLMvnTUMHEO+ziy1UV8jbwZ86Z+Xh4LOw6m/UmVeUUTxokmIej97KjO+LueZFD0eqICRd+IVZEOrfGcZjCJ5VOFI4u2H6rU4yggG2EAFrEW3r7FXiWetKbOn2JxvmstOKvQNgWI8dnIB8RXy4YEXtns4bqsVMf68C87iqEBheUDw7Lhnwx653W5gtpGD1/ASe3Nx5cMdjwD205n1OSkJSVTFAp7aj9akr/2hi4nLpcsjNNGj8m4GY1qZn6E8c9SPC3Zz4MOKZmQ8SMda8fy+vGB0gNwmwmAU0+zai7BNuevgVXfQZX9ZlY8TDD2yPIAP+8n5LJh32xvR/09yNRuJRE8JwzeQhyOlJIhp3ltu8tfoeSzYU73tQW3YuSIj+PxnWwGzWZiGruf8UJwTVp9LZC9yl2Nx4QJuYWvulI+67RetygIqIw276y0w5LNWw0m70/yWs9Ud55wWg/T4KV6TewqGCC0Ld2dqYSBp3geXo2aXiyJrLtsz7jdO60J0o92WlYdPUFjAUMF3FG/tTyUBHRqy54IpbO8JmnWaJP04wiHewDhKmEBwNuYgMc2yjdmIOk4w2Rq1G9B5HjqM8HtSFAyOdcifMFhMFJ/3wkj+qF1mvg00CIEbWvbQ4y1RF/S72mRyK5RT7VZQOgTRoUIacw1tHI7pFPg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NEY2RG5leGNQUWU4YkM5cm5wbjVwbkdST1RoMUQrNTV5OExvZUhjandmaEpB?=
 =?utf-8?B?QjdKaWZXMTJGdWR4aGZpd3lldlFud3l2SXBCRHl0d2F0VDAyYnkxTmRRMXVo?=
 =?utf-8?B?QnQ1OEl6UjAvOWhCaVNqRG5nTU0xbStEcWo0QmxycEk5M1N4b0QrNWRyVE5r?=
 =?utf-8?B?TVQ2aXdrNUpMQ2FMR2x4aU51N1VTL2VTT2lsQlJiQms4NGFja0lvUEZvZWJo?=
 =?utf-8?B?UUxwSU9EdzB6ZmxrbVRyTWo2TjlYNUpZeUVNNXhrSHRQZzNZaEhSZ2dlTkF0?=
 =?utf-8?B?WU5jU1d1L1pvNC9CdW0wUHBQbGlSdWlWSTZtYmQvK1ljbVdhZHdPZkVvLy8x?=
 =?utf-8?B?Nkd6bDZMdUZiSEZhZzlGNVR2c0NGWGw1dlE1NmYzbDliQkxlbWhNRkxHa2E4?=
 =?utf-8?B?VDJqSlUrSndyRjY1QkRNdWF4cFFjSUd6NC9WTDlkc0s3cDk3TFZid0JvZW5Q?=
 =?utf-8?B?Z3o3Nk91Y1hDQUkzVFIxWmgzb1NNWm1sVS9qcFlqelprei9ic1pDOUJqOFRK?=
 =?utf-8?B?Q0lXeVhOTVNjalhnZmk4bGhwejQrWHN0S2o5WSttN25wbTRQK1JIWldaNzgy?=
 =?utf-8?B?UTZIRXA4bTRKcGtEMTNLcXFVUjA4aWErWlBBeWYybURkVFBnUi8zUGRidkQ5?=
 =?utf-8?B?dTJPY1U4S3JBSXF2Zkw1MG1hRzNKalFzUk1TMmI4OXMrbllPU2ZFMzBkWUVy?=
 =?utf-8?B?OFlIZjNlU3lWbWw5M2lKa0VQcTc1SFJ2Rm5mTS8ydWtIcXNkdVhOMGtybkQ4?=
 =?utf-8?B?QmhWYi9Wd1U2a1hFR2EwTXFJajlFOUkrUE1VWm8zNUJSUk5KL2N2a01uYytw?=
 =?utf-8?B?YzhGUUs3VS9PL3NHeWtJMm8vb3h3L0haSTEzK3VlNmNza04zNEg2ZXlEajNq?=
 =?utf-8?B?RW1qTXlaMHNUdjE0WG5xUjN4WHdNNmRqSWV5SlFpdmVJRkZ2eE5MUzBCUE1o?=
 =?utf-8?B?ckpZRG5qdjBDdWprS1FIaWxhbGNjQmdEUjVLaUJVWjZ3U3l1dndtRVBERVZM?=
 =?utf-8?B?RW9RalB5N2lCZ0p5UEd2UG1sZjFYanFnTHkvR3ZJb2NXSVF5ZVF3SU5GalZl?=
 =?utf-8?B?dTQ2V0JYY244VDZOUUhYK0pvS2llOTRndE1xNjd6T1QzRlpKZS9aVGtWS0FJ?=
 =?utf-8?B?SSsydkVBZzBKQ0g5WXBoUENZanpNb0VNclowNHBkeTdsb2FYRDhJUFhYbWtm?=
 =?utf-8?B?UGdXMUswa2FZbmwyQ0l0VVh2V2pvNkFGb3RQbEdNcStUMDgrb2FqcmtoM292?=
 =?utf-8?B?b3lhRGpZZTY2dDFWQlhLTyswdi9NcERrWUZuSVRieHY3QzE4cm5uZnBtZUVz?=
 =?utf-8?B?YjR1M0s5eGhXQi9DWGF4dlgzVFJKTnRXWFFpeC8yOVdIM1RmMGZpOWozL1h1?=
 =?utf-8?B?Tkh2dW4yK0U2MjBndk5pc2lXem4zWlR2L2NtejcwVzhrdnNQTHpsNTBxRDFM?=
 =?utf-8?B?dThVellqRjVJMVlONW50ZTJHQmdOS0V4K1oxMlJPVmJBWitESVJxNHlJOGdF?=
 =?utf-8?B?aVhVYXpRQkFiM0FqS3FOUFVzcHM4NnYvNy8yTFpTQjlWV3g0Wkc5aFFIdFh5?=
 =?utf-8?B?c1E1bjJkSDYxUmU4c014MFd4QlpnbDUwUmcxNjl5aG94RGFxVEhaWXA5QkFO?=
 =?utf-8?B?N2o1aDBJUjdQbENka2w2RTJudDZkSEQ5OHlWbFNKaW5IeGRkWVJTS0ZwaVV2?=
 =?utf-8?B?MUdHVW84WTdXUGNWcy9xWDUyb1Y3NGZIN1hEQWFNZndRNm1veTJ4WWRpNmFX?=
 =?utf-8?B?Q0xRUTQxaDYrSXJzcmNWUlhMb1FBV0k2dFJIY3dqeTJyQkoxYTk1ZG42QjVo?=
 =?utf-8?B?QnI1SEdKUXk4aUFYdEUzcUpHYlNISzd4ZzdwRndEZWtaeG9tSWorR1lvWmd4?=
 =?utf-8?B?MHhGd2lGZW95c2VsZGY1anVVaXU5dytFb0w4L1FLRTV2cFYyY1YyUG1QZ3Fj?=
 =?utf-8?B?REtRTlRoR2NrMkRjT25nMldGTG9RdmdwZ0ROMzZiNmxpTmJydU9nbXJia2ZD?=
 =?utf-8?B?cVJReERuNnNHaGNPaEtEb1kyYXJJd0hpYVZFNSsrRVdQVFhaa0F4Mnh4WDVQ?=
 =?utf-8?B?QW51cE1xZjRQRGhvanhQUW11SWhyQVY4V3h2M2JaeUxVSjBKSzhzWTRVZ2VJ?=
 =?utf-8?B?SmRvQnhoRFJIMFZscG5nbWJtTHgrb0VGMUZjanVObElxaWVWY1JrMWxjd3A2?=
 =?utf-8?B?UU9KcXNHZ2tHczF1SlJ3RWkzWk5HU0t2UWMrY0Z4NU12WmR6bFMzTkZqbTNW?=
 =?utf-8?B?Z3lDOXQzdVNpWW5qRW1DOVhkbWdyYk1VSTgrVjVwRWRaNUl3VFJmZFdFclpU?=
 =?utf-8?B?VUNPdXYycnI3QTA5YWZJdGx6dkdVZCt6V3luMlV4VDZzdjRjTnN2UnhsOW5O?=
 =?utf-8?Q?wxyUZXHwY0m1c8Y5/+BnBxVaz+/8ihlcCtDsk0SeoPIso?=
x-ms-exchange-antispam-messagedata-1: g5eta113ZIzg3uNJ8Vu9BPDvJgQifEZ2748=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D23ED8194E39A9419C3F6F26C16890E0@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15371c0b-3816-4fb6-458a-08de75c3ea9c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 05:49:03.5902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xxJbsB+eDziIlLg6QW0avdVYRKSYvrmGPc60fQ7eY2tKvcqzO+H6zHwJ3mPKXu5GCZQ5XCa4SN0Cz8G43btfjBGwe6tzafRJnP0TglCTCZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6837
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.freedesktop.org:email,intel.com:mid,intel.com:dkim,intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[jouni.hogander@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 2E8EA1B2F7E
X-Rspamd-Action: no action

T24gVGh1LCAyMDI2LTAyLTI2IGF0IDIxOjAyICswMDAwLCBTaGFua2FyLCBVbWEgd3JvdGU6DQo+
IA0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEludGVsLXhl
IDxpbnRlbC14ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmDQo+ID4g
T2YgSm91bmkNCj4gPiBIw7ZnYW5kZXINCj4gPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDI1
LCAyMDI2IDE6MTIgUE0NCj4gPiBUbzogaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsg
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IEhvZ2FuZGVyLCBKb3VuaSA8
am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPjsNCj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnDQo+ID4gU3ViamVjdDogW1BBVENIIDEvMl0gZHJtL2RwOiBBZGQgZGVmaW5pdGlvbiBm
b3IgUGFuZWwgUmVwbGF5IGZ1bGwtDQo+ID4gbGluZSBncmFudWxhcml0eQ0KPiA+IA0KPiA+IERQ
IHNwZWNpZmljYXRpb24gaXMgc2F5aW5nIHZhbHVlIDB4ZmYgMHhmZiBpbiBQQU5FTCBSRVBMQVkN
Cj4gPiBTRUxFQ1RJVkUNCj4gPiBVUERBVEUgWCBHUkFOVUxBUklUWSBDQVBBQklMSVRZIHJlZ2lz
dGVycyAoMHhiMiBhbmQgMHhiMykgbWVhbnMNCj4gPiBmdWxsLQ0KPiA+IGxpbmUgZ3JhbnVsYXJp
dHkuIEFkZCBkZWZpbml0aW9uIGZvciB0aGlzLg0KPiANCj4gSSB0aGluayBpdCB3b3VsZCBiZSBn
b29kIHRvIGNhbGwgdGhpcyBhbHNvIG91dCBhbHNvIGluIGNvbW1lbnQ6DQo+ICJUaGUgU1UgcmVn
aW9uIHdpZHRoIHNoYWxsIGJlIGVxdWFsIHRvIHRoZSBob3Jpem9udGFsIHdpZHRoIG9mIHRoZQ0K
PiB0aW1pbmcgYmVpbmcgdHJhbnNwb3J0ZWQiDQo+IFRoaXMgY2xhcmlmaWVzIHdoYXQgaXMgbWVh
bnQgYnkgZnVsbCBsaW5lIGdyYW51bGFyaXR5IGhlcmUuDQoNCkkgd2lsbCBhZGQgdGhpcyBjb21t
ZW50Lg0KDQo+IA0KPiA+IA0KPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+ID4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dhbmRlckBpbnRl
bC5jb20+DQo+ID4gLS0tDQo+ID4gwqBpbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oIHwgMiAr
Kw0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiA+IA0KPiA+IGRpZmYg
LS1naXQgYS9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oDQo+ID4gYi9pbmNsdWRlL2RybS9k
aXNwbGF5L2RybV9kcC5oIGluZGV4DQo+ID4gZTRlZWJhYmFiOTc1Li44YjE1ZDNlZWI3MTYgMTAw
NjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaA0KPiA+ICsrKyBiL2lu
Y2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmgNCj4gPiBAQCAtNTcxLDYgKzU3MSw4IEBADQo+ID4g
wqAjIGRlZmluZQ0KPiA+IERQX1BBTkVMX1JFUExBWV9MSU5LX09GRl9TVVBQT1JURURfSU5fUFJf
QUZURVJfQURBUFRJVkVfU1lODQo+ID4gQ19TRFAJKDEgPDwgNykNCj4gPiANCj4gPiDCoCNkZWZp
bmUgRFBfUEFORUxfUkVQTEFZX0NBUF9YX0dSQU5VTEFSSVRZCQkweGIyDQo+ID4gKyMgZGVmaW5l
IERQX1BBTkVMX1JFUExBWV9GVUxMX0xJTkVfR1JBTlVMQVJJVFkJCTB4ZmZmZg0KPiANCj4gU3Bh
Y2UgaW4gI2RlZmluZSBjYW4gYmUgcmVtb3ZlZC4NCg0KSSBmb2xsb3dlZCBjb252ZW50aW9uIHVz
ZWQgZWxzZXdoZXJlIGluIGRybV9kcC5oLiBJLmUuIHJlZ2lzdGVyIGZpZWxkDQpkZWZpbml0aW9u
cyBoYXZlIHRoaXMgZXh0cmEgc3BhY2UuIFdoYXQgZG8geW91IHRoaW5rPw0KDQpCUiwNCkpvdW5p
IEjDtmdhbmRlcg0KDQo+IA0KPiBXaXRoIGFib3ZlIGZpeGVkLCBDaGFuZ2UgbG9va3MgZ29vZCB0
byBtZS4NCj4gUmV2aWV3ZWQtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+
DQo+IA0KPiA+IMKgI2RlZmluZSBEUF9QQU5FTF9SRVBMQVlfQ0FQX1lfR1JBTlVMQVJJVFkJCTB4
YjQNCj4gPiANCj4gPiDCoC8qIExpbmsgQ29uZmlndXJhdGlvbiAqLw0KPiA+IC0tDQo+ID4gMi40
My4wDQo+IA0KDQo=

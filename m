Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICCzG143oWkbrQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 07:19:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D02011B3270
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 07:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C7D10EA49;
	Fri, 27 Feb 2026 06:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlMqzR+/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA12E10EA49
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 06:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772173147; x=1803709147;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=//JThhcVdYirxfJUgS7fdCX2p+x5hzuUGmgWirmqXbQ=;
 b=XlMqzR+/HwuoGCx23MQ1DR+RywE5nbHA9Pz+nTRK4asYgW8Gs6DVtDiZ
 AQR6kY77fvK3PXf5yS0ViKhnTiWuwtMNlFHYdeoWh27tI6IHsU+j0znP9
 fIhcKBIMlpJrsPpqhwey2FCKqzpWGIgiDeIDtT76OwMZIG/nOgA7hLZkr
 KdVSK+8NPDfhWPJ54/s6wV1r4JQB0dtzheUgZplqX5T1qs4VrMnyjc7jk
 790NzGJsrbLl9ng94FgVhrJi4dJVMclGVGLoX1XEaTCQM4QWcgPr4l6WH
 ysBN93HKO1b7gzeslJKkAfBuqRofBidvsdsNUZSAx6Db244uCt6hWoTO0 w==;
X-CSE-ConnectionGUID: K/7pZAXQTl+V/Q5R41ZArw==
X-CSE-MsgGUID: g607FIE0SymWNLFXLrHeEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84604128"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="84604128"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 22:19:06 -0800
X-CSE-ConnectionGUID: gCTRmnx6RFOA0imKjqeJgw==
X-CSE-MsgGUID: Bcmn10A/RjqizwoEaVl3rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="215468238"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2026 22:19:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 22:19:04 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 26 Feb 2026 22:19:04 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.67) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 26 Feb 2026 22:19:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GLR/+D60wbRFV08dd3KVyWekT47FBm/yxF9BAlWabyOHcwoYLkwXv5wTq9zSRVXrguw0Znvu5sAkjnkfjmtAeSuHyRZmjoApfwCb/rtp6VrO+5V6ZPg3qtMueCE7JTJAU4pRrrpNdAgCSbm2JOwh9EyE6AHmKTdaG9rALjqszzKdOryeKLPL+myC6JSHqpeT6zkeTbtuujqt9bbe6LQWzENiJG93WNtItRAQuIWduX9/MySBVPPNH+Y53xZontYGAuNjjuWCRDJTJkheWFQiotDPgXcSfYFUXwDbZACtE343Nx9P6jD6hukIyNXIK9a9KFIam/vwAiciqQd7eSDusQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//JThhcVdYirxfJUgS7fdCX2p+x5hzuUGmgWirmqXbQ=;
 b=Um4pr/xSsqmDir6Z0qgKB+CeUzWrDwS2xITHzDORALxF4ICu2ol1zT8qTgtI672Oc2pmHg9i9yshE661Noraqhgzq70Wuf/0uYjvZdEJPFrwme2dfBJwqlDSM2reJQ1Nfi4TGaCI++KArw8QjUhKnmoSOmqps6vsm0q6GnqK6f8E4Bb9UVdRCfYy74TYU1f94X+BGgoA+aitxmRfeWkiyAjePTSo1gU7O/FMLuptOZgcZuLpiIB8VkSLQJePIk19ehjLrykHIEE5A8wLAuPjTTwZ2x4MfVYZvzAKM5rmrB057EAewc5PFLDKLfIIC+m0P3Of05fbcg5ty67pjOXrOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 SJ5PPF4990C6B9D.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::826)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Fri, 27 Feb
 2026 06:19:02 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 06:19:01 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/dp: Add definition for Panel Replay full-line
 granularity
Thread-Topic: [PATCH 1/2] drm/dp: Add definition for Panel Replay full-line
 granularity
Thread-Index: AQHcpipTwbOSHXU0dUWsHDoCApMvP7WWFZcA
Date: Fri, 27 Feb 2026 06:19:01 +0000
Message-ID: <f64e8ff2922e0782bcfb5166e15c917b396513d5.camel@intel.com>
References: <20260225074221.1744330-1-jouni.hogander@intel.com>
In-Reply-To: <20260225074221.1744330-1-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|SJ5PPF4990C6B9D:EE_
x-ms-office365-filtering-correlation-id: 4e82a276-a48b-4c8f-8da5-08de75c81985
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|38070700021; 
x-microsoft-antispam-message-info: yGVU41olabo6UJ+OlQqBZSJXC17bM82P6k3vuxRWF/QcoiuTzhg+yr4KwrQYlRUjQAZU5badxKzkF1kcovFMeceLxUrONb1Ayhcz2Y+ENh69XzrEPoBm+ewBEAtX9tCJ3sK/8Br9Uwys4saMFr05nQDEU3WY8DYiHk00Cfyjd4Gma0zXgNdKRHL8YXbaUkzaX/u2kJs+3g3O6cfY8JGK4uGU4F2mHMmp/++XwD5bA2fQK07mZn4FaqNmglihnZ33mn0BVYQwlg0jKgifPmBMk/WDe74uz/JPxk3OA7zQbK/znsRn93iKnQrj0zEc4vaZPAuG9D00Nj7ubn3iqCbe/PL4cMjyQ+ptxG9eUI0egauZySkjpODWdB4AMPiJe0KKwFkXFzCn9igcCXNpzLsUWD31NUSO0BLByQhWW7i3q2elh+ZL4nmOsffOCzvxqWKurRrmzdyo2+JZLImM54lukslCyf3zhT1P1q+vg/gcajc4fNol53aF2blS3qqDZa8VKosK0JtHt39xtuqh4v/4YR/5lOlrAWS133g1Vkn8CppBEACe4fAj3dUh2c9EQU8icBne+L1QHzyyfB+qVJ65QcB5EpPC/mY7l87ophCXuGuqUj+TBRG67RhLPd9eNBwnX2H2FISORiaJELsmKjO6I8CnvosKh89r7CRsvmTY4vv2QvHYZM7v14G6c+SxiPPYxK7ciLL3ixIIK7xtgmxpTxqE3dLO+Zh4FtmBwK8V5rz1tdJ+L6X5oFGDlauMxBgsPkp+9OkLi5GuEGL50k91yawGom+xpxxS1Qb5uRBS968=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVY1dHh4Sk1neWpvRExFaGZiM3JjbFZyQWF0VTVtcjNZQmJXdTYyd1ZiL1V5?=
 =?utf-8?B?RHFtSVBmUDJWc3FaL0Z6dm1sRHRkWmN3QTUvbnRiUGhVQWc0RElZdlJjcmZB?=
 =?utf-8?B?ZWVKaW43RERmMkZ2aXMxaXN0c0UxazA4RGZ4bjhWVWxzbjY5cVhnUU1Pa1Q4?=
 =?utf-8?B?UEp6M3FCZGlCdkhmczRxcE55eWJDMEFCdmY3MHQ5RFg1ZlprVXkybmxNUVhj?=
 =?utf-8?B?WWRzeDlTS04weEhMOXJkRWtnVGFUc2NVWlJmbmQ1K0s5d2JlZjVjeDFkK1lV?=
 =?utf-8?B?M0JhMlgyS253S2NyOGQ2RlhoZklscnNpbDBPVk8zOThzSisrdzg0NittSmVr?=
 =?utf-8?B?UlJwUy9mK0RjOUdhY2sxdHpqc2l0dnNOV2hjSnU5ZExWV01naG9hN29kVm1s?=
 =?utf-8?B?aXY5ZGgreTJrNkMzYXZ5aWdNTHdBMEJNd0g5dFpJMjl2Z0JIZVFtQVR6ZGkv?=
 =?utf-8?B?alRDMkFEdFAyRUJMMFl2WG9YTUV5REppU3dlZ00vRnlEQ0pqUDFWOW1ZWWpV?=
 =?utf-8?B?cGh0bkUwSGNZUzZiQ1U5WjUrNU9vL2dmSlRxZUtjNjhTNFphcmtJWC93dlNG?=
 =?utf-8?B?Q2Z3QlM5OXd6K1Q1bXhDV01mdnJQK1VKUDlDWW5yZ1gza041cm0yNFJGM3RM?=
 =?utf-8?B?N0dFY2ZvdXlaSWlhZVBTM0ozcytSZldVbkpGdlJtUlNUVzVheGxpMmZRR1g4?=
 =?utf-8?B?Y1A5OFk0cTdZLzVGV0FKNHREbnJIQzRadDVQN0ZYcjNoekVlWTRIL0RXdENH?=
 =?utf-8?B?S2RsTFZkcVZOYkFLZFRGWWZzUWNVT09Kb3NTbFl0S3BudVBNUms3d3IwSGc3?=
 =?utf-8?B?RjJqVkcwNkVVNjk1eUliMjhrbTliaVhsbUlYSitORU0xQitWRHEydXo5bEU4?=
 =?utf-8?B?dlJJdGcxQm55TWNRZWJheUZ4NTk0Nk9OSEpmTUJSOEIwbWxoWUtGd0h4NU9l?=
 =?utf-8?B?MVNEU3dOV3BzdEtCc0xkeC9EbkI1ZEdoSWNKL0JVbzBiNzRmUytJOUkyMHNh?=
 =?utf-8?B?RlViTmRDNWZrdkVXNXE0cTZrRDg3QzhGV1NpMkEwTWNhMlVrNWpXNUNiZTlE?=
 =?utf-8?B?UDBQOXp6cDhaN1U3QkJDN0IyQnNZYmxCdlN0eUFUT2txRTdsb2Fuajd0ZGdN?=
 =?utf-8?B?VGZHVW5zM28xT0hoL1FmTnlHS2Y0WnpmbGJIendNSmdFTjBsOE5Qb1dqUU40?=
 =?utf-8?B?T0pOVXMvRE8weWg1T3BnNjUzYjlBL3BjeTlCc2phbkUzWE9NU1VZUm1OVXBX?=
 =?utf-8?B?emJWRkM3Y21JVngva295MmtUeFd0SnRJcDNrS1lmREpLaUs4eDAxYnh1SDJ4?=
 =?utf-8?B?TjBlTjUrNEpJZlpmdmhCK3k4N1pEeDFISW5CWkl6TCtoc2U4bXp5eHoySFJ3?=
 =?utf-8?B?bElLbG1icVBvRWZycS9zZGNmUGcreC9rbWh0clJUT3FmYnpRYUJRM0d4TTNv?=
 =?utf-8?B?L2t2aGVLVjI3MlVBbVBucWZWSldFVFpuTmpaU3p6NCs2NnBXRTRyR1htWWVM?=
 =?utf-8?B?dVFlbThBcWNUWXN4d1lvdHhtTnhZMkJoQXNvK0NiUmFOdC9lWmVZUmNRVUZs?=
 =?utf-8?B?T05sL0Y2WkNtamtYOUFmcnVDeXVSQUp6WkNxYms1bHFaaE5IbWJRUkd2eWlR?=
 =?utf-8?B?eTcxMGZaYXhYZE52SDh4R2Q5c2dLbkVUQ1VJTlMxdjB2L0E4VjkxWFdpdjB5?=
 =?utf-8?B?N0RxeEpvdVVyRlNkU2FESnRXYnp5QUpSL3RHemJsb0RPZXlaZzloa0hXSElM?=
 =?utf-8?B?ZUY0TjAwUlYxSEMvTllSWW5Lc212U0dSbGE5RkRXZXJQZmtkSWdKakg3Szda?=
 =?utf-8?B?elpnVzVzSUEzODFIYVMyM0RveW45NWxsUWtBUVNXUjljb0lOcGl6cU0rT081?=
 =?utf-8?B?QWZqTzdsTnEyYjRGRHErU09tdlNPVnh4UWhyRjRDY1hjZ3dKdWlPQVo1cG9q?=
 =?utf-8?B?QkNMSDUxWC9qSmllZXhWcUllQjh3a2ZFTGlOSXBnMDQ2ZG5oeUY1REdKUmp4?=
 =?utf-8?B?WWU3YXBuc3pBYmFHRHIwNG9lYWxXWGVyb0Z2MWNsN1hCZlllREwwT0hMMkpJ?=
 =?utf-8?B?SElxNHNGUVNBZm54T2NyTWJnUDYvRS9WZFJNZzZja05xMnk4bDUwcDczYmN3?=
 =?utf-8?B?aW9oUXpmelVTUTJ2K0pNd2JGT1JvVHNNbk1lMFRJRS9Pd2tPR3hCdERDeVZM?=
 =?utf-8?B?U240MVRuZWR4bEFDdjUwdlE4S1RuWE5SYkdSSE5wNUxLa3lrZnpYQzlyRGl1?=
 =?utf-8?B?UnpiMDBzSTZDdzAzNVdSTjZ3cjFBWmNKNEkrcTJYRWZWSmt3SGxUT3BhdWpp?=
 =?utf-8?B?Mkd3U3I0QzN6aktDQmlaMkliWFg2WDdGMjM3SjU2eklnUUo5V0pDZXhHd0pV?=
 =?utf-8?Q?/OEV83qdzFrPHfH/BPnnlxyqvJYqmDwiHUvP4Ee1ER07c?=
x-ms-exchange-antispam-messagedata-1: kbnfA/WdE+Ri5NyvGGCZFxesPDyZMw/+CbY=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0584C0982DEE6F4CBD75929E98BACB23@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e82a276-a48b-4c8f-8da5-08de75c81985
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2026 06:19:01.4936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EJ2HatTnTDCU2OuktFwGEc+b10dALNGZCPvEfbimc40OCI3QUtOiu8c1qJDe81xVOGd+a8xqer3E8GYjWBqLZ/Ok60lr3XHFXPnKBJFAOnw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF4990C6B9D
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jouni.hogander@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linux.intel.com,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:mid,intel.com:dkim,intel.com:email];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[jouni.hogander@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: D02011B3270
X-Rspamd-Action: no action

SGVsbG8gRFJNIE1haW50YWluZXJzLA0KDQpJIHdvdWxkIGxpa2UgdG8gbWVyZ2UgdGhpcyBwYXRj
aCB2aWEgZHJtLWludGVsL2RybS1pbnRlbC1uZXh0LiBJcyB0aGF0DQpvayB0byB5b3U/IFRoaXMg
aXMgYWRkaW5nIGRlZmluZSBpbnRvIGRybV9kcC5oIGhlYWRlciBmb3IgdGhlIG9ubHkNCnZhbHVl
IGxpc3RlZCBpbiBlRFAvRFAgc3BlYyBvbiBEUF9QQU5FTF9SRVBMQVlfQ0FQX1hfR1JBTlVMQVJJ
VFkNCnJlZ2lzdGVyLiBJJ20gdXNpbmcgdGhpcyBkZWZpbmUgdG8gZml4IGEgcHJvYmxlbSBpbiBv
dXIgUGFuZWwgUmVwbGF5DQpncmFudWxhcml0eSBkZXRlY3Rpb24gaW4gb3VyIHhlL2k5MTUgZGlz
cGxheSBkcml2ZXIuDQoNCkJSLA0KSm91bmkgSMO2Z2FuZGVyDQoNCk9uIFdlZCwgMjAyNi0wMi0y
NSBhdCAwOTo0MiArMDIwMCwgSm91bmkgSMO2Z2FuZGVyIHdyb3RlOg0KPiBEUCBzcGVjaWZpY2F0
aW9uIGlzIHNheWluZyB2YWx1ZSAweGZmIDB4ZmYgaW4gUEFORUwgUkVQTEFZIFNFTEVDVElWRQ0K
PiBVUERBVEUNCj4gWCBHUkFOVUxBUklUWSBDQVBBQklMSVRZIHJlZ2lzdGVycyAoMHhiMiBhbmQg
MHhiMykgbWVhbnMgZnVsbC1saW5lDQo+IGdyYW51bGFyaXR5LiBBZGQgZGVmaW5pdGlvbiBmb3Ig
dGhpcy4NCj4gDQo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IFNpZ25l
ZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJAaW50ZWwuY29tPg0KPiAt
LS0NCj4gwqBpbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oIHwgMiArKw0KPiDCoDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9k
aXNwbGF5L2RybV9kcC5oDQo+IGIvaW5jbHVkZS9kcm0vZGlzcGxheS9kcm1fZHAuaA0KPiBpbmRl
eCBlNGVlYmFiYWI5NzUuLjhiMTVkM2VlYjcxNiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0v
ZGlzcGxheS9kcm1fZHAuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oDQo+
IEBAIC01NzEsNiArNTcxLDggQEANCj4gwqAjIGRlZmluZQ0KPiBEUF9QQU5FTF9SRVBMQVlfTElO
S19PRkZfU1VQUE9SVEVEX0lOX1BSX0FGVEVSX0FEQVBUSVZFX1NZTkNfU0RQDQo+IAkoMSA8PCA3
KQ0KPiDCoA0KPiDCoCNkZWZpbmUgRFBfUEFORUxfUkVQTEFZX0NBUF9YX0dSQU5VTEFSSVRZCQkw
eGIyDQo+ICsjIGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfRlVMTF9MSU5FX0dSQU5VTEFSSVRZCQkw
eGZmZmYNCj4gKw0KPiDCoCNkZWZpbmUgRFBfUEFORUxfUkVQTEFZX0NBUF9ZX0dSQU5VTEFSSVRZ
CQkweGI0DQo+IMKgDQo+IMKgLyogTGluayBDb25maWd1cmF0aW9uICovDQoNCg==

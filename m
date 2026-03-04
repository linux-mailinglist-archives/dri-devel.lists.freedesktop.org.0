Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKDCF9MIqGnSnQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 11:26:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A871FE4F8
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 11:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F60810E9A3;
	Wed,  4 Mar 2026 10:26:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iN0gRe1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD1E10E9A1;
 Wed,  4 Mar 2026 10:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772619978; x=1804155978;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=J6B7wJ7KCAgz56Eo/CezYLArp+P3fF6/Kl5e7ooSI6Y=;
 b=iN0gRe1iGdD8FK7Vs4IwU3N8BruXK+y+SLnKdNJ8df9qRmuSVnLsuVJv
 yScfMlIr9gZeiaHRcrFmaKTQVwayz2TS347ss3Yre80Zqa6Vu+Mw+Nt6J
 44Hz0bQi5JmKfR1mBPVOk64jeKWRZ8DHm4tIhQC+C9ATOwqNUJjlYsibw
 tbp597lGpMtmGzE0rcuXvbkyxzsibUPiXOzP8jz9kfL9XGVkpanx+G+uE
 kSAwWmQ/g/MjG5ucY+nq75RBzGXvYGIRt05eUVbbohlwOdnMfHqG9NYJS
 bAHtgxehu005joXJciolW9oTizVKHzsEDdsGhJaDSFpVfRf0uauLYHl6t w==;
X-CSE-ConnectionGUID: S92ycIafSvKHmxezSn+Btg==
X-CSE-MsgGUID: O6bjlL7vQsqz3IL9G8UCOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="96287921"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="96287921"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 02:26:17 -0800
X-CSE-ConnectionGUID: TEZTx3WGRe6fi0YI7dJudQ==
X-CSE-MsgGUID: 47prUVfBSQeXBWfKYN0A6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; d="scan'208";a="215265516"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2026 02:26:17 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 02:26:16 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 4 Mar 2026 02:26:16 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.26) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 4 Mar 2026 02:26:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M79ye1y47qH1vla7rHYKcBFl2t2L8U9UfT7r71kgeGFtAMKCwTFMZBCcQPe8baVPq9Cy/hS1ccN7gAVEEXb0KaPEYsHdtosuZH7xzlKZh8WrT3yLomYMbttwvullbFDAwHFQqrKKo+Y7FcY5QT3jic9nKBI9qHpRkj7T/V/drkhH49OxQiBAbZsrN1nb3b2gSgqKO5wgLJgHVPuE2ed5DhxZ8numzoh6bBpayzslrm7DVHC3/1KlfPHYsEtCd154m9z/A8jcUZawVlrFZs25DpTPMQT/6ZqXU2jcDYQzSCvSrfk8ynqREbA3xu+vsaTccWzmaDEcD3MSAHi7eIt5QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6B7wJ7KCAgz56Eo/CezYLArp+P3fF6/Kl5e7ooSI6Y=;
 b=g5V8pQbMuMeEB98MJWx9RLdS3WC3fRL0FLxz6B7ol9tH5iV5KjsHrUxOdobBA1NZDR2+8lqx9Ug68ARBegXQ1O308uFGfGEZ/EC1oZL+gOgAAHhlsMPMMFWav1q5s226FMFDQDG/jIkCxOJ00eDxkOJb8KNzdr9abGgoNLDK4EWsSuymLA6pjTQsv5/GVIXhs7B3MQjuIJkKhuSxShD734XQFxCnBLsvZtQkW2OWIq0mF0JCc+j2/ddkWJReE7n/1RpPzXwTJE4nWUVYuuKLHhKiEbuASgiagLGLmYybFXLQHm55EdjAcFR5llewuKRk8K1cQovd3YU21UCBoEyNEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB6019.namprd11.prod.outlook.com (2603:10b6:8:60::5) by
 PH7PR11MB5885.namprd11.prod.outlook.com (2603:10b6:510:134::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 10:26:10 +0000
Received: from DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762]) by DM4PR11MB6019.namprd11.prod.outlook.com
 ([fe80::9086:5e0b:ad24:762%6]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 10:26:10 +0000
From: "Hogander, Jouni" <jouni.hogander@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/dp: Add definition for Panel Replay full-line
 granularity
Thread-Topic: [PATCH 1/2] drm/dp: Add definition for Panel Replay full-line
 granularity
Thread-Index: AQHcpipTwbOSHXU0dUWsHDoCApMvP7WVehyAgACTHACACAiegIAAIHeA
Date: Wed, 4 Mar 2026 10:26:10 +0000
Message-ID: <091a8e15c32ab6bb73964d4f6fabe9fd896e5608.camel@intel.com>
References: <20260225074221.1744330-1-jouni.hogander@intel.com>
 <DM4PR11MB63607DE2CD6A445F51C9925DF472A@DM4PR11MB6360.namprd11.prod.outlook.com>
 <f84e9e8b9147cabfd86996c6d81d9767668db949.camel@intel.com>
 <77e5ca2b-7473-44d1-ba4b-8a301adcd788@linux.intel.com>
In-Reply-To: <77e5ca2b-7473-44d1-ba4b-8a301adcd788@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB6019:EE_|PH7PR11MB5885:EE_
x-ms-office365-filtering-correlation-id: 1cee29ea-fd88-4db0-bbc8-08de79d8742f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: L9GvsrxsrY4GC21mP2YiM1yfAK8iKuH+rHVvWRDw9+AglOF2tQXV2d8gV/4nr2xmcJETeMZKCab8zl/vmW7BY4XQ6Agb6JwloOFn+y2cbdhm7X3HL0ndy9JYVlY3IQ0cl8Y5DFsTJ+pZSt39pT64dn3gkUQldD+XoOmmcCAx72czFKoNDaRtdWH7XvvZlHsN8/nfIeOevkyeb3FZkVovr1ZvsXrU+/HJlqgPtk7Mf+glibmRzEbIo8vlmVPyrIPAmTNoBua8ho2/Ts5gzY0oEvsdUf4ABjU2JDNQnxeKBpp84IKvkWe0lLVc5zlHy5D+G6Z+4xMZHu0A/PCW+1G/WWnOMYuCvuK82XlUl3tYURxqWqF7lmz+Wj3w6nUeyjeyVXKO1qGBRlHHq1GsxMzLuiJiwBry2WwD3XTmeK/U7/0oplQ7teytgF0HoTJcaoPH0BTW1HURlzCze2Fz1pNXHjuk3YZgWI90A6MJGoLKicg7fPOGwOf5mq9VNEHsK5FUAqzJVF7iM5lK02fSx/uLNTpZqnpcGTlVF7+DLE0AxCrm1SmgPf7aQRcJ6i3Wsb/oNuWSV1rV63A+3Zlro2GRa50DN/nQzmoKuFKN5XkMixtIjfyxeeLD/rcqEPOONM/PIto4cEgYpGp6X4fD+FMug9vmcwO/qA2rk9S9GwwcXW6Q3rRKsvjKozPF8kQ7oUZmCdHb/8+05QXvnVZtSK6WlgkFdlWX4qL83B2hyMYw5SKiu87uquiIwdXo5MOnhbVReOcMNJ6ms6L+S8fmopTOWApwIlyM1YaQp3hXUPJPTk8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB6019.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dWJkZ3ljU1VSVlg2cmVyNlI1QWNMeTVHWGtIN0p3bkNuZGpXdmlKZmVXNVl1?=
 =?utf-8?B?VjdodGJtSXZLaEhMNTdKdC9FSDJ5VWY0ZUlIU0JXRDNpbVJwQkFJNmNHWFNn?=
 =?utf-8?B?Z2RxVThYUmZkdVZtdWZaZ0wrREpaeVZ5aTYrb0JKdXpVZnFtbDZMWkFXNWxT?=
 =?utf-8?B?azlwNWhxUTN1M0hkMEoyUkdMN1JYN2JUVStpWXJRRHEzVFJmSGYvRXNPbjdP?=
 =?utf-8?B?MUg2TEhWWC9SeDBaTTlYY1FNWUFGN0ttd3hrOUJJbzhLcTBKanZISXMzSzRa?=
 =?utf-8?B?R2k0ajI5ekdHQkhLbllyYmxObFpndXFlb0FKMEx6NlhjMWhqcTZLTkJtUkY0?=
 =?utf-8?B?K1ZtakwyMkNScVFuMW5UaHZhYmdUS0hJWUx1WHJQeXN5d3VKMmE5L0svQi9q?=
 =?utf-8?B?ckpHalJRY2VBYnloZmY0WjVoaWE1U0JveEFsV1BBRzd2N05WeGppOXVqc3p1?=
 =?utf-8?B?Vzc0YkU0TWpjMmdCYzlqeFlxUG1laHh5ckNxMjZ6dktvYmNyV2F3NG8xcm1z?=
 =?utf-8?B?WXg2V0pBdG5PVnFVT1poNnhpWW1TcFNoTkhYVEpCNUphYUlpeTlsTWhUdzJn?=
 =?utf-8?B?TWhScHFtcm9qZDhMRGt6c0dxR2hnV1F6RlA3TjVHZmlVYVFPeENiK1NrQ1Q3?=
 =?utf-8?B?UWhPMzU1ejdsakxldm95WE1zV3B0Vm93cG5pTGVOUExnWS9MNm1aazZTaDFH?=
 =?utf-8?B?NlNUbTdjTUxScjZ3RzBjdFk5dTVZOTRiQXRLRCs4WEUyaWtUYldmeXorQzZm?=
 =?utf-8?B?cXdtVlFpSzVsMzR6aEFCR2NaSnppR2lvb25XNTBrS2ZVUTBaYzE3MmZ5cXMv?=
 =?utf-8?B?SkYrcldCWlFUblZMd3doWVJjejgwMFVKeURNdGJkMUI2Y1VBQ2xaa1FFOUw0?=
 =?utf-8?B?Zi81NzJHMUdKVUhEYXk2RzdNOWdKbEJRTkJ6bjFJSVNldW14a0N1QTVTTldF?=
 =?utf-8?B?S0ZrS2xUM1ZvSThKWWdPUzVqMytSbDkwdFJyaVVuTzVCVnkvYkZvS0htQ1Iy?=
 =?utf-8?B?K2tDai92M25kVEI3NWZyem5VV20vS2Q4Zys4ZDdTNlZ5NXVTczVKQTZHZzk3?=
 =?utf-8?B?elJ2TWo0UkVvL0QvS0RSbTNHWlR3UndiZmhVYnFXNVV2TTJkTXhJckMvNWNG?=
 =?utf-8?B?NkVKYXV1ZlEyajVSaTJrc21rdU5TZS9zbDkvdmhNTkpnNW1kNDhTdVd6NmI4?=
 =?utf-8?B?eVoyaDQ5Nyt2U0liSzk2R1psWDF2ZmZ3bTJESWVZbDVQQXdNKzF4bU4vUXJO?=
 =?utf-8?B?VDRVUlo0TzA3ZWx3RWNpbFNIRVdnQkJHcFVVSFdrZlp1L2ZnRlBmS0VPMVhl?=
 =?utf-8?B?d3MxZDhjeXQ3d2llQzh6bVlRb0cxZ254cHlvVEcvUU8vU0UzWTRqQzlpZ1Vn?=
 =?utf-8?B?U0p1TlBYN05DZ29MTC8rSmtLT3E5dWVEOVk3dUtxaDlOYUsrd3JOS0ZoUEM2?=
 =?utf-8?B?M1lPaWh6QU8rcGtNL1lVdU52RTROMHpNKzNISy8xL3hFVi9XVldpaENRZ3BW?=
 =?utf-8?B?UXk3TmxVTlM0ODI4bklaVUo3SkhTc1RiVU9RcmUxYzJBWFF1N0V5SkRUdTA2?=
 =?utf-8?B?dzVSTDZjMktiOW5KUFRxalR6bFN5UjhuV1dvSVFpLzFsRUJaalE2M0lBQWNw?=
 =?utf-8?B?VVdZQU03dnUwTjB1dndLb1VTUHlKVUd3VUNONzRFZWc1MU5MM0kxaVU1V1NG?=
 =?utf-8?B?MHgzNnZJNzUrRHNUT2tGbW1rZ1FBZFg2d2NvNDZuOGZnYWQ5MGZoRHBFMFVY?=
 =?utf-8?B?YXZJVzF3UXdIR0lmVmVuQVdQRlZOazhQRW53TFdWVW9KM1RQWlE2c2VXWStK?=
 =?utf-8?B?Q1FFUVpTeHByRVhBdGxHdVQrSkd4dCt1c29tZGFMOTlMMG5HaGF4N1orcGNP?=
 =?utf-8?B?ZkpYSGtTeWpUYTArMXpXQVh3STdEbnk2enZtNDErRjNMU0dVTjlGNTFoUXBt?=
 =?utf-8?B?TGtPSW9sTXRqYjU0L2k2MGJISjdscGJRVkZFK1JIalY5ZVlyeDZlSERKN2dr?=
 =?utf-8?B?Z2hHbzB6YThRVjFIeE05emJrR2V6eS9yclVFYlJXeE5sV3JUandBTnNaOXNT?=
 =?utf-8?B?a2dyL1ltR1V4ZlNqRmxld1dQWmpRSWRHbWJBUWdIcUtaL1ZocDhoLzBIK3dv?=
 =?utf-8?B?WGkzUWs0UUF0VW1obWJFeUV4TmtDL0JpSFRjUXRKRjVyNDZ3OHdGcExPTjNj?=
 =?utf-8?B?L2FCc3krWnVUMGx0azY1ZHp2QXRKMVErMW5GWmdSMlRpdXBCN2VTTm5rS0Zp?=
 =?utf-8?B?U01icVVybU9aUDBuV1VZcWNJWDk4elUyYnJOUUhydld5UFJ5MDgrWHZWVzNL?=
 =?utf-8?B?Zk1TWDRmQjl1NkphYVpudldPZ1hFcTgzVFpvRGorRUlDaDNNekdDMGlSdmdl?=
 =?utf-8?Q?Gi6oN/55fAuPz7vwjImPNo51BfQTR+i1CCEhg+iOgvmiX?=
x-ms-exchange-antispam-messagedata-1: EDvjd7sIcIfqQIkK/pIum4Mb6sl5hylFozI=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2BAF0A24E054504CA8410FCE34A5AB77@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: uOcxG6YVG3/MTakbXIMgl4mQJ0zf+nGPnq+i6NX0qxMribwBQir1dwWB9TUND5yamMNEX2k9S1H5E4UhLi8KgnNtnpxQyv5tL/Y2DzxbYjluxoQMBxPlDuf3wUTMKfL4YC6IxMGFOxMLkhLptX8X/dLJwQnl49OcjBcUcLgalJmPukuuUcQ82SgH2gWuZFeMEz+cQ0KSrDzqPQC/9y1HLC88Vf8kFG5UZ1bbTuJ3EQlieKOhjpxkFuGKV2D68/q94W5ZYMSLKR3Eh02YUWdluKDT/dkhzYwX7jDVW5+xmtCwnQC1ikO7goBedyAZu9Qq8iuO1uvk+jO8EMTfzbj/WA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB6019.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cee29ea-fd88-4db0-bbc8-08de79d8742f
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2026 10:26:10.1969 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2cvyk0lWG51Ph3hModCgh/QzlWfvpoG2nf6pkU9kLXhggtws3CtAxX7byt0PsD3JtoXwVh1IKwt0e38T/XXeAOH+uiTZ69bCONQQ6G5Ymdg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5885
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
X-Rspamd-Queue-Id: B9A871FE4F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.51 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:?];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:mid,intel.com:email,lists.freedesktop.org:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	RCPT_COUNT_FIVE(0.00)[5];
	DMARC_DNSFAIL(0.00)[intel.com : SPF/DKIM temp error,none];
	FROM_NEQ_ENVFROM(0.00)[jouni.hogander@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.990];
	R_DKIM_TEMPFAIL(0.00)[intel.com:s=Intel];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

VGhhbmsgeW91IE1hYXJ0ZW4uIFRoZXNlIHBhdGNoZXMgYXJlIG5vdyBwdXNoZWQgdG8gZHJtLWlu
dGVsLW5leHQuDQpUaGFuayB5b3UgVW1hIGZvciB0aGUgcmV2aWV3Lg0KDQpCUiwNCkpvdW5pIEjD
tmdhbmRlcg0KDQpPbiBXZWQsIDIwMjYtMDMtMDQgYXQgMDk6MjkgKzAxMDAsIE1hYXJ0ZW4gTGFu
a2hvcnN0IHdyb3RlOg0KPiBIZXksDQo+IA0KPiBEZW4gMjAyNi0wMi0yNyBrbC4gMDY6NDksIHNr
cmV2IEhvZ2FuZGVyLCBKb3VuaToNCj4gPiBPbiBUaHUsIDIwMjYtMDItMjYgYXQgMjE6MDIgKzAw
MDAsIFNoYW5rYXIsIFVtYSB3cm90ZToNCj4gPiA+IA0KPiA+ID4gDQo+ID4gPiA+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiA+IEZyb206IEludGVsLXhlIDxpbnRlbC14ZS1ib3Vu
Y2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24NCj4gPiA+ID4gQmVoYWxmDQo+ID4gPiA+IE9m
IEpvdW5pDQo+ID4gPiA+IEjDtmdhbmRlcg0KPiA+ID4gPiBTZW50OiBXZWRuZXNkYXksIEZlYnJ1
YXJ5IDI1LCAyMDI2IDE6MTIgUE0NCj4gPiA+ID4gVG86IGludGVsLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7DQo+ID4gPiA+IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiA+ID4g
PiBDYzogSG9nYW5kZXIsIEpvdW5pIDxqb3VuaS5ob2dhbmRlckBpbnRlbC5jb20+Ow0KPiA+ID4g
PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gPiA+IFN1YmplY3Q6IFtQQVRD
SCAxLzJdIGRybS9kcDogQWRkIGRlZmluaXRpb24gZm9yIFBhbmVsIFJlcGxheQ0KPiA+ID4gPiBm
dWxsLQ0KPiA+ID4gPiBsaW5lIGdyYW51bGFyaXR5DQo+ID4gPiA+IA0KPiA+ID4gPiBEUCBzcGVj
aWZpY2F0aW9uIGlzIHNheWluZyB2YWx1ZSAweGZmIDB4ZmYgaW4gUEFORUwgUkVQTEFZDQo+ID4g
PiA+IFNFTEVDVElWRQ0KPiA+ID4gPiBVUERBVEUgWCBHUkFOVUxBUklUWSBDQVBBQklMSVRZIHJl
Z2lzdGVycyAoMHhiMiBhbmQgMHhiMykgbWVhbnMNCj4gPiA+ID4gZnVsbC0NCj4gPiA+ID4gbGlu
ZSBncmFudWxhcml0eS4gQWRkIGRlZmluaXRpb24gZm9yIHRoaXMuDQo+ID4gPiANCj4gPiA+IEkg
dGhpbmsgaXQgd291bGQgYmUgZ29vZCB0byBjYWxsIHRoaXMgYWxzbyBvdXQgYWxzbyBpbiBjb21t
ZW50Og0KPiA+ID4gIlRoZSBTVSByZWdpb24gd2lkdGggc2hhbGwgYmUgZXF1YWwgdG8gdGhlIGhv
cml6b250YWwgd2lkdGggb2YNCj4gPiA+IHRoZQ0KPiA+ID4gdGltaW5nIGJlaW5nIHRyYW5zcG9y
dGVkIg0KPiA+ID4gVGhpcyBjbGFyaWZpZXMgd2hhdCBpcyBtZWFudCBieSBmdWxsIGxpbmUgZ3Jh
bnVsYXJpdHkgaGVyZS4NCj4gPiANCj4gPiBJIHdpbGwgYWRkIHRoaXMgY29tbWVudC4NCj4gPiAN
Cj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcNCj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogSm91bmkgSMO2Z2FuZGVyIDxqb3VuaS5ob2dh
bmRlckBpbnRlbC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiDCoGluY2x1ZGUvZHJtL2Rpc3Bs
YXkvZHJtX2RwLmggfCAyICsrDQo+ID4gPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQ0KPiA+ID4gPiANCj4gPiA+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Rpc3BsYXkv
ZHJtX2RwLmgNCj4gPiA+ID4gYi9pbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oIGluZGV4DQo+
ID4gPiA+IGU0ZWViYWJhYjk3NS4uOGIxNWQzZWViNzE2IDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9p
bmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcC5oDQo+ID4gPiA+ICsrKyBiL2luY2x1ZGUvZHJtL2Rp
c3BsYXkvZHJtX2RwLmgNCj4gPiA+ID4gQEAgLTU3MSw2ICs1NzEsOCBAQA0KPiA+ID4gPiDCoCMg
ZGVmaW5lDQo+ID4gPiA+IERQX1BBTkVMX1JFUExBWV9MSU5LX09GRl9TVVBQT1JURURfSU5fUFJf
QUZURVJfQURBUFRJVkVfU1lODQo+ID4gPiA+IENfU0RQCSgxIDw8IDcpDQo+ID4gPiA+IA0KPiA+
ID4gPiDCoCNkZWZpbmUgRFBfUEFORUxfUkVQTEFZX0NBUF9YX0dSQU5VTEFSSVRZCQkweGIyDQo+
ID4gPiA+ICsjIGRlZmluZSBEUF9QQU5FTF9SRVBMQVlfRlVMTF9MSU5FX0dSQU5VTEFSSVRZCQkw
eGZmZmYNCj4gPiA+IA0KPiA+ID4gU3BhY2UgaW4gI2RlZmluZSBjYW4gYmUgcmVtb3ZlZC4NCj4g
PiANCj4gPiBJIGZvbGxvd2VkIGNvbnZlbnRpb24gdXNlZCBlbHNld2hlcmUgaW4gZHJtX2RwLmgu
IEkuZS4gcmVnaXN0ZXINCj4gPiBmaWVsZA0KPiA+IGRlZmluaXRpb25zIGhhdmUgdGhpcyBleHRy
YSBzcGFjZS4gV2hhdCBkbyB5b3UgdGhpbms/DQo+ID4gDQo+ID4gQlIsDQo+ID4gSm91bmkgSMO2
Z2FuZGVyDQo+IFNlZW1zIHRvIGJlIHRoZSBjb252ZW50aW9uIGhlcmUsIHNvIGZpbmUgd2l0aCBt
ZS4NCj4gDQo+IEZvciBtZXJnaW5nIHRocm91Z2ggZHJtLWludGVsOg0KPiBBY2tlZC1ieTogTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4gDQo+
ID4gPiANCj4gPiA+IFdpdGggYWJvdmUgZml4ZWQsIENoYW5nZSBsb29rcyBnb29kIHRvIG1lLg0K
PiA+ID4gUmV2aWV3ZWQtYnk6IFVtYSBTaGFua2FyIDx1bWEuc2hhbmthckBpbnRlbC5jb20+DQo+
ID4gPiANCj4gPiA+ID4gwqAjZGVmaW5lIERQX1BBTkVMX1JFUExBWV9DQVBfWV9HUkFOVUxBUklU
WQkJMHhiNA0KPiA+ID4gPiANCj4gPiA+ID4gwqAvKiBMaW5rIENvbmZpZ3VyYXRpb24gKi8NCj4g
PiA+ID4gLS0NCj4gPiA+ID4gMi40My4wDQo+ID4gPiANCj4gPiANCj4gDQoNCg==

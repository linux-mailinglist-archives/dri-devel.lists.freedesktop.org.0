Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBZPLrZnhWknBQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 05:01:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AC1F9E44
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 05:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E248E10E303;
	Fri,  6 Feb 2026 04:01:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wDSBK/eu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013067.outbound.protection.outlook.com
 [40.93.196.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690E210E29E;
 Fri,  6 Feb 2026 04:01:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nt+7fl9HGGMPmDRf7/FdsD4zZ1kyAtLVBgBV9MvA3nv80qp6i1CMLTDFGe1p4noOLCedd64plEfq6vknCwu5GEpX5Wb4ss+b40kwPaMZj8Yhe2Kz7fY3hlvt7vjFcLAYPx4IjYVpcOmERye1HewY0zkRe6kejTMiEVEDpGPVdLwYW2QViKafHLtcuQRBTqVJD7K+q70STvMXkHUMsRyxbZ9O5bxYzS7mUcRAGe35prdnfwfYhwlzxvgyoUM24kuNYaJPG4I1x9Niphm8oOQJ5eXB2b1wB5RpqdLiOzbzPhKyfpHenjsiopGxslqYJyugGWrnj4wd4WvQ4riKcK/bFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4WaEoMxGKTlP/obeqgVOcqOYKfq3BhfWa6SHBQ07u8=;
 b=MABo4BB5rQJ5HAlwayFDo6uEGSuo/hxcOcwE2gkS8cgXp8g0SNGl1aJFnR0VZkv0b8PYc7z+2g9NRiBci9bgjsaCkTHYqN2VAr1znFyp7h0645Jpuwl6LPQLEh9TGESqnIwcSycvqHTcuNS9oH2ILu9joay0LNSQEonC9SaqXasXlN0K+qGO7affc3RDau1EzEGoG8ZOjD8ReBvoCQePLqopXaKwPekp6zxYQL+xffnTVy/amzRMd5iMjTnZfp1UVxNbZKzpFzzXvNAKppqrHa1MZ4DYy7kQdatmAYU+aSd2PQsl+B5y0jZkHYclhQnRqvjuKFzzedjGwwh2FhAJLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4WaEoMxGKTlP/obeqgVOcqOYKfq3BhfWa6SHBQ07u8=;
 b=wDSBK/euWLlXco3CIMP3sPHr43YpMSzq0c0Ha0/HkpEePu17VIsbyLdgnlBelorN0F4bbvU4CMNgM5a8K84iSQArcMlMsHnbO8zoJLr3SVxVlxBGDPumGkYlAkIf2Vfim8xLFnnta8Lw1P6AqnFclbtzmULjhbrQxKX89goXoGg=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 04:01:48 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::c1d5:bb14:abc3:7fd1]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::c1d5:bb14:abc3:7fd1%3]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 04:01:48 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>
CC: "Koenig, Christian" <Christian.Koenig@amd.com>
Subject: Re: [PATCH] drm/amd/display: guard NULL manual-trigger callback in
 cursor programming
Thread-Topic: [PATCH] drm/amd/display: guard NULL manual-trigger callback in
 cursor programming
Thread-Index: AQHclwdt6/rB8ysVwE6CNF2nMTijN7V1DF9t
Date: Fri, 6 Feb 2026 04:01:48 +0000
Message-ID: <CH0PR12MB52844942C4F366C072C6B8A48B66A@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <20260206012447.105684-1-vitaly.prosyak@amd.com>
In-Reply-To: <20260206012447.105684-1-vitaly.prosyak@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2026-02-06T04:01:47.558Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=1;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|DS7PR12MB6237:EE_
x-ms-office365-filtering-correlation-id: ba25ba79-45eb-4d72-b0e4-08de65347363
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|7053199007|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?ZTn7OQ4XQPEnpsqyri3MRMhKexHcnqO6x1T+iJXs3+8h66zh0mA8qKJ28QdD?=
 =?us-ascii?Q?hRlG3Ok9xQPn4slvDqhloYYS9YG9mIXrz71C7ueQs6+kBsOIBesVpnCrrIxd?=
 =?us-ascii?Q?yCR97uJ8M7wF+AMZShD8dFxlx/HyDOE0VIGaJAbHeSGiltszKRS3CWa614cC?=
 =?us-ascii?Q?rT+tPUrxI2m5dw6ME0U+xLGvvjBdMAdws0seZAC50m3P6yfbl+r0tlFqH6Wd?=
 =?us-ascii?Q?s30OheT5WOO4rE0eSmaH4K1IlOhzwA/bP5ARvuDaAnz4JMGUFvWzkqqI+qd7?=
 =?us-ascii?Q?CY019SQ82KzZxW39xNbLQkwBYsXmkS0/Tr1e8+2J4H2gwoXQV8afnLXMi05t?=
 =?us-ascii?Q?XhiMMi0mwsZ+EYEQc9NxZIjWN7pK0xs2B/CoERPduyvzANAwFgHhPCTad8s3?=
 =?us-ascii?Q?T5V5zO4LRXJYTtEED5s+r/gix7Vjcku0ufZgTF7Q51fbYYAaRLx8pm4RTStR?=
 =?us-ascii?Q?D44obyBUl+8p+KcWqj6On+c2Rre/6LFQkX/5c/eNChrzctJX72GHNwRaTU91?=
 =?us-ascii?Q?H7gI0Ky8jd/8e0oZ3bJXlOgxbKPISnduYd6+qpH06KuUnQqmTAKpL55T9zcF?=
 =?us-ascii?Q?rEyDSycSCKWN+kDuVHY+FRh4u/FFLaZ2smf0iQuCphtPabPNpUyTyvkFfxQO?=
 =?us-ascii?Q?liSez7zBxWy20Le13rTp9tUMrtMB3g4ajeIk5cguslrjaJPEIGdM0GXi6KVy?=
 =?us-ascii?Q?cV1DBCh88tRKfEM+u7ctgm+eSoI9NvsdnnzaxaTL8vB25HYqWmk/8tU+53Gr?=
 =?us-ascii?Q?gi/fzX4B68NAIGNcCq7pOpe5PqApmdUYGvdsQQklZwim/JIDJWRLqdg2JKzE?=
 =?us-ascii?Q?QMZUlz5u9Z4eKNlyHUcxpETNxNWrLPrvJ3QKnlDHkIgWtvLyfwxvBzrAsSgn?=
 =?us-ascii?Q?CEvA95iNF53UcPCtJY7rKjyGqBfaXOFeYJxLKK4abCZTkEXrHpmQR5ZBBMJO?=
 =?us-ascii?Q?k5C9QeqT0UuNoiks8r8ADI7mkAjGK3gPYHfmzdQ5l8PEaT6FeY/YsPHDKQ+Z?=
 =?us-ascii?Q?ylHzE/SPhsAccBKfa9yFtl4QNSZjhk9DGLVxuqOvs3Wiuetjj1PbptQDw67u?=
 =?us-ascii?Q?cLIGT0EBRCkKVXdzP5dYXKOsoM3Hp2APzAlkXQHYK8BEEvPs+1zctTFbjJQ7?=
 =?us-ascii?Q?ZgbDUxVXWu9gD6vkRXJJCG6kMHFMgCNQ0LSrvN66YroUR+7S5DznC7AkYS0r?=
 =?us-ascii?Q?GR79KNXSvkVsnErB7ow7owoIXpkC9Yl5RIebZPZ8inirxUoFI+nZWKMiCX1v?=
 =?us-ascii?Q?w4FpJm6UCmDKyj0ty7ATWYwd+Ui1D2iS5LyQAV3sRiq5rvsDiLJ3b7XmEFcS?=
 =?us-ascii?Q?P29FuQ9zb9gYGfXTpGqTo9USjwdG23dM2LcO1RKYD/GUEqHf8IdBgEQ/ThA5?=
 =?us-ascii?Q?UtpFFmIWJX0R+K+cVnTqeDpsPrQAYfPUq6faNW2hU8+nQ7URgEvJl/eSiBaF?=
 =?us-ascii?Q?HpG7GZrrPRb80toPlnycqqDAd1j8INqncXhfXEObwGHtmFTMWvkygNz+LZZH?=
 =?us-ascii?Q?jKIomHQFgSeQmxDgqq/ou8ZiOiLw4hfrh07ntcf5V2vDVOr6wxNl/3ZhXWq7?=
 =?us-ascii?Q?uQ/pvbKpEpf7Sl9K+0K2mJLnGtMCdPIYDZ2PlByhK+1A8s5cyMfanoiQ41d/?=
 =?us-ascii?Q?eUeXe0jXp5RXMWOF3aZHdN0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(7053199007)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KbrYhUwN5xc8EO8ZHQsZe7SmLCPNn0uKgv72yQO+4fu6BvHhDOB5+WkLWWIm?=
 =?us-ascii?Q?p5yeo9nPqto/oW7mdc1ukBbk/QbEKThf4DzJ2Jyg1B/Oimh4BMLyGwpkW8z5?=
 =?us-ascii?Q?3PY5AeQMKi9YGRT8ejYvDs43FdCf7c6uwWjQpQIn0LiC+Wlg5Z5l0oKeciRU?=
 =?us-ascii?Q?lGHk49ZNH+FnpCzAXubZO9xah6l7TYKYtGFIEh/rOAyduMIhU0Hajcivi1DW?=
 =?us-ascii?Q?6ERa5yz7Ir0wR4utYv/uBAS0XMhg2rmoAeWwyV5pG9OgSG7UQy8WYFqCv77Y?=
 =?us-ascii?Q?qZkqYGBoeDioaZQiRmisCE1upX2QzOATaFOeOabgob1ULs7VH2pW73LasHSa?=
 =?us-ascii?Q?JBPoxDautJ6efOIIkuzqjYA7uyD6jypB8QoM1ct7dZL2cHr2WOvtsdgD8ya3?=
 =?us-ascii?Q?Zmyh0fsmmxalZqjZBPc4cAnVF+lmIjELzwbTZaLl34CfrTiljHErhoxZ1zrO?=
 =?us-ascii?Q?5ymRyjGt2xlCT6GExIb2am2P4Ev2DUYpdrtCw9dsICCvbsmHn6yV2gT0yREJ?=
 =?us-ascii?Q?vOppPI+hvHnX5I3ZAfS8I6IibE8NSCRCd2K5chvxwfjvck3juFCkviYGIaqL?=
 =?us-ascii?Q?78sMPOUcawDQKXmRqyC8YFpow/dOIejneJ8CImtkqYTNdQoG/qDc4cKRLpls?=
 =?us-ascii?Q?eE3V5mcskax517+vQCrYqzQRxiTbIBIyUdpIiWeqfxX+HCIN7uljN7zOjGvk?=
 =?us-ascii?Q?/ylDUIEjAU3x4lU2exJt6hfqQRHsVj6ooKFKWF6ZT01rQ1ZBpz/ZU20K+EEq?=
 =?us-ascii?Q?4yEjDm7JpbiW3zaUxHqtMBY8kYhoWNWeTsWWJfqN4q+0GytbH6PeXpLAkUWL?=
 =?us-ascii?Q?zoEdEcEJTXT1XF/y2gx98FlyTw5d38nCEYXPJAYHxEBmapMrWnvxMZhOLFDY?=
 =?us-ascii?Q?9jW9uLLAlGGpjBVp7XAFtpz/YttpnnywCTD2W+efwLG6yRtCDMUhlpbXyqup?=
 =?us-ascii?Q?fHTobrvNqKyfAw7mzba5WG9il73mUwhWNmjNTw4mlBjiOYXszPK2HpPSRIp4?=
 =?us-ascii?Q?2Cp4Fz6uEskfEniyZrlqNtMs/BD53X6A9oVKvKUDPPyQ11t5cpkDF+6qGeSa?=
 =?us-ascii?Q?6ZbcJwuVXeeNfhuImYuZCyYH/aK5KUjLQYni3ej7gj8WfdOmKUSnfY8lz4Zj?=
 =?us-ascii?Q?CHoDpRiGugMPDqh24ai0+7izYAQ5maD2jGohl2f1cJ/mit/LRwRRo7b0CSEn?=
 =?us-ascii?Q?MbuwW2Osc4L0fyC7hlbVGagV48k9qksAbu9rC4WGXJzuRH0fxX3/uee6Lwv9?=
 =?us-ascii?Q?SfJhmNvssvtDwmn1AdPQ2qSOSRjJK1XNME+Kf0gRM5OHvSgOhECD0Th8YUj6?=
 =?us-ascii?Q?7eeaXShfotDKg/KrhTGrGT7HT3ENgBA4NDFUZ4dvMZQ9Ex66hDMkBvaXl3MG?=
 =?us-ascii?Q?3h8m+TA1Xg89OhBJemRTHlWjFRHEYurccnmNGrPIfFcNUd6DteOnoCRdFHlz?=
 =?us-ascii?Q?qDWq8CYy1SeZRTx5UW3BFtDzz04ivzxOTLS+MMYaqb+2VOet3QSFHn1s4oue?=
 =?us-ascii?Q?gQLRDUpceefsYJCmvdsFWcfaKcV9VrFSbxbi8LjG5XAMf+MQrslMwjkYfhrl?=
 =?us-ascii?Q?biLHfLw4lrS8tkOe241oa+pB66hkx9uLrkRorNwUFrVJRJK4/0kb4MY6gVfa?=
 =?us-ascii?Q?qjlKlB17EcjgfohMhIYA9AuvC7NZK03CUx2sO5EbSmpx0WWincj8hp8ufy7f?=
 =?us-ascii?Q?DAdtApV9mftK1o7YXsSOxA4szx2umIdRk3lS6haXu55TDkzH?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB52844942C4F366C072C6B8A48B66ACH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba25ba79-45eb-4d72-b0e4-08de65347363
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2026 04:01:48.1321 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 49dgk4X1ilAuoWRinm4h0t9Wz00LyOoabpYOI0KH8NdceoLpoNriHtWf2zNLHdTaC4ZFUSxHHSAOvAabDRmxcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6237
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[Aurabindo.Pillai@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,CH0PR12MB5284.namprd12.prod.outlook.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 68AC1F9E44
X-Rspamd-Action: no action

--_000_CH0PR12MB52844942C4F366C072C6B8A48B66ACH0PR12MB5284namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

Reviewed-by: Aurabindo Pillai <aurabindo.pillai@amd.com>

--

Regards,
Jay
________________________________
From: vitaly.prosyak@amd.com <vitaly.prosyak@amd.com>
Sent: Thursday, February 5, 2026 8:24 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; Deucher, Alexand=
er <Alexander.Deucher@amd.com>
Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Pillai, Aurabindo <Aurabindo.=
Pillai@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>
Subject: [PATCH] drm/amd/display: guard NULL manual-trigger callback in cur=
sor programming

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

KASAN reports a NULL instruction fetch (RIP=3D0x0) from
dc_stream_program_cursor_position():

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:0x0
  Call Trace:
    dc_stream_program_cursor_position+0x344/0x920 [amdgpu]
    amdgpu_dm_atomic_commit_tail+...

[  +1.041013] BUG: kernel NULL pointer dereference, address: 00000000000000=
00
[  +0.000027] #PF: supervisor instruction fetch in kernel mode
[  +0.000013] #PF: error_code(0x0010) - not-present page
[  +0.000012] PGD 0 P4D 0
[  +0.000017] Oops: Oops: 0010 [#1] SMP KASAN NOPTI
[  +0.000017] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Tainted: G           =
 E       6.18.0+ #3 PREEMPT(voluntary)
[  +0.000023] Tainted: [E]=3DUNSIGNED_MODULE
[  +0.000010] Hardware name: ASUS System Product Name/ROG STRIX B550-F GAMI=
NG (WI-FI), BIOS 1401 12/03/2020
[  +0.000016] Workqueue: events drm_mode_rmfb_work_fn
[  +0.000022] RIP: 0010:0x0
[  +0.000017] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
[  +0.000015] RSP: 0018:ffffc9000017f4c8 EFLAGS: 00010246
[  +0.000016] RAX: 0000000000000000 RBX: ffff88810afdda80 RCX: 1ffff1104570=
00d1
[  +0.000014] RDX: 1ffffffff87b75bd RSI: 0000000000000000 RDI: ffff88810afd=
da80
[  +0.000014] RBP: ffffc9000017f538 R08: 0000000000000000 R09: ffff88822b80=
0690
[  +0.000013] R10: 0000000000000000 R11: 0000000000000000 R12: ffffffffc3db=
ac20
[  +0.000014] R13: 0000000000000000 R14: ffff88811ab80000 R15: dffffc000000=
0000
[  +0.000014] FS:  0000000000000000(0000) GS:ffff888434599000(0000) knlGS:0=
000000000000000
[  +0.000015] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0.000013] CR2: ffffffffffffffd6 CR3: 000000010ee88000 CR4: 000000000035=
0ef0
[  +0.000014] Call Trace:
[  +0.000010]  <TASK>
[  +0.000010]  dc_stream_program_cursor_position+0x344/0x920 [amdgpu]
[  +0.001086]  ? __pfx_mutex_lock+0x10/0x10
[  +0.000015]  ? unwind_next_frame+0x18b/0xa70
[  +0.000019]  amdgpu_dm_atomic_commit_tail+0x1124/0xfa20 [amdgpu]
[  +0.001040]  ? ret_from_fork_asm+0x1a/0x30
[  +0.000018]  ? filter_irq_stacks+0x90/0xa0
[  +0.000022]  ? __pfx_amdgpu_dm_atomic_commit_tail+0x10/0x10 [amdgpu]
[  +0.001058]  ? kasan_save_track+0x18/0x70
[  +0.000015]  ? kasan_save_alloc_info+0x37/0x60
[  +0.000015]  ? __kasan_kmalloc+0xc3/0xd0
[  +0.000013]  ? __kmalloc_cache_noprof+0x1aa/0x600
[  +0.000016]  ? drm_atomic_helper_setup_commit+0x788/0x1450
[  +0.000017]  ? drm_atomic_helper_commit+0x7e/0x290
[  +0.000014]  ? drm_atomic_commit+0x205/0x2e0
[  +0.000015]  ? process_one_work+0x629/0xf80
[  +0.000016]  ? worker_thread+0x87f/0x1570
[  +0.000020]  ? srso_return_thunk+0x5/0x5f
[  +0.000014]  ? __kasan_check_write+0x14/0x30
[  +0.000014]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? _raw_spin_lock_irq+0x8a/0xf0
[  +0.000015]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[  +0.000016]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? __kasan_check_write+0x14/0x30
[  +0.000014]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? __wait_for_common+0x204/0x460
[  +0.000015]  ? sched_clock_noinstr+0x9/0x10
[  +0.000014]  ? __pfx_schedule_timeout+0x10/0x10
[  +0.000014]  ? local_clock_noinstr+0xe/0xd0
[  +0.000015]  ? __pfx___wait_for_common+0x10/0x10
[  +0.000014]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? __wait_for_common+0x204/0x460
[  +0.000014]  ? __pfx_schedule_timeout+0x10/0x10
[  +0.000015]  ? __kasan_kmalloc+0xc3/0xd0
[  +0.000015]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? wait_for_completion_timeout+0x1d/0x30
[  +0.000015]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? drm_crtc_commit_wait+0x32/0x180
[  +0.000015]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? drm_atomic_helper_wait_for_dependencies+0x46a/0x800
[  +0.000019]  commit_tail+0x231/0x510
[  +0.000017]  drm_atomic_helper_commit+0x219/0x290
[  +0.000015]  ? __pfx_drm_atomic_helper_commit+0x10/0x10
[  +0.000016]  drm_atomic_commit+0x205/0x2e0
[  +0.000014]  ? __pfx_drm_atomic_commit+0x10/0x10
[  +0.000013]  ? __pfx_drm_connector_free+0x10/0x10
[  +0.000014]  ? __pfx___drm_printfn_info+0x10/0x10
[  +0.000017]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? drm_atomic_set_crtc_for_connector+0x49e/0x660
[  +0.000015]  ? drm_atomic_set_fb_for_plane+0x155/0x290
[  +0.000015]  drm_framebuffer_remove+0xa9b/0x1240
[  +0.000014]  ? finish_task_switch.isra.0+0x15a/0x840
[  +0.000015]  ? __switch_to+0x385/0xda0
[  +0.000015]  ? srso_safe_ret+0x1/0x20
[  +0.000013]  ? __pfx_drm_framebuffer_remove+0x10/0x10
[  +0.000016]  ? kasan_print_address_stack_frame+0x221/0x280
[  +0.000015]  drm_mode_rmfb_work_fn+0x14b/0x240
[  +0.000015]  process_one_work+0x629/0xf80
[  +0.000012]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? __kasan_check_write+0x14/0x30
[  +0.000019]  worker_thread+0x87f/0x1570
[  +0.000013]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[  +0.000014]  ? __pfx_try_to_wake_up+0x10/0x10
[  +0.000017]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? kasan_print_address_stack_frame+0x227/0x280
[  +0.000017]  ? __pfx_worker_thread+0x10/0x10
[  +0.000014]  kthread+0x396/0x830
[  +0.000013]  ? __pfx__raw_spin_lock_irq+0x10/0x10
[  +0.000015]  ? __pfx_kthread+0x10/0x10
[  +0.000012]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? __kasan_check_write+0x14/0x30
[  +0.000014]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? recalc_sigpending+0x180/0x210
[  +0.000015]  ? srso_return_thunk+0x5/0x5f
[  +0.000013]  ? __pfx_kthread+0x10/0x10
[  +0.000014]  ret_from_fork+0x31c/0x3e0
[  +0.000014]  ? __pfx_kthread+0x10/0x10
[  +0.000013]  ret_from_fork_asm+0x1a/0x30
[  +0.000019]  </TASK>
[  +0.000010] Modules linked in: rfcomm(E) cmac(E) algif_hash(E) algif_skci=
pher(E) af_alg(E) snd_seq_dummy(E) snd_hrtimer(E) qrtr(E) xt_MASQUERADE(E) =
nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) xt_mark(E) xt=
_tcpudp(E) nft_compat(E) nf_tables(E) x_tables(E) bnep(E) snd_hda_codec_alc=
882(E) snd_hda_codec_atihdmi(E) snd_hda_codec_realtek_lib(E) snd_hda_codec_=
hdmi(E) snd_hda_codec_generic(E) iwlmvm(E) snd_hda_intel(E) binfmt_misc(E) =
snd_hda_codec(E) snd_hda_core(E) mac80211(E) snd_intel_dspcfg(E) snd_intel_=
sdw_acpi(E) snd_hwdep(E) snd_pcm(E) libarc4(E) snd_seq_midi(E) snd_seq_midi=
_event(E) snd_rawmidi(E) amd_atl(E) intel_rapl_msr(E) snd_seq(E) intel_rapl=
_common(E) iwlwifi(E) jc42(E) snd_seq_device(E) btusb(E) snd_timer(E) btmtk=
(E) btrtl(E) edac_mce_amd(E) eeepc_wmi(E) polyval_clmulni(E) btbcm(E) ghash=
_clmulni_intel(E) asus_wmi(E) ee1004(E) platform_profile(E) btintel(E) snd(=
E) nls_iso8859_1(E) aesni_intel(E) soundcore(E) i2c_piix4(E) cfg80211(E) sp=
arse_keymap(E) wmi_bmof(E) bluetooth(E) k10temp(E) rapl(E)
[  +0.000300]  i2c_smbus(E) ccp(E) joydev(E) input_leds(E) gpio_amdpt(E) ma=
c_hid(E) sch_fq_codel(E) msr(E) parport_pc(E) ppdev(E) lp(E) parport(E) efi=
_pstore(E) nfnetlink(E) dmi_sysfs(E) autofs4(E) cdc_ether(E) usbnet(E) amdg=
pu(E) amdxcp(E) hid_generic(E) i2c_algo_bit(E) drm_ttm_helper(E) ttm(E) drm=
_exec(E) drm_panel_backlight_quirks(E) gpu_sched(E) drm_suballoc_helper(E) =
video(E) drm_buddy(E) usbhid(E) drm_display_helper(E) r8152(E) hid(E) mii(E=
) cec(E) ahci(E) rc_core(E) igc(E) libahci(E) wmi(E)
[  +0.000294] CR2: 0000000000000000
[  +0.000013] ---[ end trace 0000000000000000 ]---

The crash happens when we unconditionally call into the timing generator
manual trigger hook:

  pipe_ctx->stream_res.tg->funcs->program_manual_trigger(...)

On some configurations the timing generator (tg), its funcs table, or the
program_manual_trigger callback can be NULL. Guard all of these before
calling the hook. If the first pipe matching the stream cannot trigger,
keep scanning to find another matching pipe with a valid hook.

Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig  <christian.koenig@amd.com>

Suggested-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/=
drm/amd/display/dc/core/dc_stream.c
index f59020f1a722..ecd08580937d 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -522,8 +522,10 @@ bool dc_stream_program_cursor_position(
                         struct pipe_ctx *pipe_ctx =3D &dc->current_state->=
res_ctx.pipe_ctx[i];

                         /* trigger event on first pipe with current stream=
 */
-                       if (stream =3D=3D pipe_ctx->stream) {
-                               pipe_ctx->stream_res.tg->funcs->program_man=
ual_trigger(pipe_ctx->stream_res.tg);
+                       if (stream =3D=3D pipe_ctx->stream &&
+                               pipe_ctx->stream_res.tg->funcs->program_man=
ual_trigger) {
+                               pipe_ctx->stream_res.tg->funcs->program_man=
ual_trigger(
+                                       pipe_ctx->stream_res.tg);
                                 break;
                         }
                 }
--
2.52.0


--_000_CH0PR12MB52844942C4F366C072C6B8A48B66ACH0PR12MB5284namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<div>
<div style=3D"font-family: Calibri; text-align: left; color: rgb(0, 128, 0)=
; margin-left: 5pt; font-size: 10pt;">
[Public]</div>
<br>
</div>
Reviewed-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;</div>
<div class=3D"elementToProof" id=3D"Signature">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
--</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Jay<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> vitaly.prosyak@amd.co=
m &lt;vitaly.prosyak@amd.com&gt;<br>
<b>Sent:</b> Thursday, February 5, 2026 8:24 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;; Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br>
<b>Cc:</b> Prosyak, Vitaly &lt;Vitaly.Prosyak@amd.com&gt;; Pillai, Aurabind=
o &lt;Aurabindo.Pillai@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@=
amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/display: guard NULL manual-trigger callback=
 in cursor programming</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt=
;<br>
<br>
KASAN reports a NULL instruction fetch (RIP=3D0x0) from<br>
dc_stream_program_cursor_position():<br>
<br>
&nbsp; BUG: kernel NULL pointer dereference, address: 0000000000000000<br>
&nbsp; RIP: 0010:0x0<br>
&nbsp; Call Trace:<br>
&nbsp;&nbsp;&nbsp; dc_stream_program_cursor_position+0x344/0x920 [amdgpu]<b=
r>
&nbsp;&nbsp;&nbsp; amdgpu_dm_atomic_commit_tail+...<br>
<br>
[&nbsp; +1.041013] BUG: kernel NULL pointer dereference, address: 000000000=
0000000<br>
[&nbsp; +0.000027] #PF: supervisor instruction fetch in kernel mode<br>
[&nbsp; +0.000013] #PF: error_code(0x0010) - not-present page<br>
[&nbsp; +0.000012] PGD 0 P4D 0<br>
[&nbsp; +0.000017] Oops: Oops: 0010 [#1] SMP KASAN NOPTI<br>
[&nbsp; +0.000017] CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Tainted: G&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; E&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; 6.18.0+ #3 PREEMPT(voluntary)<br>
[&nbsp; +0.000023] Tainted: [E]=3DUNSIGNED_MODULE<br>
[&nbsp; +0.000010] Hardware name: ASUS System Product Name/ROG STRIX B550-F=
 GAMING (WI-FI), BIOS 1401 12/03/2020<br>
[&nbsp; +0.000016] Workqueue: events drm_mode_rmfb_work_fn<br>
[&nbsp; +0.000022] RIP: 0010:0x0<br>
[&nbsp; +0.000017] Code: Unable to access opcode bytes at 0xffffffffffffffd=
6.<br>
[&nbsp; +0.000015] RSP: 0018:ffffc9000017f4c8 EFLAGS: 00010246<br>
[&nbsp; +0.000016] RAX: 0000000000000000 RBX: ffff88810afdda80 RCX: 1ffff11=
0457000d1<br>
[&nbsp; +0.000014] RDX: 1ffffffff87b75bd RSI: 0000000000000000 RDI: ffff888=
10afdda80<br>
[&nbsp; +0.000014] RBP: ffffc9000017f538 R08: 0000000000000000 R09: ffff888=
22b800690<br>
[&nbsp; +0.000013] R10: 0000000000000000 R11: 0000000000000000 R12: fffffff=
fc3dbac20<br>
[&nbsp; +0.000014] R13: 0000000000000000 R14: ffff88811ab80000 R15: dffffc0=
000000000<br>
[&nbsp; +0.000014] FS:&nbsp; 0000000000000000(0000) GS:ffff888434599000(000=
0) knlGS:0000000000000000<br>
[&nbsp; +0.000015] CS:&nbsp; 0010 DS: 0000 ES: 0000 CR0: 0000000080050033<b=
r>
[&nbsp; +0.000013] CR2: ffffffffffffffd6 CR3: 000000010ee88000 CR4: 0000000=
000350ef0<br>
[&nbsp; +0.000014] Call Trace:<br>
[&nbsp; +0.000010]&nbsp; &lt;TASK&gt;<br>
[&nbsp; +0.000010]&nbsp; dc_stream_program_cursor_position+0x344/0x920 [amd=
gpu]<br>
[&nbsp; +0.001086]&nbsp; ? __pfx_mutex_lock+0x10/0x10<br>
[&nbsp; +0.000015]&nbsp; ? unwind_next_frame+0x18b/0xa70<br>
[&nbsp; +0.000019]&nbsp; amdgpu_dm_atomic_commit_tail+0x1124/0xfa20 [amdgpu=
]<br>
[&nbsp; +0.001040]&nbsp; ? ret_from_fork_asm+0x1a/0x30<br>
[&nbsp; +0.000018]&nbsp; ? filter_irq_stacks+0x90/0xa0<br>
[&nbsp; +0.000022]&nbsp; ? __pfx_amdgpu_dm_atomic_commit_tail+0x10/0x10 [am=
dgpu]<br>
[&nbsp; +0.001058]&nbsp; ? kasan_save_track+0x18/0x70<br>
[&nbsp; +0.000015]&nbsp; ? kasan_save_alloc_info+0x37/0x60<br>
[&nbsp; +0.000015]&nbsp; ? __kasan_kmalloc+0xc3/0xd0<br>
[&nbsp; +0.000013]&nbsp; ? __kmalloc_cache_noprof+0x1aa/0x600<br>
[&nbsp; +0.000016]&nbsp; ? drm_atomic_helper_setup_commit+0x788/0x1450<br>
[&nbsp; +0.000017]&nbsp; ? drm_atomic_helper_commit+0x7e/0x290<br>
[&nbsp; +0.000014]&nbsp; ? drm_atomic_commit+0x205/0x2e0<br>
[&nbsp; +0.000015]&nbsp; ? process_one_work+0x629/0xf80<br>
[&nbsp; +0.000016]&nbsp; ? worker_thread+0x87f/0x1570<br>
[&nbsp; +0.000020]&nbsp; ? srso_return_thunk+0x5/0x5f<br>
[&nbsp; +0.000014]&nbsp; ? __kasan_check_write+0x14/0x30<br>
[&nbsp; +0.000014]&nbsp; ? srso_return_thunk+0x5/0x5f<br>
[&nbsp; +0.000013]&nbsp; ? _raw_spin_lock_irq+0x8a/0xf0<br>
[&nbsp; +0.000015]&nbsp; ? __pfx__raw_spin_lock_irq+0x10/0x10<br>
[&nbsp; +0.000016]&nbsp; ? srso_return_thunk+0x5/0x5f<br>
[&nbsp; +0.000013]&nbsp; ? __kasan_check_write+0x14/0x30<br>
[&nbsp; +0.000014]&nbsp; ? srso_return_thunk+0x5/0x5f<br>
[&nbsp; +0.000013]&nbsp; ? __wait_for_common+0x204/0x460<br>
[&nbsp; +0.000015]&nbsp; ? sched_clock_noinstr+0x9/0x10<br>
[&nbsp; +0.000014]&nbsp; ? __pfx_schedule_timeout+0x10/0x10<br>
[&nbsp; +0.000014]&nbsp; ? local_clock_noinstr+0xe/0xd0<br>
[&nbsp; +0.000015]&nbsp; ? __pfx___wait_for_common+0x10/0x10<br>
[&nbsp; +0.000014]&nbsp; ? srso_return_thunk+0x5/0x5f<br>
[&nbsp; +0.000013]&nbsp; ? __wait_for_common+0x204/0x460<br>
[&nbsp; +0.000014]&nbsp; ? __pfx_schedule_timeout+0x10/0x10<br>
[&nbsp; +0.000015]&nbsp; ? __kasan_kmalloc+0xc3/0xd0<br>
[&nbsp; +0.000015]&nbsp; ? srso_return_thunk+0x5/0x5f<br>
[&nbsp; +0.000013]&nbsp; ? wait_for_completion_timeout+0x1d/0x30<br>
[&nbsp; +0.000015]&nbsp; ? srso_return_thunk+0x5/0x5f<br>
[&nbsp; +0.000013]&nbsp; ? drm_crtc_commit_wait+0x32/0x180<br>
[&nbsp; +0.000015]&nbsp; ? srso_return_thunk+0x5/0x5f<br>
[&nbsp; +0.000013]&nbsp; ? drm_atomic_helper_wait_for_dependencies+0x46a/0x=
800<br>
[&nbsp; +0.000019]&nbsp; commit_tail+0x231/0x510<br>
[&nbsp; +0.000017]&nbsp; drm_atomic_helper_commit+0x219/0x290<br>
[&nbsp; +0.000015]&nbsp; ? __pfx_drm_atomic_helper_commit+0x10/0x10<br>
[&nbsp; +0.000016]&nbsp; drm_atomic_commit+0x205/0x2e0<br>
[&nbsp; +0.000014]&nbsp; ? __pfx_drm_atomic_commit+0x10/0x10<br>
[&nbsp; +0.000013]&nbsp; ? __pfx_drm_connector_free+0x10/0x10<br>
[&nbsp; +0.000014]&nbsp; ? __pfx___drm_printfn_info+0x10/0x10<br>
[&nbsp; +0.000017]&nbsp; ? srso_return_thunk+0x5/0x5f<br>
[&nbsp; +0.000013]&nbsp; ? drm_atomic_set_crtc_for_connector+0x49e/0x660<br=
>
[&nbsp; +0.000015]&nbsp; ? drm_atomic_set_fb_for_plane+0x155/0x290<br>
[&nbsp; +0.000015]&nbsp; drm_framebuffer_remove+0xa9b/0x1240<br>
[&nbsp; +0.000014]&nbsp; ? finish_task_switch.isra.0+0x15a/0x840<br>
[&nbsp; +0.000015]&nbsp; ? __switch_to+0x385/0xda0<br>
[&nbsp; +0.000015]&nbsp; ? srso_safe_ret+0x1/0x20<br>
[&nbsp; +0.000013]&nbsp; ? __pfx_drm_framebuffer_remove+0x10/0x10<br>
[&nbsp; +0.000016]&nbsp; ? kasan_print_address_stack_frame+0x221/0x280<br>
[&nbsp; +0.000015]&nbsp; drm_mode_rmfb_work_fn+0x14b/0x240<br>
[&nbsp; +0.000015]&nbsp; process_one_work+0x629/0xf80<br>
[&nbsp; +0.000012]&nbsp; ? srso_return_thunk+0x5/0x5f<br>
[&nbsp; +0.000013]&nbsp; ? __kasan_check_write+0x14/0x30<br>
[&nbsp; +0.000019]&nbsp; worker_thread+0x87f/0x1570<br>
[&nbsp; +0.000013]&nbsp; ? __pfx__raw_spin_lock_irqsave+0x10/0x10<br>
[&nbsp; +0.000014]&nbsp; ? __pfx_try_to_wake_up+0x10/0x10<br>
[&nbsp; +0.000017]&nbsp; ? srso_return_thunk+0x5/0x5f<br>
[&nbsp; +0.000013]&nbsp; ? kasan_print_address_stack_frame+0x227/0x280<br>
[&nbsp; +0.000017]&nbsp; ? __pfx_worker_thread+0x10/0x10<br>
[&nbsp; +0.000014]&nbsp; kthread+0x396/0x830<br>
[&nbsp; +0.000013]&nbsp; ? __pfx__raw_spin_lock_irq+0x10/0x10<br>
[&nbsp; +0.000015]&nbsp; ? __pfx_kthread+0x10/0x10<br>
[&nbsp; +0.000012]&nbsp; ? srso_return_thunk+0x5/0x5f<br>
[&nbsp; +0.000013]&nbsp; ? __kasan_check_write+0x14/0x30<br>
[&nbsp; +0.000014]&nbsp; ? srso_return_thunk+0x5/0x5f<br>
[&nbsp; +0.000013]&nbsp; ? recalc_sigpending+0x180/0x210<br>
[&nbsp; +0.000015]&nbsp; ? srso_return_thunk+0x5/0x5f<br>
[&nbsp; +0.000013]&nbsp; ? __pfx_kthread+0x10/0x10<br>
[&nbsp; +0.000014]&nbsp; ret_from_fork+0x31c/0x3e0<br>
[&nbsp; +0.000014]&nbsp; ? __pfx_kthread+0x10/0x10<br>
[&nbsp; +0.000013]&nbsp; ret_from_fork_asm+0x1a/0x30<br>
[&nbsp; +0.000019]&nbsp; &lt;/TASK&gt;<br>
[&nbsp; +0.000010] Modules linked in: rfcomm(E) cmac(E) algif_hash(E) algif=
_skcipher(E) af_alg(E) snd_seq_dummy(E) snd_hrtimer(E) qrtr(E) xt_MASQUERAD=
E(E) nf_nat(E) nf_conntrack(E) nf_defrag_ipv6(E) nf_defrag_ipv4(E) xt_mark(=
E) xt_tcpudp(E) nft_compat(E) nf_tables(E)
 x_tables(E) bnep(E) snd_hda_codec_alc882(E) snd_hda_codec_atihdmi(E) snd_h=
da_codec_realtek_lib(E) snd_hda_codec_hdmi(E) snd_hda_codec_generic(E) iwlm=
vm(E) snd_hda_intel(E) binfmt_misc(E) snd_hda_codec(E) snd_hda_core(E) mac8=
0211(E) snd_intel_dspcfg(E) snd_intel_sdw_acpi(E)
 snd_hwdep(E) snd_pcm(E) libarc4(E) snd_seq_midi(E) snd_seq_midi_event(E) s=
nd_rawmidi(E) amd_atl(E) intel_rapl_msr(E) snd_seq(E) intel_rapl_common(E) =
iwlwifi(E) jc42(E) snd_seq_device(E) btusb(E) snd_timer(E) btmtk(E) btrtl(E=
) edac_mce_amd(E) eeepc_wmi(E) polyval_clmulni(E)
 btbcm(E) ghash_clmulni_intel(E) asus_wmi(E) ee1004(E) platform_profile(E) =
btintel(E) snd(E) nls_iso8859_1(E) aesni_intel(E) soundcore(E) i2c_piix4(E)=
 cfg80211(E) sparse_keymap(E) wmi_bmof(E) bluetooth(E) k10temp(E) rapl(E)<b=
r>
[&nbsp; +0.000300]&nbsp; i2c_smbus(E) ccp(E) joydev(E) input_leds(E) gpio_a=
mdpt(E) mac_hid(E) sch_fq_codel(E) msr(E) parport_pc(E) ppdev(E) lp(E) parp=
ort(E) efi_pstore(E) nfnetlink(E) dmi_sysfs(E) autofs4(E) cdc_ether(E) usbn=
et(E) amdgpu(E) amdxcp(E) hid_generic(E) i2c_algo_bit(E)
 drm_ttm_helper(E) ttm(E) drm_exec(E) drm_panel_backlight_quirks(E) gpu_sch=
ed(E) drm_suballoc_helper(E) video(E) drm_buddy(E) usbhid(E) drm_display_he=
lper(E) r8152(E) hid(E) mii(E) cec(E) ahci(E) rc_core(E) igc(E) libahci(E) =
wmi(E)<br>
[&nbsp; +0.000294] CR2: 0000000000000000<br>
[&nbsp; +0.000013] ---[ end trace 0000000000000000 ]---<br>
<br>
The crash happens when we unconditionally call into the timing generator<br=
>
manual trigger hook:<br>
<br>
&nbsp; pipe_ctx-&gt;stream_res.tg-&gt;funcs-&gt;program_manual_trigger(...)=
<br>
<br>
On some configurations the timing generator (tg), its funcs table, or the<b=
r>
program_manual_trigger callback can be NULL. Guard all of these before<br>
calling the hook. If the first pipe matching the stream cannot trigger,<br>
keep scanning to find another matching pipe with a valid hook.<br>
<br>
Cc: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
Cc: Alexander Deucher &lt;alexander.deucher@amd.com&gt;<br>
Cc: Christian Koenig&nbsp; &lt;christian.koenig@amd.com&gt;<br>
<br>
Suggested-by: Aurabindo Pillai &lt;aurabindo.pillai@amd.com&gt;<br>
Signed-off-by: Vitaly Prosyak &lt;vitaly.prosyak@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 6 ++++--<br>
&nbsp;1 file changed, 4 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/=
drm/amd/display/dc/core/dc_stream.c<br>
index f59020f1a722..ecd08580937d 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c<br>
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c<br>
@@ -522,8 +522,10 @@ bool dc_stream_program_cursor_position(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struc=
t pipe_ctx *pipe_ctx =3D &amp;dc-&gt;current_state-&gt;res_ctx.pipe_ctx[i];=
<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* tr=
igger event on first pipe with current stream */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (stream =3D=
=3D pipe_ctx-&gt;stream) {<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_ctx-&gt;stream_res.tg-&gt;funcs-&gt;pr=
ogram_manual_trigger(pipe_ctx-&gt;stream_res.tg);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (stream =3D=
=3D pipe_ctx-&gt;stream &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_ctx-&gt;stream_res.tg-&gt;funcs-&gt;pr=
ogram_manual_trigger) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pipe_ctx-&gt;stream_res.tg-&gt;funcs-&gt;pr=
ogram_manual_trigger(<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; pipe_ctx-&gt;stream_res.tg);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
-- <br>
2.52.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CH0PR12MB52844942C4F366C072C6B8A48B66ACH0PR12MB5284namp_--

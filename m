Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SO9WAykwr2mWPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 21:40:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28ACB240F63
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 21:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C75A10E126;
	Mon,  9 Mar 2026 20:40:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hCwWcNKA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012017.outbound.protection.outlook.com [40.107.209.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CC9C10E126;
 Mon,  9 Mar 2026 20:40:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xF+jmbNgqUjDdv+y0sdwOV++ZpuCa+aXlY//9xEmnJqh4aje1FEFAKvdMepQo+vRPs2i2qWbdMP5GrR6VVs6c1oVa65WRS3hktLuFD2u/sMgc+BNoUUMt+8bwSnB3JPg/gzgbdOBZTuh57XN+BsZHs9x+fTKQomVpk3yEH4zDAkQltI1OqR9s1SikzWypJXKYJB7DqO3DuFuR9PL2VCKZVPjsrUCK1bHotTQ6b/fEZWQ+d9B1TcrMEiaou3SaEylXB8jRqteJPpOE11afX2DoFqsyZMGopnU3+DHp1AaOvdupuBfptYXEMPJVokuDRTm1I4wNZ20xeXc5tm1oPnRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cBivn8WyonD1PVZ7wN7VLv5slrkxYoYOUkPwghUhpz0=;
 b=Q5q8Qs5FGG5aGB1gA34LeWvnFXAbmZvrJrC8SHLSxSFyeHyFK4L7211DPve0V2q5HoMbrx23v5U78gt7+sCtttqiQq3LZb0Kf9m2qoiMT0ZUUX/sBPHIiqKfzb/9WmedOKGtkNi7KGoLo6V72pF6x2JeGCaFL14wPHxi7bGZspFhP/Qe6DjTGVrVllS8i4jDeDJjcm1Mja8vWyW9lcwsJItaDcAKMcNvPzauc4iBpC3b+kPfHm1dsTo0v0+EbW/QsglCrUq8pBKGbiZuVphH5vsQrm0co/LHVu1zpgdERZvLFUmZ5EhHAgTCSVRlnbHdqvNR2+vE6u3iSlkkrhQY1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cBivn8WyonD1PVZ7wN7VLv5slrkxYoYOUkPwghUhpz0=;
 b=hCwWcNKADrXN0OmkQaaxTnNrcwD1lU+SaxgmmZWy2Ph8sBxbHW8m4y2sm0DmT3BT5f6X3mOeCx6CdZNnJ7WdVVB5w0U+OPmWEVzzUaV2Bif6p74zmp13YnnPM1oXqLyFhbZFiSeSI7Amkw2Wea7vgjFO7e6dEbVGKql821SsXEL/UiUSUy/cDbDSopquJTtSB6OWmCXmW4MEhmcvtejEkCoSE6+kelB7s2EfohyO4DOt4QJE8nvlBJTXz93a+odDYmYqG0Qer8VQ03oOhEEaG5q2G5zeYj+N5OzswaIOXqjxAfs4M/CAVYjoYzRDlXklXZHh2x/Eq1mGy1yj1yk/xg==
Received: from CH8PR12MB9815.namprd12.prod.outlook.com (2603:10b6:610:277::13)
 by LV2PR12MB999073.namprd12.prod.outlook.com (2603:10b6:408:352::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 20:39:55 +0000
Received: from CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24]) by CH8PR12MB9815.namprd12.prod.outlook.com
 ([fe80::1592:590a:e527:ca24%3]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 20:39:55 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "ewan.chorynski@ik.me" <ewan.chorynski@ik.me>, Alexandre Courbot
 <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>, "airlied@gmail.com"
 <airlied@gmail.com>, John Hubbard <jhubbard@nvidia.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>
CC: Alistair Popple <apopple@nvidia.com>, Eliot Courtney
 <ecourtney@nvidia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, Joel Fernandes <joelagnelf@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
Thread-Topic: [PATCH v11 00/12] gpu: nova-core: add Turing support
Thread-Index: AQHcrSUU5EX/S9sMckG758uYAhOBAbWmoSaAgAAEZACAAAPgAIAAAzkAgAAC1wA=
Date: Mon, 9 Mar 2026 20:39:55 +0000
Message-ID: <044ccb41527e214217e07ef75fb8604f21a1becc.camel@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <DGYIFHP99CQ3.2XWVRPO9O1E1D@ik.me>
 <282984b6-a0e1-4e3a-bb57-db817b7e9249@nvidia.com>
 <864ab8a502db872468d7b01e0adfff386d2187cc.camel@nvidia.com>
 <fa3c5390-aea2-45c2-89ef-05a64070a44b@nvidia.com>
In-Reply-To: <fa3c5390-aea2-45c2-89ef-05a64070a44b@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH8PR12MB9815:EE_|LV2PR12MB999073:EE_
x-ms-office365-filtering-correlation-id: f5afbb4e-8ba7-46ae-7c31-08de7e1c0609
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: WXAfVbhqJjtS0FuolPqU7mIPW+Y24FzsIlWv05hTzBFkZEMH9gwTdaWqO7zVjPizWAmiKJv+jECtO3blTOeTbJwNzn+Vq/TCOwTwB/F/lIIMA5hsEob6xoY5kj7d+VO1LjAbm6mwX14zFZyJDe0CltSms3rmgj2B13Oh4bmbwnGRqjbdyrUfzsJcGCYAWnNMThl6FpPu3oSu12GEQaA2z24xdlVVVIf7a5ej5niYAl0H1hhlQ4N3Husnevt+3LMvMFhVjL7II+3Py/19sqMJqWCOHeN8mkOpbbN8f6mWBUELSuQCvqaLVS1esFC0rS3Kg1bxrVVBs0IKAOLsgAsI01nZSzVu4VWoRnwwHHbFtemj9YbI1T1MoO8dZGdFiw0xGc3jrcM8qYAZpmzEgDjGRrlGDtRmQDOK14k7uBNVW30s5gVBseRDzZ1uk7AaTqyfndwmYOIAQFCM8ZVwW2nIkkmz7r/XtWSHX1sIAyEDottohulwJdMx5xIxVF2jKAxbOIn2DXg5lxKScKPc7mg0QzhglqvxlhhWHLD4WmM5EVIkmyzZBdL26p3VmwbGi2c6/WVIDNh8g25l7Y9WeSto/ZgZotPb2luet/FsJef9vH8JmtbT2LjDdXnMjfNglA+a5z7TY4dtkP6BC2Nie5BajM5cubKBF6emvoEqdGT1GBM1vsGQgsuregyg42qlXLOEdKbYoLEHRIgI7wOwq1NqKOk0hm2oWfY9F7VINvOi2mtOnGGUUTa42sMlF2G32u6m3zBwNxQGBR9vOKiunmwOjXfTkw6Wxln9RbMiUx41wnk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH8PR12MB9815.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z25QMTIvZ1VqMkI3WERtMTBBUlNacTdZaHQ5ajNPNVErMzNLZGJRS2Y3ZlFQ?=
 =?utf-8?B?Q0dqRW5EVkJTY0gzdFk5amRvZmU4S3paRXAxSENMb29Gdi95TmpoQmxjRkps?=
 =?utf-8?B?dmYrMkR6L2NzaGp0ZXlSbDBHcEJjOE1kYmhjR1ZRaThkREJxLzZZWEhsSGdv?=
 =?utf-8?B?bXVoMFY0WURTc2VRQ3NEcmVQakZvTDQrMjNFNXhsaHBQVUpERjdMODlXemUy?=
 =?utf-8?B?cW9QNkF4bndFSFMwcG13K1REWWZRQStrOUVrU2lMdk1sYmRUa3BWOGM5RVFm?=
 =?utf-8?B?THpZbVh2QUNqSUtCclBHK3ZIRDJrUURiY1lSK25QZ0xXSGg5ZWgvNXVwaGJn?=
 =?utf-8?B?VUsvK0phM2hPNmlqRXdIei9tNmp3Vmh2Skt6VzVsRXNMTFlYWEdsdUx6U0g2?=
 =?utf-8?B?U1cxclJrN1FiZnlBTFllV3VxT3BwYjBGR2Zpc08wWFF0STkwU09rMTZrVlp4?=
 =?utf-8?B?U01yUFh5SHExbldFVnp3L3BScndDbkc4aU5HcTh2cHdrZUxvQzFwNUFrWGFh?=
 =?utf-8?B?SjZBL211SU1jbU4ycUZvOTlPVEEyUCtCZ0pvcnN1RCt6aGJRTGpxdFJtWS8w?=
 =?utf-8?B?cUptVXZSNDVEVVlkR0oxck1iTktSRms5MlgwVW9wUUZzQitmYzJ2QnBlbFhq?=
 =?utf-8?B?Z3ArbGU5WkprTCtHbS9aMG9yWHVwYWZwRVJWVG9tUE41c1VaYW1GbjRIN1Zh?=
 =?utf-8?B?dFFxc1N4aFVqSmE1K05aeUM2K0tCdEZ2TDNzdnd6azBPOVdoZlBzMzZqWEhD?=
 =?utf-8?B?ZlJsbnB4VVZWeHBYeXFacGh6UXd1YTR1QkRDVEsrZ0FPai9Bbkc0bjNtQUdW?=
 =?utf-8?B?ajZvZ09DQTVZemJYc2VRbzYrcFpqUEREVGlad3FiNHg2NDVYQllqV2Jaalpw?=
 =?utf-8?B?dkFBaG5OYmZZQkNCWm9HTVNyYXpmclBVZ1A2ZEpoTWdLWU15U0gyUnNNR1Fk?=
 =?utf-8?B?M3ByQ1QzRTluSDg0OWN2WXREVGQ2eU9zTE9wOG1MQUNiR0JYVFdsQlcwd2pw?=
 =?utf-8?B?Qmt3Umt1cWI5UHVjNmxYOGFCaDhVbDlIVEl3OTNFck5Qci8zOTh6REg1MEFD?=
 =?utf-8?B?RUI4WUhqODFubWdYUjFuYUdVd1kxL0ZRSGR0ckt1bXVDUXBjUlNoWjJpVGF4?=
 =?utf-8?B?aXRKZUFrMnA2cEwrZmcxM0NlTjRaaUZxcklpRGJCTjRXTmVQVWg1TkxZY2ZM?=
 =?utf-8?B?RmhlRXVjam5OWmw2RTFpeTdIOWJUZnY3cC8xbkFnVnhwWkEyRWJmRWZyNnZF?=
 =?utf-8?B?NW1IcUhyS05MK3A3eWJHZkNhWWJ1TzlzRlBDU3lxWWF3K25MdElIaFJ6d1RO?=
 =?utf-8?B?TklJTWd2akZrRXZWM2ZWdlhRMmRWMjZseDNPZTNqT1ZBQWZtZzdEbTQ5K2JZ?=
 =?utf-8?B?M01NbHlNUDVvWkx6TXRFOUI3MnF4ZStBL3JlK3VoUmZUSUdEb2ZxV0ZJVlVr?=
 =?utf-8?B?QzhhbDVmWXJYd0tzRkRvczZ0dFJlUTE3cFBJRDRaUXdwb1dtOXFnUm5lVHBm?=
 =?utf-8?B?SmtrSWFnajlsQ2QySlRvd2hTckVRT0VGMmNFQWtEWUpBYUtOaWV2L05tZFJ5?=
 =?utf-8?B?Wkx5NVRPWmFmcEdRUFRFRHJ0cDR3UnRQTHB3ckpFSi93ckd2MGNtYUdGM0lj?=
 =?utf-8?B?NkRIWDBaVWxDYXExSUcxd00wdDVxcHF2eHlkaFhWem5tbGk3aEhXTWVoUSty?=
 =?utf-8?B?T2tuYWt5RnBmeVBJWEFQQjlySjNxbXNkMnZtbUprUnNUbGREa1ptcytSSGs2?=
 =?utf-8?B?aDYrSEhyVXp0V1dMK1JQa2hBUGpHb2F1dmZIZzhCaTIrRE15YTVQMEc1eGVn?=
 =?utf-8?B?YitQNWh0bVhEWHZPUnhXOTdjanpiaHo3d0RaVURvNnpRTWIxQ0RxN0dhczI2?=
 =?utf-8?B?KzByeURKcXBjV0hNV2tMbUZyWC9BbEI4Z3lzaTNRTFBHOTBwMFBkVmVPWm5q?=
 =?utf-8?B?SllzY2Fsd3oxZEZkOU8xaUdJU2Rhc1dLelNSTVBsdE1YclpReGhia3FwMC9T?=
 =?utf-8?B?a2VTQnNnMVMrU0dYV1FaQ01YRmZhamY3TVhoamlLd0JpYzlpYXFVTHNOalg3?=
 =?utf-8?B?ZlV4UFlkV2FFK0FHYklFWjVyQ213b1lzamh1aEF0dmV6WThaNlN4NHlpaUJw?=
 =?utf-8?B?NFFFeCthZ05OdE1qTzVYOHRQR0laZU1HRlAvMGtOTTlWeG1KTC9qS3F6R3B5?=
 =?utf-8?B?b3FSNVZ3SkJTRURyL2c5aEdlM1c1SndJYWlJZlFlSnU5RnRoRjVGdmJLQ1pZ?=
 =?utf-8?B?RmtsUi84VzVpZksxYlFCbmhSVkpmSXg5cDVRcUVJcmdQRFFSOWhIREFvbm1I?=
 =?utf-8?B?K0VvMDRzdHJ0Rko0MDlzZ1FQYXhpM2FWb2FWeFdpUVZxOXBnQ0gwUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A5B05917207AD54B995A9C3F77B62A59@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH8PR12MB9815.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5afbb4e-8ba7-46ae-7c31-08de7e1c0609
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Mar 2026 20:39:55.8208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z64IRAYpwZ6g3MN8YT9kcdfWaRY8oYXZhioG1n8DKoiqSL6s+LxISm+RabRskuDN3mKkMz3+6Z5Uc6hymqtCNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999073
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
X-Rspamd-Queue-Id: 28ACB240F63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ik.me,nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ttabi@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Action: no action

T24gTW9uLCAyMDI2LTAzLTA5IGF0IDEzOjI5IC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IE9uIDMvOS8yNiAxOjE4IFBNLCBUaW11ciBUYWJpIHdyb3RlOg0KPiA+IE9uIE1vbiwgMjAyNi0w
My0wOSBhdCAxMzowNCAtMDcwMCwgSm9obiBIdWJiYXJkIHdyb3RlOg0KPiA+ID4gDQo+ID4gPiBJ
IGhhdmUgdGhhdCBleGFjdCBjYXJkIGF2YWlsYWJsZSwgc28gSSdsbCBnaXZlIHRoaXMgYSBxdWlj
ayB0ZXN0IGFuZCBzZWUNCj4gPiA+IHdoYXQncyBtaXNzaW5nIG9yIHdyb25nLCBub3cgdGhhdCBB
bGV4IGhhcyBwdXNoZWQgdGhlIGVudGlyZSBUdXJpbmcgc3VwcG9ydA0KPiA+ID4gc2V0IHVwIHRv
IGRybS1ydXN0LW5leHQuDQo+ID4gDQo+ID4gVGhlIFRVMTE3IGlzIHRlY2huaWNhbGx5IGEgbW9i
aWxlIGNoaXAsIGFuZCBpdHMgVkJJT1MgaXMgZGlmZmVyZW50LsKgIE15IGluaXRpYWwgdmVyc2lv
biBvZiB0aGUNCj4gPiBUdXJpbmcgcGF0Y2hlcyB3b3VsZCAiaWdub3JlIiB0aGUgcHJvYmxlbWF0
aWMgVkJJT1Mgc2VjdGlvbnMsIHNvIHBlcmhhcHMgdGhpcyBjaGFuZ2VkLg0KPiA+IA0KPiANCj4g
Tm8gcmVwcm8gb24gdGhlIGxhdGVzdCBkcm0tcnVzdC1uZXh0IGJyYW5jaDoNCj4gDQo+IE5vdmFD
b3JlIDAwMDA6ZTE6MDAuMDogUHJvYmUgTm92YSBDb3JlIEdQVSBkcml2ZXIuDQo+IE5vdmFDb3Jl
IDAwMDA6ZTE6MDAuMDogTlZJRElBIChDaGlwc2V0OiBUVTExNywgQXJjaGl0ZWN0dXJlOiBUdXJp
bmcsIFJldmlzaW9uOiBhLjEpDQo+IE5vdmFDb3JlIDAwMDA6ZTE6MDAuMDogRm91bmQgQklPUyBp
bWFnZTogc2l6ZTogMHhlNjAwLCB0eXBlOiBPayhQY2lBdCksIGxhc3Q6IGZhbHNlDQo+IE5vdmFD
b3JlIDAwMDA6ZTE6MDAuMDogRm91bmQgQklPUyBpbWFnZTogc2l6ZTogMHgxMTAwMCwgdHlwZTog
T2soRWZpKSwgbGFzdDogZmFsc2UNCj4gTm92YUNvcmUgMDAwMDplMTowMC4wOiBGb3VuZCBCSU9T
IGltYWdlOiBzaXplOiAweGMyMDAsIHR5cGU6IE9rKEZ3U2VjKSwgbGFzdDogZmFsc2UNCj4gTm92
YUNvcmUgMDAwMDplMTowMC4wOiBGb3VuZCBCSU9TIGltYWdlOiBzaXplOiAweDIyNDAwLCB0eXBl
OiBPayhGd1NlYyksIGxhc3Q6IGZhbHNlDQo+IE5vdmFDb3JlIDAwMDA6ZTE6MDAuMDogSW52YWxp
ZCBzaWduYXR1cmUgZm9yIE5wZGVTdHJ1Y3Q6IFsxLCAxLCA2NiwgODZdDQo+IE5vdmFDb3JlIDAw
MDA6ZTE6MDAuMDogSW52YWxpZCBzaWduYXR1cmUgZm9yIE5wZGVTdHJ1Y3Q6IFsxLCAxLCA2Niwg
ODZdDQoNClNvIHRoaXMgaXMgdGhlIHByb2JsZW1hdGljIHNlY3Rpb24gdGhhdCBnZXRzIGlnbm9y
ZWQuICBJdCdzIG9uIG15IFRPRE8gbGlzdCB0byBmaXggdGhpcywgYnV0IGxhc3QNCnRpbWUgSSBs
b29rZWQgYXQgaXQsIHRoZSBkb2N1bWVudGF0aW9uIEkgaGFkIG9uIHRoZSBWQklPUyBsYXlvdXQg
ZGlkIG5vdCBhbGlnbiB3aXRoIHRoZSBWQklPUyBvbiBteQ0KVFUxMTcuDQoNCj4gWyAgICAyLjI0
NjA5NV0gTm92YUNvcmUgMDAwMDowMTowMC4wOiBOVklESUEgKENoaXBzZXQ6IFRVMTE3LCBBcmNo
aXRlY3R1cmU6IFR1cmluZywgUmV2aXNpb246IGEuMSkNCj4gWyAgICAyLjcyMjY4MV0gTm92YUNv
cmUgMDAwMDowMTowMC4wOiBCb290ZXItbG9hZCBmYWlsZWQgd2l0aCBlcnJvciAweDMxDQo+IA0K
PiBIb3dldmVyIG5vdXZlYXUgZG9lcyBub3QgcHJvYmUgZWl0aGVyIHdpdGggdGhpcyBmaXJtd2Fy
ZSBzbyB0aGF0J3Mgbm90DQo+IHJlYWxseSB0aGlzIHBhdGNoc2V0IGZhdWx0Lg0KDQpTbyBCb290
ZXItbG9hZCBlcnJvciAweDMxIG1lYW5zIHRoYXQgQm9vdGVyIHRlY2huaWNhbGx5IGRpZCBzdGFy
dCwgYnV0IGl0IGFib3J0ZWQgdmVyeSBlYXJseS4gDQpVbmZvcnR1bmF0ZWx5LCB0aGlzIGlzIHZl
cnkgZGlmZmljdWx0IHRvIGRlYnVnIGluIHRoZSBmaWVsZC4gIE5vcm1hbGx5IHdoYXQgSSB3b3Vs
ZCBkbyBpcyBidWlsZA0KY3VzdG9tIHZlcnNpb25zIG9mIGJvb3Rlci1sb2FkIHRvIHNlZSB3aGVy
ZSBpdCBmYWlscy4gIEkgY2Fubm90IGRvIHRoaXMgd2l0aG91dCB0aGUgY2FyZCBpbiBteSBoYW5k
Lg0KDQpUaGUgZmlyc3QgdGhpbmcgSSB3b3VsZCBkbyBpcyB2ZXJpZnkgdGhhdCBHc3BGd1dwck1l
dGEgZG9lcyBub3QgaGF2ZSBub25zZW5zaWNhbCB2YWx1ZXMuDQoNCg0K

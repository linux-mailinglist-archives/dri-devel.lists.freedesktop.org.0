Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8022D90C44A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 09:29:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CED10E5A6;
	Tue, 18 Jun 2024 07:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=habana.ai header.i=@habana.ai header.b="GpKcYfoD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 5791 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2024 09:51:36 UTC
Received: from cluster-b.mailcontrol.com (cluster-b.mailcontrol.com
 [85.115.56.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAF910E329
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 09:51:36 +0000 (UTC)
Received: from rly17b.srv.mailcontrol.com (localhost [127.0.0.1])
 by rly17b.srv.mailcontrol.com (MailControl) with ESMTP id 45H8EcLt198953;
 Mon, 17 Jun 2024 09:14:38 +0100
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
 by rly17b.srv.mailcontrol.com (MailControl) id 45H8ENoi194412;
 Mon, 17 Jun 2024 09:14:23 +0100
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169])
 by rly17b-eth0.srv.mailcontrol.com (envelope-sender oshpigelman@habana.ai)
 (MIMEDefang) with ESMTP id 45H8ELVK193704
 (TLS bits=256 verify=OK); Mon, 17 Jun 2024 09:14:23 +0100 (BST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CveuXTN7jighRi5K8C/vZAtWICT2fs9feh5OFcA68u2MIDFNA5vug2rX4FrIBSZueVd0B0Ts43YYrSxC3qxihzKNNKyiEEAa6xif6H/zlTvgkZ8HvdakrCnpF11hT9AazfM8R1nt7oq1VDq+/8dZNLMG0yZf2l6AEMRQkF7uBOfs+TLhh0YZ1PmRFUFfwFw3jM75XVYhDjZP/GifB22QLKJ1VKCEAEEhFh2QR7eKK6gs4PFR/d7yqQyrkkxuecG/noABRriJK4QDo091hcTgwhvMYFOgdX3e8WB37MY9rsRt6U7oUPVbosAa7lrMJi9+NRbEvYmeUM32O3TO9Rzk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hnjr9GXA5Tp2uMgBQLE81EZzH/hCbT3OMPhBbou300=;
 b=hpZ3XKWeFvXKvLN/iKGo6Da8x4Wc4TnMbo+bqbWJFZJ5HcjcfWRYsLa8EaktLVf5wo5Mhf+wdKrSioEH5wYgKwDbaJqMUpy0/1iRc45wpmEzKwINBngZuaQdW6NiM5VA2gCufcJN0U6VRpLtL2UHf6YpeM3YRYzCD4smb0gY0/RUwA7r2DCitjY88Me2ncELVSAJSF7H4Ul+I1e4ggyakqumeLHI2k18JExKLMXI3W8oTFUW+rSWFuMSQ1u9v1hUY/dHteXee0k76T9rEgpr0UZhJNGrqxVcaXM3eOQKZ5v3GRpV9egKTTneBTy8BunpMOEZqFdr7fuddcHaC5aYQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=habana.ai; dmarc=pass action=none header.from=habana.ai;
 dkim=pass header.d=habana.ai; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=habana.ai; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hnjr9GXA5Tp2uMgBQLE81EZzH/hCbT3OMPhBbou300=;
 b=GpKcYfoD/l9zHUuDGO6DN7XaVGd0AQreYUr8AcNghDyZFcKqinwIJIxM8gdvDQ+xnUdmoUjDCGMRN5qoqyUi2/565/GxQwjQKq6XhI/L8FkRNb/0PqE1Bi95hVK42wprBFNJqgwt1+dN7J4TEdd4/W/YxOs6Ayt1jCJXdkHwqIpDh6x2XZx2PGaIggwUI01WAujEFuW4C2EdBfC/5sCNiz5Z8iPJjWboO+x9gbl35METwWN7DUr6pbbOhQX+IsONrOJja2nGi71v06+tAmXqH0DSsdqCn+sWnJs21n0V5S3v1dZcUHvTcEXbE518EfonEDjrvhAlM1Me+Bp6p9PRvQ==
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com (2603:10a6:102:33d::18)
 by GV1PR02MB10489.eurprd02.prod.outlook.com (2603:10a6:150:166::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 08:14:16 +0000
Received: from PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9]) by PAWPR02MB9149.eurprd02.prod.outlook.com
 ([fe80::90a0:a4f0:72e9:58b9%3]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 08:14:15 +0000
From: Omer Shpigelman <oshpigelman@habana.ai>
To: Stephen Hemminger <stephen@networkplumber.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>,
 Zvika Yehudai <zyehudai@habana.ai>
Subject: Re: [PATCH 01/15] net: hbl_cn: add habanalabs Core Network driver
Thread-Topic: [PATCH 01/15] net: hbl_cn: add habanalabs Core Network driver
Thread-Index: AQHavWrVVuRHPTgJKUqRN0LFtHgrD7HH9LcAgAOtIoA=
Date: Mon, 17 Jun 2024 08:14:15 +0000
Message-ID: <5099c15f-412e-4015-ab75-dffe8ddacb7a@habana.ai>
References: <20240613082208.1439968-1-oshpigelman@habana.ai>
 <20240613082208.1439968-2-oshpigelman@habana.ai>
 <20240614170548.188ead0d@hermes.local>
In-Reply-To: <20240614170548.188ead0d@hermes.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=habana.ai;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAWPR02MB9149:EE_|GV1PR02MB10489:EE_
x-ms-office365-filtering-correlation-id: 74c976ed-d6e4-4311-b835-08dc8ea57aba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230037|1800799021|366013|41320700010|38070700015; 
x-microsoft-antispam-message-info: =?utf-8?B?ZThBdGhtY0pJYXFRd0VESUttaEZPTFh1THZPLzdvS2EwQ2xXY3JHT3J6MENX?=
 =?utf-8?B?eERYcE4zS3dsUjZMNVJzcU1jS3FjZnRWamJ2SllzbW54dmRtRVI0dUcwc3Jx?=
 =?utf-8?B?QWp2MnEyMHVoTGN1KzlNYVo2Q1ZFRlZjWjlGd3N1US9HNCtsR2tpWDFibFVi?=
 =?utf-8?B?cm90WE13U085bmo2OVhFNTh6cjVHVklIaHdTT09kUTVldlRnbjBkNnhsMWhq?=
 =?utf-8?B?RmJ5NXd5MkpNR29lWHRTaDVyTXQwK2gvNVBRUDZlU0R3bjArYnZ0clExMDZG?=
 =?utf-8?B?VUVKbWxwdStQMEVBWDNLSTFlL2I1N3YrNktkOTExaENLOEVEUnR1YTdQSCtL?=
 =?utf-8?B?ZlY3Sjg2cWhRVTNFWVZjT0E2TWRqVGJ2T1VzeUUzeTVmeEpiVlVSdXEya3FZ?=
 =?utf-8?B?T0JiSDE0bit1TFF3M2RpdTlNdk1QaTNGbkk1bUhwandrSTFzUXJZRTQwMllw?=
 =?utf-8?B?VThyY3VHWHRqSFJEVFBoWHpneGFSZ3F0cU9QK1UvQ3ByK1dZc2RRS2d5bU5a?=
 =?utf-8?B?dlR6OE00N1I4djZ1ZENQc1lHaE5QMjdSTHBpUjZMcWdERjJJa1N5R0dlSFlI?=
 =?utf-8?B?ODFZOXU0aGNsM0piSmsyRjFhTnJJMkNMUmJwb3dCaTg4aFJZZFVmK24reFgy?=
 =?utf-8?B?cUIxRFp1Ym9WdDMxdWVpMzRyRFhwUEtwcmRtU1RNL3FJY0tQVG9aNHhvOFVD?=
 =?utf-8?B?NjdrakVvdFdiYU9RNTlzNVNraTF0WWhMLzdUUEpzR08xU1krVlR5UGxnNlYv?=
 =?utf-8?B?V1krTTluNFpHbW9veEJpYnpvaXlBcVV2SDVBdmlIdmlUclZKaHh3UGxhVnBP?=
 =?utf-8?B?T2lFdkZwVlJWQVpNZHpyM2x5Nkltb2c0aURWaDF1RXZvVE1uT091UXhoV29i?=
 =?utf-8?B?bVR4SlA4SVpWWUtSUGsySlFhaVNrbHpKRGRkbmVUUzBob3I4Z24wWWlYUnY4?=
 =?utf-8?B?RHh1VWppVmNkdkRjWUthTG1RRHRmQzFtQTFvTk8wSFUveC9rTGdDNUFmY3Rm?=
 =?utf-8?B?OEZyemExZ0hvNHozWXhRRTREaVltT0xVT0U5SjJmSGxmemt3enhvZC9jZkNk?=
 =?utf-8?B?Sjc3cGpEREVqUzE2aVZXZWRFTmFZdTdEbDgray9CdVBGN085OWltRFNFT0sv?=
 =?utf-8?B?enkwK0VWQnoweUlTRGQzS1F6VGJsYUZvOEhHd2VNODR2aGxBYkdLWm5UMkZ2?=
 =?utf-8?B?NFl5YldwQTBtb3QvdkxDODZIaVVhVnNoT3Jaa1pNclVDcmoyNFB3WVJRYXFM?=
 =?utf-8?B?QmxwS3FhN1p6bUpnNjNrVXpOL292anNBbzJMdlRyU1VpZDFleG1TbmtYVE5H?=
 =?utf-8?B?VXBqM1F6enh3S0ZsbDJVcVlhaktMaVdBajdaTUJNMjU3dUpGVnB1ck5xWjNO?=
 =?utf-8?B?UlBnRzJlTTRIZkx0bVFmK0lyRFRsV1NDNks1dU9xTU0rZHhzMHp5VVNWWWRZ?=
 =?utf-8?B?b3hzQ0IzbVNmSTI5SHd1VjlpQVdoMlBEVXNMcnozZ3VsL0VzRXI1UTlyWkZn?=
 =?utf-8?B?RVJWN2JBQ09GVU5SRnBRN0dwTS9iNEVQOFcxcGtyeWFsOFVCZUNYekZrT3Z3?=
 =?utf-8?B?cEVpcysyWGhkZkJDSjYxRmJ1dEpYc3ViQitBWnpJSzg2OGxJNGFUL2VHZUxN?=
 =?utf-8?B?c21ybUNnUWo1VHlKWWZRZ1pWdkUyei8vQ29BZ0ZSRDRweTBLUWJmekZoNGxY?=
 =?utf-8?B?WEZ1VEJyOFVZcCsvZzlGVVNVMmdOcWtDSjlLN0UzSy8wb0k3UU0wc1NqcUFk?=
 =?utf-8?B?ZjV0dTcvREtYcEpZTSs5WGNYK3NCYjdYZmJhSCtSV0RaQWkvYVJBV2ZNZFpo?=
 =?utf-8?Q?z/yoKpm/IE1KdNelBpP6dKo/KW2wGJvY+z4LE=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAWPR02MB9149.eurprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(41320700010)(38070700015); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MG1yVGVKbk5EYkk3QVhyWEs3Y0ZPUVpqanZoMmRMKzFURXcveUhRRFdhdEZE?=
 =?utf-8?B?clI5d2dBNlU2Mm12WnBkbGQzNTlYcjNNY1ZVdkM0aFluaEM5RlEyOXE3bHF0?=
 =?utf-8?B?Y0lEbURJSU1tT05SbFYyRFgrbm53c0pnS0c4dEh2SWhuUk5MM2Vqc1VIMFR1?=
 =?utf-8?B?UXI2TCttVExDTHNBQXlpZnBYcENnWW5JM2pWR1lZeFpvWWE2MzZIMEN3MG9U?=
 =?utf-8?B?alRKQjZZb0w0TjY3UkpxYS9ySi9IZ1NVV1RXUDN3RGV1Vm8rV2NmU3JMcmh3?=
 =?utf-8?B?MTg3eTVENHBQM0lYV280SFN3cEpZOUJxLzlZM0V4MnVQbmNWRDJRNnp0d21o?=
 =?utf-8?B?cXZjY3JpV0dHZ0pDVEFJYysvSHdqbmFGWkJVZzMvb3RURi9YRERNNzJSWlNi?=
 =?utf-8?B?YjFZcndxMHFPdlhDS1ZKbXc3WnRuUktkVUJoVGs2KzZuUUV4cFhreVVhZC9F?=
 =?utf-8?B?RWJUemRTMTZFcDlYOWNkbjBMTUxCdGYwbWNrM2dnSmVDczR4L3UwRWFqSWYw?=
 =?utf-8?B?MkV3U0w4TjM4eE1Ma04vRTN2R1NSUllTM3J2SGNhai8yZUZVMmhVNTF4dHJu?=
 =?utf-8?B?cllENGFBSFV0UDdhdkg2Qm5VV1hRNHJNc1NhYkZadWdQanV1L1NPc1RBN0hI?=
 =?utf-8?B?dm8xTGxJdGduL1JGeDFiR3ltdUhjMUFGYzQvTzU3RElaVGYrOUNNTzA1ZjRh?=
 =?utf-8?B?ZUpkQ0VtT3ZVbzRJR1NSd3QwcXIyR09aL2FTaG1SaGg0OHJrVTM3Y040YVlu?=
 =?utf-8?B?aENTM2pRRi8ybWRLUytOeHBjL01Ob3lXLyt4WE9meHVkRzVCdml5ZU80d1Fy?=
 =?utf-8?B?TS9ZeHhpdDZJY0JpaCtsc0V3K0NCWWJRdllLRjluVlhCREgzMVQweXA2S1Rn?=
 =?utf-8?B?UWJFQ0RnVFd4YzR6QjlWT2liMWRFVTVGcEpPUTR4dnFzc1BXc2xtQm53Ujla?=
 =?utf-8?B?SDZ6bjNkS1VQZDhjcWRjUFpDVzhtMDUyRUIzaVVPOXRCZlVYYXgxeEN2MHJl?=
 =?utf-8?B?OGRCNzNBMHhCdUVISTlFSFYwbWZ1bzY2alQ1b3NQOWh3VTJUb3VGelFzcnRY?=
 =?utf-8?B?VXV5dWp4YzlIZk10OFBqSmNjTTNkVjB2SFZQTXl2K0NZMVMwaUVMZDh4bUd3?=
 =?utf-8?B?MzR5NXhTK0pSaHF0SU5FTHY4Vi9tdVpwRHVmeHZaTGJuOGp3N1p3dE85MVE0?=
 =?utf-8?B?TERobTNRWC9ydUpxL3FDd0pIa1BtSnMvdG0xUXJJVVQ0blkzdEgxelVaZGhO?=
 =?utf-8?B?V1hkbHAxSHdWdDlOT0twWk9JTVBaSkNzRFFoZS9aOTRmS3ZrQWlCRlFCeUQx?=
 =?utf-8?B?c2RqK0pGUUMvZlNWV2lpZktEWFNNQTZMQ1RSMWtkSzhOeEZldDkrWHEybFBN?=
 =?utf-8?B?WkRkVEVIdzlLMnBRb3RjZW1YaCs4TlZrTEZQUzFoMnRlemxKOUJaTUhVeGdn?=
 =?utf-8?B?M3JKMUVHMk14amd2UFBvYWViTm95YkdmUzFsYzc0SGR1ek0wQUN1alMvTEVY?=
 =?utf-8?B?d1pQc0tuNnZ2eDhNOUNlazFQa25qVGo4YjVIMFhFUjhxMURYWG5DbWZkaHY0?=
 =?utf-8?B?Qlh2elJGVy9xY3lSMFFHRFNmMFlYYy80M2xWQmg3cVovSWMxb1RCMzhmT0ZT?=
 =?utf-8?B?aE1FRUNJTUVBK2wxTDNoclcxSkxReEVCeHMwSmpMYi9Sb3FZVzJJTGpYcDl3?=
 =?utf-8?B?S0J2WGFKamp5USt6LzZ4aHB3aEVPL2NFb05WOU9FbEROQW5EVStVSGx3R0ZG?=
 =?utf-8?B?ZndNQlZ2YjVZbnFQWFBqVmxNbDVMMm14YnN4TkltUmhqb0pwRFRtQlBqWWoz?=
 =?utf-8?B?Q3Zvcm9QcFhycDJEUnJxZC81bmFNdThXVEpPZ3V0bHhVR0dyaXV0d3YvZ09O?=
 =?utf-8?B?bTRUQjRTSUtoZTluU09yRUxNcVRBN3loUlZvMnRTZ0ZkOGwyTnU1NVpNYVYy?=
 =?utf-8?B?NDFnUm03VTZYWUpySzBNM2tDaTdTZlRxeHhzcUN5ckhCZGR3OE9zMkZOMW5W?=
 =?utf-8?B?N3FmRE9tYjRRczRjNXJhOE9seTlsNVVvSWY2amZCK1FwRjFrTkVSS2xwUVRR?=
 =?utf-8?B?SEdGVU9PY2h4TzhobU1hakcwWk1PalA3c2hmajJZbEVQOHVCaGR3a1pXbiti?=
 =?utf-8?Q?3VTqCI5R4yc9xY72fMGYUUPDJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <831D911086E9C34F8D2572AF69687EED@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: TUJ9fdAPzA0BZ2jH1Vd1Zfy2HdsjWmLIsFiGbOagEeOone9AbkUTtLDhH03eUeyfo7VP8SOyUjoaqkTRkJG2AYtpJp9v6NnRah8lohke1VpbFRRZUxbnHtPMC4mjrEjS/8HHIe9fB9SjIfHkCQMvyyBE1DyxlyDiTVv9KotWnFkbDlmRlgQ91FnrSoZr12kDcrW6Aohq6hzMcTT5UvzVN9TTSxQpqbnqd6R5XwIGIqna9mi6HjYYR3aCiVuOwaEiBF+Lx6xvuMlX2AmXAxY6W4e3DyNwO1Ivl1LArxzk9WFkQDsdl37QlfOrT8t0Wtd/PelMyWs19u5Fu9uUdFMWaiVd7RHdcz0lHGQFjCOfQw6+9XiAlWtz7a0Cj9H7N5CRHCwwLHTAQmBt5hZET6EHRsVySbCWRxO9Yg66mVLXD3suM3zCBxjduehCc/5cJZIE5AH/+dNyhg9hRHxmWuaqydkZm3+uQIdvELGVeJr7UrSRZvgwITFKsVUZehT9SbvL8SAyHh59Fz+0gnsc2elrVUPl+tvipWxgr9/bn3r0VlwCWTfRaA3IT5UbXfum+9UoW8KCt3yBUfbF7fag/kMx73Yp3XfWQGy6ZygORNQ6gRajPRv7By5SSwWpZd2LP2xO
X-OriginatorOrg: habana.ai
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAWPR02MB9149.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c976ed-d6e4-4311-b835-08dc8ea57aba
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2024 08:14:15.9421 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d4d4539-213c-4ed8-a251-dc9766ba127a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Zi0Z7JCzFq2dzyeqXTHe7K8jYwZCxIgiZ4K36vWKMPfXWfHQVCPQrpmx8m6En27P/jve9p6vSEimgP+49fiX0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR02MB10489
X-MailControlDKIMCheck: cGFzcyBoYWJhbmEuYWkgW3Bhc3Nd
X-MailControl-OutInfo: MTcxODYxMjA4ODpGUEtleTEucHJpdjqoAFkA2Ohmhybp+lJ7LnbS0XfGysHN+RWtEeKOB+JwS/2L2OCI2VHDI/NgmvIisnM+LpMn88hXg5sYI9UU5oanZDKzPvbcNzubXfhUxDjJKDromTQ90Yx5ZZUmdvuwIho8UJtJbpSrP44wOYkVAuSZZ8TDTVpu/POjgxN5SkhZ887I8XmGpP5pMvddpxXa9R7p5MKX/lMj+d1EVrorgw1/ycR1UtAqrX5MIFqMT4bgsEOYHD+g+syngu5AS8wJJFIw+l7JXfPTGAcRdhJZMr3PhOpp0nC5dHY6ItTAThl7IQhS+BpYFAkde+K21LpSCz46xkZu/mVBUdb6isQEHqco
X-Scanned-By: MailControl 44278.2143 (www.mailcontrol.com) on 10.66.1.127
X-Mailman-Approved-At: Tue, 18 Jun 2024 07:29:33 +0000
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

T24gNi8xNS8yNCAwMzowNSwgU3RlcGhlbiBIZW1taW5nZXIgd3JvdGU6DQo+IFtZb3UgZG9uJ3Qg
b2Z0ZW4gZ2V0IGVtYWlsIGZyb20gc3RlcGhlbkBuZXR3b3JrcGx1bWJlci5vcmcuIExlYXJuIHdo
eSB0aGlzIGlzIGltcG9ydGFudCBhdCBodHRwczovL2FrYS5tcy9MZWFybkFib3V0U2VuZGVySWRl
bnRpZmljYXRpb24gXQ0KPiANCj4+ICsjZGVmaW5lIEhCTF9BVVgyTklDKGF1eF9kZXYpIFwNCj4+
ICsgICAgICh7IFwNCj4+ICsgICAgICAgICAgICAgc3RydWN0IGhibF9hdXhfZGV2ICpfX2F1eF9k
ZXYgPSAoYXV4X2Rldik7IFwNCj4+ICsgICAgICAgICAgICAgKChfX2F1eF9kZXYpLT50eXBlID09
IEhCTF9BVVhfREVWX0VUSCkgPyBcDQo+PiArICAgICAgICAgICAgIGNvbnRhaW5lcl9vZihfX2F1
eF9kZXYsIHN0cnVjdCBoYmxfY25fZGV2aWNlLCBlbl9hdXhfZGV2KSA6IFwNCj4+ICsgICAgICAg
ICAgICAgY29udGFpbmVyX29mKF9fYXV4X2Rldiwgc3RydWN0IGhibF9jbl9kZXZpY2UsIGliX2F1
eF9kZXYpOyBcDQo+PiArICAgICB9KQ0KPj4gKw0KPj4gKyNkZWZpbmUgUkFORF9TVEFUX0NOVChj
bnQpIFwNCj4+ICsgICAgIGRvIHsgXA0KPj4gKyAgICAgICAgICAgICB1MzIgX19jbnQgPSBnZXRf
cmFuZG9tX3UzMigpOyBcDQo+PiArICAgICAgICAgICAgIChjbnQpID0gX19jbnQ7IFwNCj4+ICsg
ICAgICAgICAgICAgZGV2X2luZm8oaGRldi0+ZGV2LCAicG9ydCAlZCwgJXM6ICV1XG4iLCBwb3J0
LCAjY250LCBfX2NudCk7IFwNCj4+ICsgICAgIH0gd2hpbGUgKDApDQo+PiArDQo+PiArc3RydWN0
IGhibF9jbl9zdGF0IGhibF9jbl9tYWNfZmVjX3N0YXRzW10gPSB7DQo+PiArICAgICB7ImNvcnJl
Y3RhYmxlX2Vycm9ycyIsIDB4MiwgMHgzfSwNCj4+ICsgICAgIHsidW5jb3JyZWN0YWJsZV9lcnJv
cnMiLCAweDQsIDB4NX0NCj4+ICt9Ow0KPj4gKw0KPiANCj4gVGhlc2UgdGFibGVzIHNob3VsZCBi
ZSBtYXJrZWQgY29uc3Q/DQo+IA0KDQpJJ2xsIGFkZCBjb25zdCB0byB0aGVtLg0KDQo+PiArc3Ry
dWN0IGhibF9jbl9zdGF0IGhibF9jbl9tYWNfc3RhdHNfcnhbXSA9IHsNCj4+ICsgICAgIHsiT2N0
ZXRzIiwgMHgwfSwNCj4+ICsgICAgIHsiT2N0ZXRzUmVjZWl2ZWRPSyIsIDB4NH0sDQo+PiArICAg
ICB7ImFBbGlnbm1lbnRFcnJvcnMiLCAweDh9LA0KPj4gKyAgICAgeyJhUEFVU0VNQUNDdHJsRnJh
bWVzUmVjZWl2ZWQiLCAweEN9LA0KPj4gKyAgICAgeyJhRnJhbWVUb29Mb25nRXJyb3JzIiwgMHgx
MH0sDQo+PiArICAgICB7ImFJblJhbmdlTGVuZ3RoRXJyb3JzIiwgMHgxNH0sDQo+PiArICAgICB7
ImFGcmFtZXNSZWNlaXZlZE9LIiwgMHgxOH0sDQo+PiArICAgICB7ImFGcmFtZUNoZWNrU2VxdWVu
Y2VFcnJvcnMiLCAweDFDfSwNCj4+ICsgICAgIHsiVkxBTlJlY2VpdmVkT0siLCAweDIwfSwNCj4+
ICsgICAgIHsiaWZJbkVycm9ycyIsIDB4MjR9LA0KPj4gKyAgICAgeyJpZkluVWNhc3RQa3RzIiwg
MHgyOH0sDQo+PiArICAgICB7ImlmSW5NdWx0aWNhc3RQa3RzIiwgMHgyQ30sDQo+PiArICAgICB7
ImlmSW5Ccm9hZGNhc3RQa3RzIiwgMHgzMH0sDQo+PiArICAgICB7IkRyb3BFdmVudHMiLCAweDM0
fSwNCj4+ICsgICAgIHsiUGt0cyIsIDB4Mzh9LA0KPj4gKyAgICAgeyJVbmRlcnNpemVQa3RzIiwg
MHgzQ30sDQo+PiArICAgICB7IlBrdHM2NE9jdGV0cyIsIDB4NDB9LA0KPj4gKyAgICAgeyJQa3Rz
NjV0bzEyN09jdGV0cyIsIDB4NDR9LA0KPj4gKyAgICAgeyJQa3RzMTI4dG8yNTVPY3RldHMiLCAw
eDQ4fSwNCj4+ICsgICAgIHsiUGt0czI1NnRvNTExT2N0ZXRzIiwgMHg0Q30sDQo+PiArICAgICB7
IlBrdHM1MTJ0bzEwMjNPY3RldHMiLCAweDUwfSwNCj4+ICsgICAgIHsiUGt0czEwMjR0bzE1MThP
Y3RldHMiLCAweDU0fSwNCj4+ICsgICAgIHsiUGt0czE1MTl0b01heE9jdGV0cyIsIDB4NTh9LA0K
Pj4gKyAgICAgeyJPdmVyc2l6ZVBrdHMiLCAweDVDfSwNCj4+ICsgICAgIHsiSmFiYmVycyIsIDB4
NjB9LA0KPj4gKyAgICAgeyJGcmFnbWVudHMiLCAweDY0fSwNCj4+ICsgICAgIHsiYUNCRkNQQVVT
RVJ4MCIsIDB4Njh9LA0KPj4gKyAgICAgeyJhQ0JGQ1BBVVNFUngxIiwgMHg2Q30sDQo+PiArICAg
ICB7ImFDQkZDUEFVU0VSeDIiLCAweDcwfSwNCj4+ICsgICAgIHsiYUNCRkNQQVVTRVJ4MyIsIDB4
NzR9LA0KPj4gKyAgICAgeyJhQ0JGQ1BBVVNFUng0IiwgMHg3OH0sDQo+PiArICAgICB7ImFDQkZD
UEFVU0VSeDUiLCAweDdDfSwNCj4+ICsgICAgIHsiYUNCRkNQQVVTRVJ4NiIsIDB4ODB9LA0KPj4g
KyAgICAgeyJhQ0JGQ1BBVVNFUng3IiwgMHg4NH0sDQo+PiArICAgICB7ImFNQUNDb250cm9sRnJh
bWVzUmVjZWl2ZWQiLCAweDg4fQ0KPj4gK307DQo+PiArDQo+PiArc3RydWN0IGhibF9jbl9zdGF0
IGhibF9jbl9tYWNfc3RhdHNfdHhbXSA9IHsNCj4+ICsgICAgIHsiT2N0ZXRzIiwgMHgwfSwNCj4+
ICsgICAgIHsiT2N0ZXRzVHJhbnNtaXR0ZWRPSyIsIDB4NH0sDQo+PiArICAgICB7ImFQQVVTRU1B
Q0N0cmxGcmFtZXNUcmFuc21pdHRlZCIsIDB4OH0sDQo+PiArICAgICB7ImFGcmFtZXNUcmFuc21p
dHRlZE9LIiwgMHhDfSwNCj4+ICsgICAgIHsiVkxBTlRyYW5zbWl0dGVkT0siLCAweDEwfSwNCj4+
ICsgICAgIHsiaWZPdXRFcnJvcnMiLCAweDE0fSwNCj4+ICsgICAgIHsiaWZPdXRVY2FzdFBrdHMi
LCAweDE4fSwNCj4+ICsgICAgIHsiaWZPdXRNdWx0aWNhc3RQa3RzIiwgMHgxQ30sDQo+PiArICAg
ICB7ImlmT3V0QnJvYWRjYXN0UGt0cyIsIDB4MjB9LA0KPj4gKyAgICAgeyJQa3RzNjRPY3RldHMi
LCAweDI0fSwNCj4+ICsgICAgIHsiUGt0czY1dG8xMjdPY3RldHMiLCAweDI4fSwNCj4+ICsgICAg
IHsiUGt0czEyOHRvMjU1T2N0ZXRzIiwgMHgyQ30sDQo+PiArICAgICB7IlBrdHMyNTZ0bzUxMU9j
dGV0cyIsIDB4MzB9LA0KPj4gKyAgICAgeyJQa3RzNTEydG8xMDIzT2N0ZXRzIiwgMHgzNH0sDQo+
PiArICAgICB7IlBrdHMxMDI0dG8xNTE4T2N0ZXRzIiwgMHgzOH0sDQo+PiArICAgICB7IlBrdHMx
NTE5dG9NYXhPY3RldHMiLCAweDNDfSwNCj4+ICsgICAgIHsiYUNCRkNQQVVTRVR4MCIsIDB4NDB9
LA0KPj4gKyAgICAgeyJhQ0JGQ1BBVVNFVHgxIiwgMHg0NH0sDQo+PiArICAgICB7ImFDQkZDUEFV
U0VUeDIiLCAweDQ4fSwNCj4+ICsgICAgIHsiYUNCRkNQQVVTRVR4MyIsIDB4NEN9LA0KPj4gKyAg
ICAgeyJhQ0JGQ1BBVVNFVHg0IiwgMHg1MH0sDQo+PiArICAgICB7ImFDQkZDUEFVU0VUeDUiLCAw
eDU0fSwNCj4+ICsgICAgIHsiYUNCRkNQQVVTRVR4NiIsIDB4NTh9LA0KPj4gKyAgICAgeyJhQ0JG
Q1BBVVNFVHg3IiwgMHg1Q30sDQo+PiArICAgICB7ImFNQUNDb250cm9sRnJhbWVzVHgiLCAweDYw
fSwNCj4+ICsgICAgIHsiUGt0cyIsIDB4NjR9DQo+PiArfTsNCj4+ICsNCj4+ICtzdGF0aWMgY29u
c3QgY2hhciBwY3NfY291bnRlcnNfc3RyW11bRVRIX0dTVFJJTkdfTEVOXSA9IHsNCj4+ICsgICAg
IHsicGNzX2xvY2FsX2ZhdWx0cyJ9LA0KPj4gKyAgICAgeyJwY3NfcmVtb3RlX2ZhdWx0cyJ9LA0K
Pj4gKyAgICAgeyJwY3NfcmVtb3RlX2ZhdWx0X3JlY29uZmlnIn0sDQo+PiArICAgICB7InBjc19s
aW5rX3Jlc3RvcmVzIn0sDQo+PiArICAgICB7InBjc19saW5rX3RvZ2dsZXMifSwNCj4+ICt9Ow0K
Pj4gKw0KPj4gK3N0YXRpYyBzaXplX3QgcGNzX2NvdW50ZXJzX3N0cl9sZW4gPSBBUlJBWV9TSVpF
KHBjc19jb3VudGVyc19zdHIpOw0KPj4gK3NpemVfdCBoYmxfY25fbWFjX2ZlY19zdGF0c19sZW4g
PSBBUlJBWV9TSVpFKGhibF9jbl9tYWNfZmVjX3N0YXRzKTsNCj4+ICtzaXplX3QgaGJsX2NuX21h
Y19zdGF0c19yeF9sZW4gPSBBUlJBWV9TSVpFKGhibF9jbl9tYWNfc3RhdHNfcngpOw0KPj4gK3Np
emVfdCBoYmxfY25fbWFjX3N0YXRzX3R4X2xlbiA9IEFSUkFZX1NJWkUoaGJsX2NuX21hY19zdGF0
c190eCk7DQo+PiArDQo+PiArc3RhdGljIHZvaWQgcXBzX3N0b3Aoc3RydWN0IGhibF9jbl9kZXZp
Y2UgKmhkZXYpOw0KPj4gK3N0YXRpYyB2b2lkIHFwX2Rlc3Ryb3lfd29yayhzdHJ1Y3Qgd29ya19z
dHJ1Y3QgKndvcmspOw0KPj4gK3N0YXRpYyBpbnQgX191c2VyX3dxX2Fycl91bnNldChzdHJ1Y3Qg
aGJsX2NuX2N0eCAqY3R4LCBzdHJ1Y3QgaGJsX2NuX3BvcnQgKmNuX3BvcnQsIHUzMiB0eXBlKTsN
Cj4+ICtzdGF0aWMgdm9pZCB1c2VyX2NxX2Rlc3Ryb3koc3RydWN0IGtyZWYgKmtyZWYpOw0KPj4g
K3N0YXRpYyB2b2lkIHNldF9hcHBfcGFyYW1zX2NsZWFyKHN0cnVjdCBoYmxfY25fZGV2aWNlICpo
ZGV2KTsNCj4+ICtzdGF0aWMgaW50IGhibF9jbl9pYl9jbWRfY3RybChzdHJ1Y3QgaGJsX2F1eF9k
ZXYgKmF1eF9kZXYsIHZvaWQgKmNuX2liX2N0eCwgdTMyIG9wLCB2b2lkICppbnB1dCwNCj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpvdXRwdXQpOw0KPj4gK3N0YXRpYyBpbnQg
aGJsX2NuX2liX3F1ZXJ5X21lbV9oYW5kbGUoc3RydWN0IGhibF9hdXhfZGV2ICppYl9hdXhfZGV2
LCB1NjQgbWVtX2hhbmRsZSwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBoYmxfaWJfbWVtX2luZm8gKmluZm8pOw0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIGhi
bF9jbl9yZXNldF9zdGF0c19jb3VudGVyc19wb3J0KHN0cnVjdCBoYmxfY25fZGV2aWNlICpoZGV2
LCB1MzIgcG9ydCk7DQo+PiArc3RhdGljIHZvaWQgaGJsX2NuX2xhdGVfaW5pdChzdHJ1Y3QgaGJs
X2NuX2RldmljZSAqaGRldik7DQo+PiArc3RhdGljIHZvaWQgaGJsX2NuX2xhdGVfZmluaShzdHJ1
Y3QgaGJsX2NuX2RldmljZSAqaGRldik7DQo+PiArc3RhdGljIGludCBoYmxfY25fc3dfaW5pdChz
dHJ1Y3QgaGJsX2NuX2RldmljZSAqaGRldik7DQo+PiArc3RhdGljIHZvaWQgaGJsX2NuX3N3X2Zp
bmkoc3RydWN0IGhibF9jbl9kZXZpY2UgKmhkZXYpOw0KPj4gK3N0YXRpYyB2b2lkIGhibF9jbl9z
cG11X2luaXQoc3RydWN0IGhibF9jbl9wb3J0ICpjbl9wb3J0LCBib29sIGZ1bGwpOw0KPj4gK3N0
YXRpYyBpbnQgaGJsX2NuX2NtZF9wb3J0X2NoZWNrKHN0cnVjdCBoYmxfY25fZGV2aWNlICpoZGV2
LCB1MzIgcG9ydCwgdTMyIGZsYWdzKTsNCj4+ICtzdGF0aWMgdm9pZCBoYmxfY25fcXBzX3N0b3Ao
c3RydWN0IGhibF9jbl9wb3J0ICpjbl9wb3J0KTsNCj4gDQo+IENhbiB5b3UgcmVvcmRlciBjb2Rl
IHNvIGZvcndhcmQgZGVjbGFyYXRpb25zIGFyZSBub3QgcmVxdWlyZWQ/DQoNCkknbGwgdHJ5IHRv
IHJlb3JkZXIgdG8gZ2V0IHJpZCBvZiB0aGUgZm9yd2FyZCBkZWNsYXJhdGlvbnMuDQo=

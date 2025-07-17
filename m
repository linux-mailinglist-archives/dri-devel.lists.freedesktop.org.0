Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E59BB08FAD
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 16:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7835010E83B;
	Thu, 17 Jul 2025 14:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kF7T0/xI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2082.outbound.protection.outlook.com [40.107.236.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D164B10E83B;
 Thu, 17 Jul 2025 14:39:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cUf5hACRsmkYeZ1y1T/eqcOhzFjoa+uHvIVF2vPhlB6xLhQ0debB+aqjS9sRanAdkdGG72R8l+hjckrAFNwBrOavZolmQI46QFfqRmDV5tjyXCHVOnmnsUqrAJe+6Nrth73ahxCbgDVKaJCupvZFAPAb2+BZvRWalLoev9iKJTQ6GOGnvffGOQon7vDYcsusEYetYheGAywbPQN0JWrDAe4erkEarLpwavMNVxhkvUu7EXJaCctHZo+He7EKWbnDcpSWMiwCx0gwus11cqS/KASBswVZOIkKw1a+z+3tkiIKCf3CdBm8hKYrNRSqhlMbPMUBB3gWQOwb9GmQQykm0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OStu62zSuIQHAle3LCU0v2ZRTYGmGpniPMPQ8dGj3Z4=;
 b=nhuR8kpYFFmk9w+R9dPEwxXa5fNhIXGtToD4JP2xmwCKCB6yVuVQsWXRioLCCS3mgIwGoex9iHRAXIVX9m3Dyvpey0xmjSQdL9xf2sPIHO1cyuSb3cOXxdHMk68DZFokz7/6h1xtlW/pOoKQhO0bB2zz/U8HHEQTnVLaKbUHk5reZBiHKRvtUG8LHrxkmXdMJD4FjWi7MCMUP37ZnYr6H20lIm4L6+sLy94DBWDQO4zyvy4HvZNEN/MJOmWrxJJ7alAARlJ6Jki31ca72A4zdryHKSRTv7jsdes4mqlB3UC4wdt21gaiGJXGVE81/0+7a1ADKJtstZn6TkzOXqJVZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OStu62zSuIQHAle3LCU0v2ZRTYGmGpniPMPQ8dGj3Z4=;
 b=kF7T0/xIQUBJ2Cgc/HYfWS+Vm3pJ805A2u+K+/ij63tL7GiKqLwZbb7v2NQfBMp8ep0CG34Z340/96kbRHqPP13rBZ+IzBKEJ0ib0Th3S+fGa70CkTcfB54ZbiaqrR9XadJTkmOf8Y2HlSiOU6ct6tGj+kkZOn7cAmbXjQpoEnY=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ2PR12MB8829.namprd12.prod.outlook.com (2603:10b6:a03:4d0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.24; Thu, 17 Jul
 2025 14:39:39 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.036; Thu, 17 Jul 2025
 14:39:39 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: Melissa Wen <mwen@igalia.com>, "Wentland, Harry" <Harry.Wentland@amd.com>, 
 "Li, Sun peng (Leo)" <Sunpeng.Li@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>
CC: "Hung, Alex" <Alex.Hung@amd.com>, "Liu, Charlene" <Charlene.Liu@amd.com>, 
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Subject: Re: [PATCH] Revert "drm/amd/display: limit clear_update_flags to
 dcn32 and above"
Thread-Topic: [PATCH] Revert "drm/amd/display: limit clear_update_flags to
 dcn32 and above"
Thread-Index: AQHb9yhimdXJd2sAV0ekpQZXo91gObQ2Yu6A
Date: Thu, 17 Jul 2025 14:39:39 +0000
Message-ID: <70ac7b1e-9a28-45ff-b7b2-ab0f4fe9030a@amd.com>
References: <20250717143738.84722-1-mwen@igalia.com>
In-Reply-To: <20250717143738.84722-1-mwen@igalia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|SJ2PR12MB8829:EE_
x-ms-office365-filtering-correlation-id: 2c035304-037e-4abe-34b4-08ddc53fc29d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?ZUNxSnhQcmxoYUNabmZxQjRSUy9rVW9uc0tzcVBjeFQxUm9oN2N1dk1DRGVu?=
 =?utf-8?B?S21XaWwyby9uRlVVM3p5Qm55TGlseHFSUGE2TlVNMjdNNlBwL3k3eGhiZm5I?=
 =?utf-8?B?dHFkci9lN3hJdXdNS2R0RTlMYVl6RDU1ZTE0amRxM1ZCeGpEOXlaUzFvV2VX?=
 =?utf-8?B?MGNoMitzbStkbmlLZHZiVVI5dGpyMlZ0bnNFVUd3dk4vZ1drbGZGYkowOG5Q?=
 =?utf-8?B?YzhZbTRWdG5BVENlMENzZUM3dUUwUldqMnFSdnAzMHZkMmRId2NpemR2TDBo?=
 =?utf-8?B?TE5CK0dUTmJydVprYnVack1TcEtBeGxxa1lRSkFFS0FYS0E3Nm8vS2w1bXpE?=
 =?utf-8?B?MFNwYTR4cEprdFpCLzVZR2tpb2ExVUpzUHkzWTBCbXk4SjcxUFVEL3BSN0R3?=
 =?utf-8?B?NmUvU2Q1T25XMTVZMFBRbkdSUjZLTGFURVNmb2Q1dVB5S053KzVQWGsrVWJm?=
 =?utf-8?B?U3RQY0ZxYWhVamErOGJUS3dJUk5wRTB1WnRrTmxMNWNmMWYzTW82dnkvNXBi?=
 =?utf-8?B?ejBobFcvTXhpY3RPbEE2R2JQVnd2U0tzSE1qbkV2ZVppTVMzTU1Uai9paE10?=
 =?utf-8?B?NXJwQ3hNbThJVTBXeHcrN3ErZWZvcXFDdGp3eEE5MU9FQW4rVXJadVg2QjVu?=
 =?utf-8?B?dFZuL2hpMVJheHQreDNXUXltRHh0YjB5SmhhMmd6K0Rmd1Y0V29MeTN6ZjB6?=
 =?utf-8?B?WGhHbU9kV1d6cmFYNW5YMmowOElJZXdkZ0JFR3hPZU1JMzdzb2RDLytqTURu?=
 =?utf-8?B?amZPTlNsR0ZqQ0RyaUNDRDR6ajhEOEJrYUtxaVVEYWpXWTdWVXdJYmplTlNk?=
 =?utf-8?B?a21tdnZzQ2FLU2xPYWZsTVV3cFVYcUxHM2RVcGZ0d1RJblR5L3gwSFl4M3Y4?=
 =?utf-8?B?U1UxR3d2UWg1Q0k4VzBNSFBhdTh6ZVBnZzdXTFRTY29NUTJrTFlhM0tCVDZV?=
 =?utf-8?B?bzgxYldzc3VITnJsTDlVdElwaEVNTnc5MERCcjRVMjV1K2lSZjd3bTVLTjNN?=
 =?utf-8?B?RkNocFhoTm1acm0yODUrMUtGUHE4N2t2SXdQYWVtNVBwMlRZdmlQZU85T1Uw?=
 =?utf-8?B?MmhxdHdmMDJMQzE0SUw0NW9ta1BiTzhZWXFaR2JJWHJoQWpPdmhRc3YxYVF3?=
 =?utf-8?B?SjRjR3ZURTYzKzIwTHBhSCtYY3hrc3BUcUYrcmxjSnJBZ3Q3RHJ5UGI5b0xm?=
 =?utf-8?B?S21iOFk5OWNxQzRJWDJkZVlZU2gvNm5IUnpMWFRpZWo0cmVqMzJ1ME9wNWRF?=
 =?utf-8?B?Ri9aa3MrYlhpdlVmdGxnRXlERmxPb1BYYThXajRvY0xWTW16R2Z3eFk3YlpN?=
 =?utf-8?B?N0tqRVhNZ0ZOSk02VjZkRjEvQ21aUmd6c1hpc3BDL0ZPaE1xUWQ5cStGV1FS?=
 =?utf-8?B?VlJYNU5NandZSCtTTHRxdExwS0lZWmtoaTVCWDBnWG1qMS93dnVlZWQ5SzdJ?=
 =?utf-8?B?UURmZzE5YmZHWEVHTnpiNFpxWldDZUViN2RjekYwWlErcDVPUWJvbmUxMUk2?=
 =?utf-8?B?dURXRlo3elFvUWQ1VG1XNTRMaDlFTU1sb3ZxSnloQ3lvemtQcy93eXVUZHJJ?=
 =?utf-8?B?OFF3VkpWLzV6Qk5HZ1JaOHFQNVJ1RTVsWnd2SDhIeExYVTdDOSt0TDZpOFZ2?=
 =?utf-8?B?Tkp2YmVCM0xoQUtRTkVqT1ptb3pjeHY5ejRNTXVSNmgwRnErSWs3OFRmaGVI?=
 =?utf-8?B?d2lZUlNlVWdRNldFTHpTWWttZUhVM1FyaGVva1gvV2JOSVYrOTF4YWRCUXJY?=
 =?utf-8?B?bk9YWW1ZTEt5ejRnZmFTN05Bb3grR3c0Z01DWDVMTkkvUGZ4OFZlbGliL2FH?=
 =?utf-8?B?bUdNSHRQa2NKT2NYamtjWS8rbVlKN3NBZkUwalRhSGxlaDI4SzYvU29mUXBD?=
 =?utf-8?B?OGZsYi9zc0xyb2x3Z2p6VTJqbFFCL24yYUI4WTF4c2NudW1xWi95dVdQak04?=
 =?utf-8?Q?WyStEjZU8QYN5hB0eSibZe7f4yoAV1jS?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(921020); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cExpWG02cHZqbW9BMGFtZGUwRURnRkZva0VCQ0padHJTQUYzT05VSnNLekU3?=
 =?utf-8?B?bGYxUElXcmpITDg5MmdGeHZRaGY5T1JJTzNNSm9aYktCdnorU0Jzb09JWmYx?=
 =?utf-8?B?SFdYTG5LczdPcmlYVmUxRitWQnl5WEVzdmRPamRoTDkvTG1JdEhNN0xJQW1N?=
 =?utf-8?B?cVF0VldSbTVQK1BVMjYrQ3hIVHNHL1N2WkR6MTZqU1JBcjV0N2JyV1FKWXFw?=
 =?utf-8?B?Y3NFemw3bFhDMWI0L0VJd0cyYW13OW5rMnhvS0s1T2pFdU5IZi9OSUZHcUZt?=
 =?utf-8?B?TXpIbkNpNmFwOGlqOEcyNmJrenRmaVNXc0FLSnN3c0VSclhXeEZJbEtUY1V4?=
 =?utf-8?B?OUZCa3JCVVZWdVQ2Y08yM0lLUTBKTE5TZnZvWS9HU1FFak9SM3FlVHJIa3Rh?=
 =?utf-8?B?azRwck04cDlYT3RiNERmMW9HN250dzZBVXBkVHFjeHFiRWxJVVZjUkpFMlFy?=
 =?utf-8?B?VXVwL3BuRGRad0loSE56dzZNMjlBZVpvdkdnZGRySzREbTZURnhTd2Ewd0hq?=
 =?utf-8?B?a0hBalIxcjYrS1NUSzZWdGpSQnhVVzhMV1NldVhqM3l1ZTNzaGxsR0tjTmcy?=
 =?utf-8?B?R2YzNXVxYU04UjhjRmxYMXUwNnBmTzVtVTQxWW15T1RlMTNKUmtiUDUvVDho?=
 =?utf-8?B?S25XQjR0ZFordm1vR094WUVCZWJ4NkRycVFwUWY5NFNMVy9xNXJyRVFKLzh3?=
 =?utf-8?B?Yy8vSS9EYmdkYm85WDNnSkFOK0w1NzBGS3VBUGJ3N1Bla3VuSU5EbEtJM3lS?=
 =?utf-8?B?Qis5T3lZaHQ2eVc0dFJ4V3FOZTZ4Vis3ME5MOTlMZGVBMGpvYW5DRWlDWDlD?=
 =?utf-8?B?QjEzd0gxSUJyYWZwcDY2azRCaElJbmNhSVA3YmJGZTZrV2hjOHRSZ1QvcjZN?=
 =?utf-8?B?bjJiVWFnVFBtZXRRQWZ4YUc3UlJPTTkxOEd2OUZSSWx1Q0k3aWNSUklseXEy?=
 =?utf-8?B?OU4zbGtCTmxEeHJadEVwWWt1MlFvblhjbUZYRWxKQ0hNWllYTWhZbjZldTBV?=
 =?utf-8?B?d1VEWHc2TVpSZEtjeDZqRkxrSnhOZHVlSmI1L3ZwRG82RHVVTE54MmRaS3ha?=
 =?utf-8?B?TEVwclBFUkRnTlVlMG5JbU8yK2tUSVdlalN1dzJ3d1ZVVTA5aXgyYW1LVFJK?=
 =?utf-8?B?Z29vUUVkYjNuUFNZUDd4enBLbDlLNTJiTlhMSEVsUjYwUllrM2RvWHFHejRo?=
 =?utf-8?B?bVdtQ0grTk9hb0tQUmRDWStUUU45dFFOZU8vdEJjdjBIMFQrZVEvNFNNYnIw?=
 =?utf-8?B?N3I4N2xYNDBqRi9Ca2hxQlMyTk1MSEpTUXdkN2Q4ZW4wRmlBN3N5cmZSdnQ2?=
 =?utf-8?B?QXlzM280N2E0TzNsbjM4NXkvUzZKMjNiOGcxZWIvVjFFNCs0OCt6Uy9uY1lR?=
 =?utf-8?B?QjQ1VW43WGxDdWNta0NXTlAwelM1TEQ5WDVlL2duUjdwWUNIQzFtcDU4b3Bk?=
 =?utf-8?B?Y0dUcHNZLzk0K25zQkhMQkw1NmJMN1Jydzd0bWpwK21BRzBGQUJheUt1ci9s?=
 =?utf-8?B?YjFtOWpISXp5Z0UxcGtFbm1WQ3pFem03Z1Qzd1hrODNaSFN6QU9DekQrZ1l0?=
 =?utf-8?B?N2VrVUoxRmdBS2VlN3FPN0dNbVVMK0hiTEw4cE9WeXljNzRQWlZ2ZWNxWlB4?=
 =?utf-8?B?U1FJTlZwQ3FjSmx5MkRiMkUyOEF2NUcvK0licWZPVUhkc3BoZ2pDVG1GeW9t?=
 =?utf-8?B?cnpWQlhIM3pBQkRkcEZvb3liYTJUZ0FyQ2dsbUFKREZkQ0g1N1dkRzN6YWdY?=
 =?utf-8?B?ZnEvS0t3TFdXTVIwaGZkV0Vyd1ZIaS9BaURTOVhOSmZyZlQ0MnZSVVhBV2JZ?=
 =?utf-8?B?MVlIdmg5MWtRMTUwSUFMekFVR3ZmY0tncUQvczBtc3JHbEcyZUdOSmlnMmNZ?=
 =?utf-8?B?d1kyQjdITElqeFd2djhSUnlMY0dZazNoUTFyaVBReXZ4N3Y2cWVNNDUzTE04?=
 =?utf-8?B?OTlYa0FPUUtDQWZLVmRTQ0g4U2ZUZjZGZ21JT3lleERNL0c5VnNPeXFGWC9T?=
 =?utf-8?B?VG5mYnYyN3dRc0FmRmhxZEM0OG1lb0I3cDFUWUNWNFpaaEowK0tHdWRxb3pz?=
 =?utf-8?B?K1ZpNUVrN1ZaNWZobkFxNUR3VU43K1hDYyt1bVdOQXd4S3Z3VUVMdUlsa0I5?=
 =?utf-8?Q?xFg4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8F29916EC4EE694DBDFB9872E43BEE85@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c035304-037e-4abe-34b4-08ddc53fc29d
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2025 14:39:39.4715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /DgAKPrmmfKjnL9qfB5BTODe4JTtmZHzDyDtxTX5CqTXzu+Ws8G/uTWHvbdKbEzEpzrYgzGPxgfImXuSG6DsVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8829
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

T24gNy8xNy8yNSA5OjM2IEFNLCBNZWxpc3NhIFdlbiB3cm90ZToNCj4gVGhpcyByZXZlcnRzIGNv
bW1pdCBlMWJkNWUwYmI0Y2EwZDYzM2FkNjk4YWJkMzY1OGY4MjY1MDA5YjgxLg0KPiANCj4gVGhl
IGNvbW1pdCBjYXVzZXMgYSByZWdyZXNzaW9uIGluIFN0ZWFtIERlY2sgKERDTiAzLjAxKSwgcmVp
bnRyb2R1Y2luZyBhDQo+IGZ1bmN0aW9uYWwgaXNzdWUgcmVwb3J0ZWQgaW4gWzFdIHRoYXQgd2Fz
IGZpeGVkIGJ5IGNhbGxpbmcgdGhlDQo+IGNsZWFyX3VwZGF0ZV9mbGFncygpIGZyb20gY29tbWl0
IDc2NzFmNjJjMTBmMmEuDQo+IA0KPiBPbiBTdGVhbSBEZWNrLCB3ZSB1c2UgbXVsdGlwbGUgaHcg
cGxhbmUgY29sb3IgY2FwcyBhbmQgdXAgdG8gdHdvIG92ZXJsYXkNCj4gcGxhbmVzIHdpdGggZHlu
YW1pYyBwaXBlIHNwbGl0IHBvbGljeS4gSS5lLiB3aXRoIDEgcHJpbWFyeSArIDEgb3ZlcmxheSwN
Cj4gdGhlIGRyaXZlciBzcGxpdCBwbGFuZXMgaW50byB0d28gKHdpdGggNCBwaXBlcyksIGJ1dCB3
aXRoIDEgcHJpbWFyeSArIDINCj4gb3ZlcmxheXMsIHdlIGRvbid0IGhhdmUgZW5vdWdoIHBpcGUg
Zm9yIHNwbGl0dGluZy4gR2xpdGNoZXMgYXBwZWFyIGluDQo+IHRoaXMgcGlwZS1zcGxpdCB0cmFu
c2l0aW9uIG9mIDEtMiBvdmVybGF5IHBsYW5lcywgaWYgdGhlIGRyaXZlciBkb2Vzbid0DQo+IGNs
ZWFyIHVwZGF0ZSBmbGFncy4NCj4gDQo+IEJlc2lkZXMgdGhhdCwgdGhlIGlzc3VlIHRoZSBjb21t
aXQgZTFiZDVlMGJiNGNhIHRyaWVzIHRvIGFkZHJlc3MgWzJdDQo+IGlzbid0IGZ1bmN0aW9uYWwu
DQo+IA0KPiBMaW5rOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lz
c3Vlcy8zNDQxIFsxXQ0KPiBMaW5rOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJt
L2FtZC8tL2lzc3Vlcy80MTI5IFsyXQ0KPiBTaWduZWQtb2ZmLWJ5OiBNZWxpc3NhIFdlbiA8bXdl
bkBpZ2FsaWEuY29tPg0KDQpDYW4geW91IHBsZWFzZSBkb3VibGUgY2hlY2sgdGhlIHVzZSBjYXNl
IHRoYXQgcHJvbXB0ZWQgDQplMWJkNWUwYmI0Y2EwZDYzM2FkNjk4YWJkMzY1OGY4MjY1MDA5Yjgx
IGluIHRoZSBmaXJzdCBwbGFjZT8gIElFIFdpdGggDQp0aGlzIHJldmVydCB5b3UgcHJvcG9zZWQg
ZG8geW91IHNlZSBhIHRyYWNlYmFjayBvbiB1bnBsdWcgb2YgZXh0ZXJuYWwgDQpkaXNwbGF5Pw0K
DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjLmMgfCA1
ICsrKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29y
ZS9kYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYw0KPiBpbmRl
eCBjMzFmN2Y4ZTQwOWYuLjdjNDhmNzJlNTkxNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kYy5jDQo+IEBAIC01NDQzLDcgKzU0NDMsOCBAQCBib29sIGRjX3Vw
ZGF0ZV9wbGFuZXNfYW5kX3N0cmVhbShzdHJ1Y3QgZGMgKmRjLA0KPiAgIAllbHNlDQo+ICAgCQly
ZXQgPSB1cGRhdGVfcGxhbmVzX2FuZF9zdHJlYW1fdjIoZGMsIHNyZl91cGRhdGVzLA0KPiAgIAkJ
CXN1cmZhY2VfY291bnQsIHN0cmVhbSwgc3RyZWFtX3VwZGF0ZSk7DQo+IC0JaWYgKHJldCAmJiBk
Yy0+Y3R4LT5kY2VfdmVyc2lvbiA+PSBEQ05fVkVSU0lPTl8zXzIpDQo+ICsNCj4gKwlpZiAocmV0
KQ0KPiAgIAkJY2xlYXJfdXBkYXRlX2ZsYWdzKHNyZl91cGRhdGVzLCBzdXJmYWNlX2NvdW50LCBz
dHJlYW0pOw0KPiAgIA0KPiAgIAlyZXR1cm4gcmV0Ow0KPiBAQCAtNTQ3NCw3ICs1NDc1LDcgQEAg
dm9pZCBkY19jb21taXRfdXBkYXRlc19mb3Jfc3RyZWFtKHN0cnVjdCBkYyAqZGMsDQo+ICAgCQly
ZXQgPSB1cGRhdGVfcGxhbmVzX2FuZF9zdHJlYW1fdjEoZGMsIHNyZl91cGRhdGVzLCBzdXJmYWNl
X2NvdW50LCBzdHJlYW0sDQo+ICAgCQkJCXN0cmVhbV91cGRhdGUsIHN0YXRlKTsNCj4gICANCj4g
LQlpZiAocmV0ICYmIGRjLT5jdHgtPmRjZV92ZXJzaW9uID49IERDTl9WRVJTSU9OXzNfMikNCj4g
KwlpZiAocmV0KQ0KPiAgIAkJY2xlYXJfdXBkYXRlX2ZsYWdzKHNyZl91cGRhdGVzLCBzdXJmYWNl
X2NvdW50LCBzdHJlYW0pOw0KPiAgIH0NCj4gICANCg0K

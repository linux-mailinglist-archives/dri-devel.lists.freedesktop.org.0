Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B217EE727
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 20:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0CA10E677;
	Thu, 16 Nov 2023 19:08:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D601610E678;
 Thu, 16 Nov 2023 19:08:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ku5oispzhrF6AK3gLX/7eEnCi6j0n4CO/MJPAuMtXg3fwZdmpK6R7EiS753GTbApgUqUjECU/s0BtVk0CVfgp8IxpdEpFjf/zAvFpDK+G7GkPc9CpGUzgpamBzP5PEDrdx726Kv66OnYtocFE/xL3k42ga+NRPnXq1/cAiigKUzNqIDs8RopsVjI8x0vP0pPWtVk9/AuUfMXnML3blyOTxOYdxF17TDtah+oHO6z3YPprKJ8Ny0wf66BQGdD3p7qXk7qCWSXD3uU+TU5W9bdeFUoYdD8JPbAadxSKvX7gxY44ml+EgnroK6k2UpGPQQlV0+7hCSvwu2IlW27kw2yWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ahGtXH5QMQPOb3F/QkR/bozwf7S8VTTad0calEu8/A=;
 b=lJltx15BKVrJ0ELtdfGyICSqCdia8+a1skZ0Y6BZJNPIZCtprQDxabYYRpJPUja5JFdCyQhfKePU9pmgFt9pE8u9p0tAaeYLfHiEtMfDMD/M3GVxS2RN9JTi7GWOoaa+l2D4TxXEbky5l4WPPz22iK/JmRmPK5jhuCRtp1RPIdJXdUeGkNukaQyGbgmCxPe9n82cbVMVspjauDE4OLZK7wmPDCN79Kobd6fSEIIN//33K8HNR6AcgjEFzRLhvyvdKK4F/9h6uSnjQGAxONf2Yfe/cB/7bRakcpz+kuhHCPZQtANIYAicX3qJy4vC08D4ROIuWGFX19FkqoPcC41EiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ahGtXH5QMQPOb3F/QkR/bozwf7S8VTTad0calEu8/A=;
 b=txweqjO6lJehhQoEPssmWR5sjqob8YQQkHXLGHdj8+bfsFnARS3aKPRPEh82XjuQYkrFfrlBAVxVkRKzeN/ohbhva770ZMhW6L+gfAr0YiNlTcQTz0rXwlpBqIVZ8mvd9K4v+hICRZ+j5LE1/ycabru71AYTIsKsfjP7CJO7ePVu8Pgn/kBST3q78TE5euoIOByDdQxGqS2IEOYZzy2VA62L93LyaY9OX+dlqtEe/IUyz75NtpqDVFdDhPbrUZkkjUz4b6lOSrusZBILXKpgmSD+9fKFtm08yS+6MHfTFa3ngwLC9fLHh8F345xN0E+UKFw78nuOeqzIXtKUC0kZkA==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by PH8PR12MB7351.namprd12.prod.outlook.com (2603:10b6:510:215::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.20; Thu, 16 Nov
 2023 19:08:47 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 19:08:47 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>, "kherbst@redhat.com"
 <kherbst@redhat.com>, "lyude@redhat.com" <lyude@redhat.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "dakr@redhat.com" <dakr@redhat.com>, 
 "gustavoars@kernel.org" <gustavoars@kernel.org>
Subject: Re: [Nouveau] [PATCH][next] nouveau/gsp: replace zero-length array
 with flex-array member and use __counted_by
Thread-Topic: [Nouveau] [PATCH][next] nouveau/gsp: replace zero-length array
 with flex-array member and use __counted_by
Thread-Index: AQHaGLhk0tg241wav0u8A6kt0NXJMLB9TzQA
Date: Thu, 16 Nov 2023 19:08:47 +0000
Message-ID: <f69f9fa30c95f1dcfd0513cd90527a92029a42c7.camel@nvidia.com>
References: <ZVZbX7C5suLMiBf+@work>
In-Reply-To: <ZVZbX7C5suLMiBf+@work>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|PH8PR12MB7351:EE_
x-ms-office365-filtering-correlation-id: 2c357793-959f-4305-002e-08dbe6d775d7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZjkG1hfDAju3SYrvVtukmBPoKNZ1oqx30OXWmoerVTckSWwphl3yotrRMHsG9hQKuvHrXJ+ejflay916ZeKPKv3qpTmEgcwH6ZIfJt0lQv/EMtr34j66o9Yy17ppbSdGuAc4ABbup7s8fi3IxoKCwjlzk4caSO/Wy3Sx5oMpjaeDUMm/Wj6AB5FvvP5K7eGYK8xCTbbK86I53L3gwudoXpk27ekMaq+wQ0qa4E6jW30IoF1XimyxSRhijHWrF1fZDMnpjVRuQcak+YnzFDu7zIND5B1fM9+mT30YnDX5KTLprl3QqhFjaj6eAKTcSaBXEs1dKrYJ3wqkP7BrSA5ZUZTOF4d46BuI8uK+V8VjTTwpuqauFN/Znn3DUdmRwg4xuY8CpAYm7VtC+JbBZCGyEXDK6oJmRXAQSI5XfpP71bFZbqCbSOkfcXxKpYLolNadysE+eqYVGQHNxRJqfuMCcjr7MyOeXQoQWO4vPZmomPdQZMzWzIxeF8m6ELQSa01AjKqWueCagF5iobgw7Jf3XR6kck1pjojPK2kxQ7cIHPySY39ciJvuDrz2f9zZ1bjctT9xzBrujpSmPJ6QN5GdM+DaBSp/i4vRg4d51UxCglkaBVIjFcXFwSufdqxWo5fFJHG/t2ZBBSHHd3pLZeEQe9H4X8Liv9gc1cDLQ3i1Q8I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(39860400002)(396003)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(122000001)(66946007)(26005)(36756003)(86362001)(38070700009)(6486002)(966005)(2906002)(4326008)(5660300002)(8676002)(7416002)(8936002)(110136005)(54906003)(316002)(91956017)(76116006)(64756008)(66446008)(2616005)(41300700001)(478600001)(6506007)(4001150100001)(4744005)(71200400001)(6512007)(66476007)(66556008)(38100700002)(166002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RGszNjFjNGxmNSt0THJITnlheWxLaklhRlZGaU4zRmpxUm14KzBUVHdhQVJx?=
 =?utf-8?B?YW93N1EwK05aOThER1NWYnVhcFRLQUJPdExRMHlLbFpaRTdGM1dQOHpuV04y?=
 =?utf-8?B?SjZoR1duMGd6NVRFT09VMFhEL0xsaGNDQkdFR3BmY1c1QlZVSS9ZeTdETFA3?=
 =?utf-8?B?OTc1ZnFCYUF1KzJEOEZuTnZJT1RiUU54SWZ1T2FhekcyS1o2eUluV3VvbTkw?=
 =?utf-8?B?bUN4MjRLQWdPTmR3VWdIUDVjaFVRUmFnWUtzT3BRQngzdXRDTnd3VVBGRGpu?=
 =?utf-8?B?QzZhWUxKeGRoOG1JNjQxUVQrYjNUMkdSV2ptbHAwT05PdWJtZ0t2M3F3Y0FF?=
 =?utf-8?B?ODBQcm5oOFA2aGg4UUtuem5IY1NxOXBCcm1VWDc4cnEzU2Rrb3NobCtTb091?=
 =?utf-8?B?ODV4SzdCanJJTFVLd1FTelZrZXAwaldkZzZwTlVyKzM0dG1jSlhIWVNMUzFq?=
 =?utf-8?B?UndSb05BZWhPMjZwM0xYWGRoOGJCK2NERjZDelh4MzBRdVlGaGRjNHhYSTd3?=
 =?utf-8?B?SjJaNG5zNnJuYUg4NWlDM1RHTGRQK0NMWFY1UXJ4Uzh4Y3dEU013YnM4VlJp?=
 =?utf-8?B?WkFTMURJSFZTU2RqU212NUE4OHd2clF3YjY2L1JVNDVuRnVSNFB6SzV6WUhr?=
 =?utf-8?B?bC8zckxHU2plVWkvRk44QjZZRCt1TFRkcXdIQ0I0Z3hoZ3B3SURoMy9Vdk5U?=
 =?utf-8?B?ZmhCblRoUkhQRDE0UGtpekdnVGhObDZ4MDFiOWEvbXJkOUNjdk1VWWptdExs?=
 =?utf-8?B?UWVYRDVqbUR6UTRxMDI3UDFBa1o2cWdmQ3lrZEpHcGlLaXVaeUJsQWM3a0dZ?=
 =?utf-8?B?dldPbGRLMG5ZQWo4bmMwYW84aGMvZldFak1ubmMvV3FsRHAxdmEzMWZRZkc0?=
 =?utf-8?B?VnJXTU9NVTZBY251RStDYXExMjlyV1dHMGtpdFBnQ1dJbVE2RjhKT3FhcjdG?=
 =?utf-8?B?NVZHTUZOOXlJVnRsbHowaFZKSC9PUG5QNk9TbCtrcG5OUEYyc1M2L28zdHE4?=
 =?utf-8?B?QVpPU1BMVTJpSTB3bTlJb0dBTlRJOUdzK09FWXhrOVArWGtiMWNMNXRzbHla?=
 =?utf-8?B?ODM3VU00QjRudDkrVEROWW5DWmFhTDJ4YkV1RjdFYVpuTmdDZWVlZUpiMmIx?=
 =?utf-8?B?M1lMRkV6TXRPaDR4Uld2YTdKMU5seExTbnI2MjVtZ3U5YjFRSTgxNEtNWGE3?=
 =?utf-8?B?NmZqb1JsK1NhOG5tak9NOGQrZVZveFdMQjBnNDlGNHRSY2lEY2Z2L0JWTllP?=
 =?utf-8?B?ZHlFYjJNVENxK3JvWDBjY3kzeTkxUnpvWHloMFh1ckIyMnd1U3BGakVNd01U?=
 =?utf-8?B?Rjh2WmhFV01BUGM4T2xOSlg4WFZENWRJZHdFRWU4VG1KTmVCSUl6SWFsTjRW?=
 =?utf-8?B?eHNuZXJFUmxpUWxGdXQveGVURzNBZjVGdm9lRnZWRlo2L0hXNGtqQkp1ZVZH?=
 =?utf-8?B?WTNPeE1oL2tyeUJVU1c5WGEzaDFJbGFTVHR5Z2IyRGNORGJZK3p3aytoaWhB?=
 =?utf-8?B?NFhqZStITWVpSmdkdVVPNVJlWFYwWEVlT2ZmTU9jWUNmc0tJaitLK2FSZDV5?=
 =?utf-8?B?K2tQY3RkOEJXVkFKemVSQjFlTWxDYXYyZ1hqMUhLY0JNdlRsVTk5OXV1VDB1?=
 =?utf-8?B?NlFWRlRXVTF2eDZyOFNWSGxtQUVFN1hBekN5NSt6S0UzemFmdGdjTUw0UXdx?=
 =?utf-8?B?Tm0xdkJrNzNPczh2ZFBCUWlMVW1KYkpPd2hldGxENEVDRU40Ujc2WjcvcEIw?=
 =?utf-8?B?QVNvOEF3ME5WR3RUbS9HUTBhRFZNZ00yWTJNUDZMVytQRWtwcVM1Q0Ftdytv?=
 =?utf-8?B?WVdhTXh3L2dIcVZPaFA2VE1ENlRTUjNudm0zeWtqdEY3a1ZoUXp5QXZPcm4y?=
 =?utf-8?B?ejY1OXM0dmdNOTZNdXNId1hkUllyOWRYNmx1LzNNd29KRmFaQTY2cUdxQ2R5?=
 =?utf-8?B?TW9TK2tnMENMYkhCSFRRcG9KVEN6RVJHZUNLakg0a1pDRFlzREgwZnJvbUxV?=
 =?utf-8?B?UzZBbVAvTU5sNGlzZjVEYTFGVExBV25vN3VuRzh3STFJaDZocjZRSmVmM0Yw?=
 =?utf-8?B?Y2kraytsSGtHaURNeWZ1RFRCb0FpNmFDWlpYdW40cXZhQU5CY00wMFloRVNs?=
 =?utf-8?Q?3Vn2C+Jyizb8sPPHTQkiD6xyY?=
Content-Type: multipart/alternative;
 boundary="_000_f69f9fa30c95f1dcfd0513cd90527a92029a42c7camelnvidiacom_"
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c357793-959f-4305-002e-08dbe6d775d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2023 19:08:47.1843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GK+m1kTiqH/e/NVZaBvV2cz+tRCXJymigFuYixAmxcGMTQMptdQ2fYrKksvhKi6HhEVZw5bBIfDRgwHvxIAJVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7351
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_f69f9fa30c95f1dcfd0513cd90527a92029a42c7camelnvidiacom_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIzLTExLTE2IGF0IDEyOjExIC0wNjAwLCBHdXN0YXZvIEEuIFIuIFNpbHZhIHdy
b3RlOg0KIHR5cGVkZWYgc3RydWN0IFBBQ0tFRF9SRUdJU1RSWV9UQUJMRQ0KIHsNCi0gICAgTnZV
MzIgICAgICAgICAgICAgICAgICAgc2l6ZTsNCi0gICAgTnZVMzIgICAgICAgICAgICAgICAgICAg
bnVtRW50cmllczsNCi0gICAgUEFDS0VEX1JFR0lTVFJZX0VOVFJZICAgZW50cmllc1swXTsNCisg
ICAgICAgTnZVMzIgICAgICAgICAgICAgICAgICAgc2l6ZTsNCisgICAgICAgTnZVMzIgICAgICAg
ICAgICAgICAgICAgbnVtRW50cmllczsNCisgICAgICAgUEFDS0VEX1JFR0lTVFJZX0VOVFJZICAg
ZW50cmllc1tdIF9fY291bnRlZF9ieShudW1FbnRyaWVzKTsNCiB9IFBBQ0tFRF9SRUdJU1RSWV9U
QUJMRTsNCg0KV2VsbCwgaXQncyBiZXR0ZXIgdGhhbiBtaW5lOiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyMzExMDcyMzQ3MjYuODU0MjQ4LTEtdHRhYmlAbnZpZGlhLmNvbS9ULw0K

--_000_f69f9fa30c95f1dcfd0513cd90527a92029a42c7camelnvidiacom_
Content-Type: text/html; charset="utf-8"
Content-ID: <C44D111CE511B64083ECA16041FF80A7@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjwvaGVhZD4NCjxib2R5Pg0KPGRpdj5PbiBUaHUs
IDIwMjMtMTEtMTYgYXQgMTI6MTEgLTA2MDAsIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6PC9k
aXY+DQo8YmxvY2txdW90ZSB0eXBlPSJjaXRlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7IGJv
cmRlci1sZWZ0OjJweCAjNzI5ZmNmIHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KPGRpdj4mbmJz
cDt0eXBlZGVmIHN0cnVjdCBQQUNLRURfUkVHSVNUUllfVEFCTEU8L2Rpdj4NCjxkaXY+Jm5ic3A7
ezwvZGl2Pg0KPGRpdj4tJm5ic3A7Jm5ic3A7Jm5ic3A7IE52VTMyJm5ic3A7Jm5ic3A7Jm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHNpemU7PC9kaXY+DQo8ZGl2Pi0mbmJz
cDsmbmJzcDsmbmJzcDsgTnZVMzImbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsm
bmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJz
cDsmbmJzcDsmbmJzcDsgbnVtRW50cmllczs8L2Rpdj4NCjxkaXY+LSZuYnNwOyZuYnNwOyZuYnNw
OyBQQUNLRURfUkVHSVNUUllfRU5UUlkmbmJzcDsmbmJzcDsgZW50cmllc1swXTs8L2Rpdj4NCjxk
aXY+KyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwO052VTMyJm5ic3A7
Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7IHNpemU7PC9kaXY+
DQo8ZGl2PismbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDsmbmJzcDtOdlUzMiZu
YnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNw
OyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyZuYnNwOyBudW1FbnRy
aWVzOzwvZGl2Pg0KPGRpdj4rJm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5ic3A7Jm5i
c3A7UEFDS0VEX1JFR0lTVFJZX0VOVFJZJm5ic3A7Jm5ic3A7IGVudHJpZXNbXSBfX2NvdW50ZWRf
YnkobnVtRW50cmllcyk7PC9kaXY+DQo8ZGl2PiZuYnNwO30gUEFDS0VEX1JFR0lTVFJZX1RBQkxF
OzwvZGl2Pg0KPC9ibG9ja3F1b3RlPg0KPGRpdj48YnI+DQo8L2Rpdj4NCjxkaXY+V2VsbCwgaXQn
cyBiZXR0ZXIgdGhhbiBtaW5lOiA8YSBocmVmPSJodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwv
MjAyMzExMDcyMzQ3MjYuODU0MjQ4LTEtdHRhYmlAbnZpZGlhLmNvbS9ULyI+DQpodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvMjAyMzExMDcyMzQ3MjYuODU0MjQ4LTEtdHRhYmlAbnZpZGlhLmNv
bS9ULzwvYT48L2Rpdj4NCjxkaXY+PHNwYW4+PC9zcGFuPjwvZGl2Pg0KPC9ib2R5Pg0KPC9odG1s
Pg0K

--_000_f69f9fa30c95f1dcfd0513cd90527a92029a42c7camelnvidiacom_--

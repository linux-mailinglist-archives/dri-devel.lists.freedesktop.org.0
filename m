Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779CBAE62CC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 12:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FEA10E081;
	Tue, 24 Jun 2025 10:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="Wnx7W8/4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BCAE10E081
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 10:46:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xFx+Md3b2EB99pv7yHglFMlIkuByH1sd08RnI26to2GffWE50ZVX88z7Z6dZlB7VoUugvqaS0jYOihDLHPBQ+4xi+mBG4eHIdj9QDgXxivJ0TgU/qzPneoYjQu51lCg6pe5gkk+CMNiFRk9eS2XyOCQ4UWU3bB513XsJrtvWoClkBXQwgvZEWE2uZFTa6lqCJVF81KpJrM1zXb0BLBmL60Djg5MjWM7NQTAo6/rwBCVxBc1v0SQ6Pq4sSI3xev4mhBq2INUwlW+TWrc2wumAq15LqptdMUtEiFatrE52XR4RQi6tGHd+YPWqxLziXcLBiJLHzuMHNE7StBRtxuCAOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaaNhOnxqX5V9WRJSRzpgkqf4QYdplE8jI8Fxvo167s=;
 b=dQlTiYryGOdNjF4BE69pKuWT5k1mNJlOHrjJa7Ch6+RLsr7bN98d2rXfjB1jjDuxsBTl+1lvXk6E7qKqk3yDlWsJNbsy/GUusKcEvHT3QXi27ChXSI+CaJBAA5QncQR1T6bOhxqxUnjrjDVwuJA0Bn33HN28qwMzN6lO08rTPQkOYZZCVKbERdW9Vcg6YnBD4fn1dmca9GbcmkoHG46kFzDiYRkAHO/5F2r1gzGC7xZqNZwLH+O+8rzmjc1LI5xDxV9ATawWuSEptvEf3qu2RzCI1w9p9tcL39+tIWim5vRoxiIVn1sAnRplHSYVydTCy8B5zNijJcKTyN681uWGCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DaaNhOnxqX5V9WRJSRzpgkqf4QYdplE8jI8Fxvo167s=;
 b=Wnx7W8/480NT13kGb0gZRB7+XiFhIJH+YzLoBM/RiSECI8Gz2MAdLL+TBR2Fz7gHaptbBtwOT0MEQpQ4ik5Yi/oCc2G9WeNYqpkKv+jUIklBi4iSUJVeDI2KmtEn5DA44qqdHJxTX1is4mkQIVGuXMBEc3/XENFF+e/A5qTFHrzReyL76nbzX9XXBufMhEmrNLmLXwB9AZ6VGNcEOMY16rREXopi4S+uw9uSIuSMwhoiaO3cZKse2C/i4BZbnhKW0Mbejki9rgo10dm8mBFfMUxZHuTGxPNWMdTRttLDOb7ADbblF2b0D/HQ0B3+jQBSnVFHyeOc2+Q/ewymKzZ6AA==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by BN9PR11MB5324.namprd11.prod.outlook.com (2603:10b6:408:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Tue, 24 Jun
 2025 10:46:26 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80a8:f388:d92e:41f8%5]) with mapi id 15.20.8857.022; Tue, 24 Jun 2025
 10:46:26 +0000
From: <Dharma.B@microchip.com>
To: <laurent.pinchart@ideasonboard.com>
CC: <Manikandan.M@microchip.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] drm/bridge: microchip-lvds: drop unused drm_panel
Thread-Topic: [PATCH v4 1/3] drm/bridge: microchip-lvds: drop unused drm_panel
Thread-Index: AQHb5OnimHgNx3OeY0G+OrHRjNF7R7QSH6AAgAABAQA=
Date: Tue, 24 Jun 2025 10:46:26 +0000
Message-ID: <adee247c-933b-418c-959d-665b1df11874@microchip.com>
References: <20250624-microchip-lvds-v4-0-937d42a420e9@microchip.com>
 <20250624-microchip-lvds-v4-1-937d42a420e9@microchip.com>
 <20250624104248.GH15951@pendragon.ideasonboard.com>
In-Reply-To: <20250624104248.GH15951@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|BN9PR11MB5324:EE_
x-ms-office365-filtering-correlation-id: ced97cdf-e470-4843-56d9-08ddb30c5e5f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NWNOemtScFlKUHB0b3lWRS9Bb3M4cEJYdnNVZHdpUGdCV0RZSE83SFRpZUJO?=
 =?utf-8?B?UUlJenhkRjNsUmRSV0hlS3d1ZmNwUmdKRnBaQnlwTzZMb0ErOTJkNW1DZmcx?=
 =?utf-8?B?UkJqbUFlelJTSEthdVZUSTNkN3BTNXl3TXlkaHI1OEkyUFk4YmJyQkQvdDJn?=
 =?utf-8?B?SVBFcTdaazROWkdDVHNISjh3SGVmVXhyS0tyZWpES3FiQUVjNE4vMm9TcC9V?=
 =?utf-8?B?dWw0VUtPRU9sb0c1T05LNUJjN1JpWWNweXIwenFTQkJ3RUM5VzBsTjZXeHBy?=
 =?utf-8?B?WjNkdk1CeS9nMGgzMHp5c3ZxMWYrSzI5WnFzL1paZXMwd0JUN2lZZDkwZkpM?=
 =?utf-8?B?RHdMc2lDQWhSaVZURmpCaXk3T0VST3hBOTd0TjNqRy81ZkNvVUVuVWY3dDZ4?=
 =?utf-8?B?QVpXdk1Eb2pvNEFVS2JFUlgyWFp5alFvS01SWFVRN1lBSjhGbkZuRWVBQzg4?=
 =?utf-8?B?NzlKL1VSdUYvbWRFOEYwS20rc25EMnpkSnJlZkpSVDhPVW8xQVlUbjl1TUN4?=
 =?utf-8?B?R2puWEo4QWtvdVErUERFQ1J6clJhLzd5dWhyem5yTEQxT2JrVTdYMStMNnQ5?=
 =?utf-8?B?QlRKaU1lbWt0K09BZjV1T3FOMWcrRzBXcUhEaDNHTlZOd1lqUTFoMFZZMmVQ?=
 =?utf-8?B?UURvV2N4WXBiVFg4UklvbXIwUUJXN29MZzFVb0dXVmJCOWllVjErbFpxWXF2?=
 =?utf-8?B?QnpIci8yQk9wamNMdXdjVjRqSWcxTjY3am9iTUFXcVJJQStYbTJleHgxdTdy?=
 =?utf-8?B?WWxmTHM2VUVWVDRLUWhBL0o1clBnTUU1c1d2dkovZmJCaDFhZzVGVU55eDJk?=
 =?utf-8?B?dmJKV3RvVFFZWEZ5RVV4YU9jTk1GWFN2Mk41aUFXYUpaUWRvWlExYWFsTW5i?=
 =?utf-8?B?TzZrb3hja3hvT0c4S2VOTEZMMUxUc21xSVJaN1BsclRWeCtPKzkvUTFrbGd4?=
 =?utf-8?B?WXUwb2t2cW9qUkpCS21TUGR5aCtWbG5jUnhmSXVVV2dNMi9BT1BUR0wraXNO?=
 =?utf-8?B?aGtJOHdUQUxHaG4xdFlabDJXeVpXQnVKdGRJNmNRQnhqRDdzWkVPKzVFZkpt?=
 =?utf-8?B?OWx5akNjRkdWWlpMSnc1VS9JeHd5S01IdGVGQlN1NjJ4UGkrNmZVWW5oVzNF?=
 =?utf-8?B?c0xIOEJvUmdFSjBnUURiM1dsVld5ZUdCdzhVYVhMMEVOcWZGRms3UVlCTG5o?=
 =?utf-8?B?bDZXWm40TktZWXVuSEJzcnc3U2JPMmJnck1hc2thRGRXNEIxUFYxVmd6QmJN?=
 =?utf-8?B?eFYrckltM1U0TjBWZ3lhSks0aStCeTdnV2kza0FvQkNEaW9XRktVSm5hMEJ2?=
 =?utf-8?B?cm5xcFBXWTRvV2ZOdHpmWlV3c21mQ3BLN3R4YzlGMzJLekcrQTFtajJ3ZmVD?=
 =?utf-8?B?ME1iK0ZtcGFsNmN3OGpVd0dVUUtjeVQweTFnanRFZ2Z6Uk82eXl6NUVjN3hn?=
 =?utf-8?B?QjlQa2MyUlRqVVBXZ082dmsvdjF6T01sQVFObTF2dnVBU1RySGJ5d1Y1Vzhy?=
 =?utf-8?B?Nk9EanZPTmtPNnAyUDU3Ylo1eXJ4dHNQa3JBalkrblRUcDlPS0JtU004OVhM?=
 =?utf-8?B?clBQY0ZjNGxzZlpGZG01S2ZGZUpOdnJ3cjBqdEtkTUh0aHhmSWZYNlhqeXIy?=
 =?utf-8?B?NUxMRDNVSnczSnJEakFnYkJQY29uSzdtc01jNlhnN0dmaCtYUXF0M1V2VnpZ?=
 =?utf-8?B?VW1OMUZxeE1yRG9SNzNaS2xnTVdZdCtUdG9NQmpIaGdrenpOeDhidW5nRjlB?=
 =?utf-8?B?WXNXUk9YQTZDOHFuWFA0VVkxcE1CMGp6MDRVZnF6dTJFUC9hVWo0OHVMaUpn?=
 =?utf-8?B?b0JWL2N1SDl3bXpERlFaTElITHRSSVJqV29CMGNVSjcydUZTakYvUW45dmVF?=
 =?utf-8?B?MVdFNk9XaVJoalpoSldiVmx1bDBXdmNlTTRnVmFmbXF6VjRIcmpNTzUrcFY2?=
 =?utf-8?B?eUZPMS9VdGNjM2dHSEQ4RGJIalJUd2g1YmxWdzVQVlpyaGg1cmt1Vklka2J0?=
 =?utf-8?Q?PLjZU3hNZR2ZAkv0ESwMuhjxYnS4a8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHpOblZnakZ3WklqQXMvYTBwVUtVM0ZDd2djbkRXekp5WnUvenNrTXNsQko2?=
 =?utf-8?B?TVdlSHJqNUsyMzV0SHJ3Z3VTSnI4NGVHZG8wUm9uRG5SZ0piVGgzQ1R6Nldz?=
 =?utf-8?B?Z2wzTXlRRnJaelRQNmEzMGFUd0pDQmVRb0kycFE2SC8xeVRKeDBYUG5QdWN1?=
 =?utf-8?B?TU1wVGsvNTNPdEw4Zk55dUIrQVNkcml4MlZwZndZY1RPMUdKQmx0UW9yWlNW?=
 =?utf-8?B?U0c5Q1ZtRlU5VGYyNXRnaHdlNWsxMmdMOEQvZVQ2NFRRWCtWQVRwMHpYQU5i?=
 =?utf-8?B?b2k3YUt5ZG9odDFnTnVHOGR5KzBNT1VRcG4xYmFOMmFXK2MyT0FvVW5iNzIx?=
 =?utf-8?B?RXhpWVJvSUpPbjAxYUZzNVNhNUZRb1pYR3lLdVBRcFZoSG1iR1QzdjE2cDli?=
 =?utf-8?B?Q255ZmFrUjlGMUpXbUhoOXRmMlpuTjdyVEZTaFVTeERzcS80engvRTA3OFIy?=
 =?utf-8?B?aXc4M3U2bUZYTHMwdnNyL0ZqTU9HS0hPTVQ3bFNvR2Fua1pxcGhLWDMzT25j?=
 =?utf-8?B?bVRlNll2OXdTU2lZUSt3OVFXS2xDWmZQWkYyajVObGpnRjhHYk9FYXkrcG0z?=
 =?utf-8?B?QzI0eFpDZHVsUGdMRE1KajVrdXhtN0VEazdNaFZMRi9xNExSY216ZE9UQ1lU?=
 =?utf-8?B?alVpNWtFUmhsdmpud05jWUJibzRhdTdqRWdSWFBNME95bmxlcjJ1dmRKUUkv?=
 =?utf-8?B?ZENYallmajRwK3hySHV1azVVQVFvTU1NRThQeEdSNXhxaCtlSGR5L0Y1MDFG?=
 =?utf-8?B?d1h6UnY1dlpkNnhXR1Q5VzRiVzRHeUh6cmJBTnFpck9pQ1BGYUFxNVMxaHZ0?=
 =?utf-8?B?T2g1THA1bnFIWUU3UlRLYThEZHpsTndLeUw5dmFCQ0VFd3pnN3J3ek9ZRTd2?=
 =?utf-8?B?Q29jUEI4STN1MmZTeFpObC9ob2hqbzFyMUtWanZHVlIrTWliNUF4OXlkazgw?=
 =?utf-8?B?dGF1cU9ic0F5QWtJckorK1ptc1NMTFJTN05oWHRFbm1lY29FREhNT3d0QTQz?=
 =?utf-8?B?NnRuZ1BVbTNsc3dnd3ZPQVJCb1RueDBOU09rZVRucFNUb2JPZmVsS0svT1V2?=
 =?utf-8?B?TzM1NTF6QWhRdEpjTW81QzJzaWh0cWdlZGd2YTM2TUZKUDg4Uk0zNkM1UHdm?=
 =?utf-8?B?WnI0RC9DZk1Wa1BZaTVNamN4d09NeHRFTm1vajdMYkdiNUIwd2ovemJSR0dE?=
 =?utf-8?B?RUVGdDNEODFjcVltdlZQd1QrbDVJZ2lOcmFiTHdodTJvbHhiZERXQTc5UVR5?=
 =?utf-8?B?cFdrMDFZS2xtVWp5Q0xZaEEyOU1nSDVRcmNGRTJIR3NmR0FVNGgxeU9Ed0Jw?=
 =?utf-8?B?emVueFFJWXJ5TXJ3UkNQeTNJUWRVdzlZNk12bS90eG9ySmViVWxRbTd0V2NM?=
 =?utf-8?B?V3dCK1ViMWVVNTVVR1U3UTFKdzg0Z2dGSWJBMDZabGhrMzZnSlJTVUJPZHpL?=
 =?utf-8?B?U2FuZVNvSU8zY3J4ZFVjcXVsNnRIa0FFSTl5c3Rqb0prMUxaeGYxQVJ1Z00r?=
 =?utf-8?B?cGVRNnFEMWZJcU93MjJQRC8rbTRDMWtjNWJlU1VGVUh4TDhHalRIZ25TV3Rt?=
 =?utf-8?B?bUJGcDJrRG11MFV6QlVJMVRselQzUHVjTU5Qck84RDN4TUJFZ0dTYkNBT1pq?=
 =?utf-8?B?MWR2cXcvMTNtTHdkNkZDY01jam9vdFBhL1oyNTFOTEpabWVlSTVLMmpMeS9T?=
 =?utf-8?B?QjdiQ1Z3eHlyRlBlZk9DUkVYYThtQytIOUhjUmFYbzYwTDF4VHllL3FQZ1BZ?=
 =?utf-8?B?YkpwdzZDUjFXR1Z2UkplVVNhU1ZIM0lGZ0N2WHo1SXltQTd4MmV1am9KL3Ji?=
 =?utf-8?B?RFlabm1sN1JuL2NkZGR1bmkxQlBXcVRUTk5mSmZzanVDUHRMa3hqWm1IRGQ0?=
 =?utf-8?B?VURxYmFFQjJ3Q0Y4bEhraWJUNkJDL3JERkdYZkpIVVdpTFU3TmNpVm1ZT3lC?=
 =?utf-8?B?MEtwYjRiMDUveTJiTFZWSHpWNW9zWlFycjZ5MVFaaTErbXJZQ2JJSU0zMks0?=
 =?utf-8?B?MFdUM2JoZ3ZleE9WODFxZTBRak5iQi9zU1lRZXNJRlMwM3o1dmJuMnl3c3U0?=
 =?utf-8?B?UUpta2JXcTdtRkRKQ1JPbVJhSjI3Yk04bjRFcFlqdHkyZEhxVG14dUJ3WXZU?=
 =?utf-8?Q?7V6eQBO3XzSs2KElwGCXkVfgx?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <283A86D73D270A4FBFCFF7409750552B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced97cdf-e470-4843-56d9-08ddb30c5e5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 10:46:26.0646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VE3ySnEjXHLfmwGbnU74HN/373VZElQi2HtHWUdpel6Xstlb+/qRG1dVVwly7Dp+wsejYj2zT+rYmFjIYmm5Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5324
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

T24gMjQvMDYvMjUgNDoxMiBwbSwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBUdWUsIEp1biAyNCwgMjAyNSBhdCAw
Mjo1NDoxNFBNICswNTMwLCBEaGFybWEgQmFsYXN1YmlyYW1hbmkgd3JvdGU6DQo+PiBEcm9wIHRo
ZSBkcm1fcGFuZWwgZmllbGQgb2YgdGhlIG1jaHBfbHZkcyBzdHJ1Y3QgYXMgaXQgaXMgdW51c2Vk
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IERoYXJtYSBCYWxhc3ViaXJhbWFuaSA8ZGhhcm1hLmJA
bWljcm9jaGlwLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL21pY3Jv
Y2hpcC1sdmRzLmMgfCA3IC0tLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25z
KC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWljcm9jaGlw
LWx2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvbWljcm9jaGlwLWx2ZHMuYw0KPj4gaW5k
ZXggOWY0ZmY4MmJjNmI0Li40Mjc1MTEyNGI4NjggMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL21pY3JvY2hpcC1sdmRzLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvbWljcm9jaGlwLWx2ZHMuYw0KPj4gQEAgLTIzLDcgKzIzLDYgQEANCj4+ICAgI2luY2x1
ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPg0KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9icmlk
Z2UuaD4NCj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fb2YuaD4NCj4+IC0jaW5jbHVkZSA8ZHJtL2Ry
bV9wYW5lbC5oPg0KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPg0KPj4gICAjaW5jbHVk
ZSA8ZHJtL2RybV9wcm9iZV9oZWxwZXIuaD4NCj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fc2ltcGxl
X2ttc19oZWxwZXIuaD4NCj4+IEBAIC01Niw3ICs1NSw2IEBAIHN0cnVjdCBtY2hwX2x2ZHMgew0K
Pj4gICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldjsNCj4+ICAgICAgICB2b2lkIF9faW9tZW0gKnJl
Z3M7DQo+PiAgICAgICAgc3RydWN0IGNsayAqcGNsazsNCj4+IC0gICAgIHN0cnVjdCBkcm1fcGFu
ZWwgKnBhbmVsOw0KPj4gICAgICAgIHN0cnVjdCBkcm1fYnJpZGdlIGJyaWRnZTsNCj4+ICAgICAg
ICBzdHJ1Y3QgZHJtX2JyaWRnZSAqcGFuZWxfYnJpZGdlOw0KPj4gICB9Ow0KPj4gQEAgLTE3OSwx
MyArMTc3LDggQEAgc3RhdGljIGludCBtY2hwX2x2ZHNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgImNhbid0IGZpbmQgcG9ydCBw
b2ludCwgcGxlYXNlIGluaXQgbHZkcyBwYW5lbCBwb3J0IVxuIik7DQo+PiAgICAgICAgICAgICAg
ICByZXR1cm4gLUVOT0RFVjsNCj4+ICAgICAgICB9DQo+IA0KPiBUaGUgYWJvdmUgY29kZSBzZWVt
cyB1bm5lZWRlZCBub3csIEkgdGhpbmsgeW91IGNhbiBkcm9wIGl0IHRvby4NCg0KWWVzLCBJIGNv
bnNpZGVyZWQgcmVtb3ZpbmcgaXQgYXMgd2VsbC4gSG93ZXZlciwgSSB3YXMgd29uZGVyaW5nIGlm
IGl0IA0KbWlnaHQgc3RpbGwgYmUgdmFsdWFibGUgdG8gcmV0dXJuIGVhcmx5IHdoZW4gdGhlIGVu
ZHBvaW50IGlzbid0IGZvdW5kLCANCnRvIGNsZWFybHkgaW5kaWNhdGUgdGhhdCB0aGUgcGFuZWwg
cG9ydCBpcyBtaXNzaW5nLg0KDQo+IA0KPj4gLQ0KPj4gLSAgICAgbHZkcy0+cGFuZWwgPSBvZl9k
cm1fZmluZF9wYW5lbChwb3J0KTsNCj4+ICAgICAgICBvZl9ub2RlX3B1dChwb3J0KTsNCj4+DQo+
PiAtICAgICBpZiAoSVNfRVJSKGx2ZHMtPnBhbmVsKSkNCj4+IC0gICAgICAgICAgICAgcmV0dXJu
IC1FUFJPQkVfREVGRVI7DQo+PiAtDQo+PiAgICAgICAgbHZkcy0+cGFuZWxfYnJpZGdlID0gZGV2
bV9kcm1fb2ZfZ2V0X2JyaWRnZShkZXYsIGRldi0+b2Zfbm9kZSwgMSwgMCk7DQo+Pg0KPj4gICAg
ICAgIGlmIChJU19FUlIobHZkcy0+cGFuZWxfYnJpZGdlKSkNCj4gDQo+IC0tDQo+IFJlZ2FyZHMs
DQo+IA0KPiBMYXVyZW50IFBpbmNoYXJ0DQoNCg0KLS0gDQpXaXRoIEJlc3QgUmVnYXJkcywNCkRo
YXJtYSBCLg0K

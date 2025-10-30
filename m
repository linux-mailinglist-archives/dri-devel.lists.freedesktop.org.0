Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 907DDC228B1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 23:21:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C688510EA7E;
	Thu, 30 Oct 2025 22:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KrnhhjRx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012052.outbound.protection.outlook.com [52.101.48.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1363510EA77;
 Thu, 30 Oct 2025 22:21:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KFbf9B/hlF85h1LmS8DjDNrYl1TT5AacfGlF5G8dKyhjVECAwxL0GPuE7zh4cgHxtXQudtkmuz1yFsM2bvuTwz2sXma2TNxr4o69pKrSMi5Fs9n4zSnVEOhdxH/ErsNJEzrDfTLrbU7ojs51qtDb/V51bkps1L5A3UIh8G9l8fgjmK8Gb8v+xFZlk4XuWVMkrlf9blqInwHWqN6bMLIbBF5lD+cEnIT6K/iLbeRLm/lLkGNjOPh61HHPUI43ySOBmTnMzx1QJWVa7So3EcJHvxUYPRLShlebGpchEoV6A3JVhuCSzZ2rzYcj4IoDbLpN86D8IDNZpgEiOMt+eHHd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WaGUeaZNLMWCennzN/2v+fDubtP9uV0g7YqdFUWeP+Y=;
 b=U0ge5fSpPvx5NjtSBEru3VVlBwwjlj2KJXs/a9cc7BpzYSHRSEGJL77AvxadMajFOHWGu+SqocTiRfShthGJm67Ewc6e7eu5m9RYrCfEjGSP9KZlJdM/MpBUhWca2ViKpNW3reUtRya8OWC1TiT4xIqF1KXIGOFLZB3sq2i8JReoo5aohflIa6lEeSlsOuqWk/TQ0SuzwvFH96yhA4ABlildlvvWbsOt2MxkwlIK+v0YFPWcdRhrgwsO+iZvp+5UWVmMt/BqtHdb2tpiWEbubyDwW00OBwkEplif8CMPO9ovsYGKaWi3qPrswmdqROopQ3fRTgejwKs2WDsfiP3jAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WaGUeaZNLMWCennzN/2v+fDubtP9uV0g7YqdFUWeP+Y=;
 b=KrnhhjRxwCWMleNXeoa5e/lL3VBnF2ozsb3o+mZfQBl5LHaHxq00tFHb6mc80ZpM1lYt9jV5kfsWO9/QlSmGDaqG43lf9GO+T8FIf6+bIQXzHR2SaSiOJ/r3y9I5+3d4U82cQx888uIUiB+5K8o99Tg4DlSlzqrooRUqvEQ453nOJV7OjWjvlI19/FWNE+05sYwA/puWoRPGwEB8E493B71Etio6nI8XWEW5du2ypIiLT+qtrD8YYAS+BPynI60bRRe9g+iIWYVx5OPvgqw0icSbm60SE5+VCdHaObFsyjZzZCOaRp1kV9kcpffwKvDtBiSJRg3aSsEABzTrozra0Q==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.12; Thu, 30 Oct 2025 22:21:01 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9275.013; Thu, 30 Oct 2025
 22:21:01 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, John
 Hubbard <jhubbard@nvidia.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/2] drm: nova: select NOVA_CORE
Thread-Topic: [PATCH 2/2] drm: nova: select NOVA_CORE
Thread-Index: AQHcR/ozEV6PJ2nFxE6DpmdUxIy1aLTbRvwA
Date: Thu, 30 Oct 2025 22:21:01 +0000
Message-ID: <960e710b78f18efb52c6b43ae22423ad3ec3bcfb.camel@nvidia.com>
References: <20251028110058.340320-1-dakr@kernel.org>
 <20251028110058.340320-2-dakr@kernel.org>
In-Reply-To: <20251028110058.340320-2-dakr@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DS0PR12MB6632:EE_
x-ms-office365-filtering-correlation-id: cdc78532-da4f-4c59-e03a-08de18029be8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cUt1WklXdDVndjI2RUx6Qm1oSHpySUtHbEdOYUUvMTZaYkM4Zk1VWncyK1gr?=
 =?utf-8?B?dFZETHd4bkpUdXlpUE02OXV4ZFhnUmxjQWNwdEpScWFOWVJhSE5aQWFGSHc3?=
 =?utf-8?B?LzRJZ0h2Z0gxTUtCRC9wWmZib2ltcTE1cDk1SlMvWUNMSzlRZGhiNnA1bS93?=
 =?utf-8?B?ekZPZnliZjNJZWhqZUFqRkRIR29MazFYYldLTXJObGhUbXRpZHBjNkg5VEZB?=
 =?utf-8?B?dThQN1g0VmhkT0owSXRjWVZ2R3lOcUhONmY0YklYbkdYYzNuQVBlbnBoSWIv?=
 =?utf-8?B?NU13UzFTVk1YYWtCMWRZQ1lXYVVmSnpHVWJQa05oSlV0K0hUUW11NklZcTdm?=
 =?utf-8?B?em5tV2ZqUG90bmlSMktwdjRFYWh1eWZIRVFUeEJHaEJjT0NpZkZPUE5WNFhF?=
 =?utf-8?B?UTdaNHpEU0piODFRZDMzYzhTZFl4UjR6TzRzWGRrU016c2R5VzVGaXJUMzAx?=
 =?utf-8?B?eHE3cEI2bHQwb3NPb1RZMkNUQkdHSTJqeFdEU1VDMjlZQVFWTjRlN0pKUCtQ?=
 =?utf-8?B?eXRNTkhnOVAzWGgzR2M1S0lZVWpDYXZpR3ZjbHloTUFVdnU2LzNBU2d5ZVBF?=
 =?utf-8?B?dENJSUpObU1TaThIdmdTTEcvd3VPUWhXTmEwTFhDdXFQNHVFMi9QaGxmZm1p?=
 =?utf-8?B?M1l2YlFLZmxQYVVlcitnSStNY3pSODRyZ2Y5dVJxWUc1ak84azN1emNRSXBa?=
 =?utf-8?B?YWxaaTVMR3pRQzBucVZiVDl1ZERKTE5PUUlkc3gzWGpzN1BzNjd2S3QzZG5L?=
 =?utf-8?B?Y1pUTzE0bzNZZjBZb3o4a2xmZXR2cmNVbkZyTFNpcU5XRFp2dEQ3TllkQWNq?=
 =?utf-8?B?Y3pDdUFBNlZyeStZcUdBRDh4TTZWd3EySU16NVA4eUcwK1pEUXJNZGZaZHZv?=
 =?utf-8?B?QlpTeTBWYUJqUWRzKys0aUVHNzc3THMrVEdqU3lteE9oKys4ZjMzZWFxak1x?=
 =?utf-8?B?blBEZ2Z3eHE0R05hSWtiS2lRSGtDU1ZCMlBma1hqTGlKNVFuVXF4NlpkOFdT?=
 =?utf-8?B?QzhGT0lFTnh6QlBubXhRTFRqanh4RDdUdk1NVWZLL0pJYmh4OUk5cVdqSWRS?=
 =?utf-8?B?TEsvZGlBbElyd3hPdHJTU21xc1dtMDhnZVhmcDBIWDBsaVNjZzhRUkhPekZB?=
 =?utf-8?B?UlRqMFlFdTFVQS9qU0NaL3hXeVY0THY4YUlTUkJMRmN2SjdubGE1azVEbVo3?=
 =?utf-8?B?WE1VcjZBOVUrKzBCNTdmQmtlMlBRTlRNMG9mS1ZGUUNTRjg5WlI4NnZ6K0hX?=
 =?utf-8?B?dE1iTXdEVFdjaUlwWUYwZUhtSE1QVFBpQlE1RUlobENJcjU2clFTeGJPRGJX?=
 =?utf-8?B?Mk52eTk5elVnMkRuSFo1akVQT1o3VkZkUzRiVzdVTlJ4NytLMUx3YlU3OFpV?=
 =?utf-8?B?YTA0ckNOc1pVOGxyM2RvVG4zWmFRaVpzWFQzS2h2K3RVM1lYQi9HT2Q0dzhx?=
 =?utf-8?B?L0lPMUdadkN0L1ZUUG1ReUtoZmZnVTFPNVB0OTFRQ2tIZWxITk5yY3dSRW9o?=
 =?utf-8?B?aHJhMW1BVkhzUmt5aFF6TjZDR0hjRVBpYm5TZUxwQW1qaVNsYmtwbnhTeUJw?=
 =?utf-8?B?eTQxL1Fzc1Vsc1lsNXlSY0Fxcko2V2tTRWUvMmdveGhKQkw5V0c0QlhSMnpq?=
 =?utf-8?B?c3F3aGo5RUdiRitsekZHMU54ME9PS2NqRktoOUF1TXNicUtoZGhJVlVuVTkr?=
 =?utf-8?B?Q3JVVzdBTGJUS0VPT2YrTmJOUWF2REc0aG1aL3pMMFV6c0g5b1hMMFlhUzBv?=
 =?utf-8?B?eWIxMXJyZUNjZ1owZ1J0ZUZ6dlhSVElRME9DY2RKaHZsTkxkY3krUmMxMFRF?=
 =?utf-8?B?eERsQWlVVnp0dzY0OElaYUdGZTZlbXl4UDlpd1BabnVJenI1S09HZkZQSVhJ?=
 =?utf-8?B?dXhOYWFKM2x0VnFMeGM5bFBBR3N1SmN4R0VmWXF4NXlaVlc5dUNzLzBmL3Rw?=
 =?utf-8?B?WnBMS2U2UmE5T09zVlZKeC9ISTRDSnBaK1N2aUgrL24xMUFidFptNmlCRlF1?=
 =?utf-8?B?NGFlajJRRWljVktyN0Y5ZHpGRkZTTWNiRnhwaFpHaG9tY3JTWmVrSGppNU40?=
 =?utf-8?Q?Z+cfXZ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REFraHEzcnMvL2N1ekdqZTJ0UmdpMTRncEhSQ3VvZlh6dWh2SisyZ09OREJQ?=
 =?utf-8?B?U2RROUxodXJ6WmQwRlc1RmJRc0RGRVprSHp4V0tINTlXSStBcHRVMzh6KzBI?=
 =?utf-8?B?OEFUajQyZk1XVXZYQUs2WnFVak5DNGF2QTlGZThmMFJEU3ZlckloQWEwU3RN?=
 =?utf-8?B?MHZoUm4wMmljMEZvcHNXMm9NeHhkMkZYcHcyUVlxamdFSEdaaWtXaHZTUW5C?=
 =?utf-8?B?Vm1VTUxMcGNoM2QweE92Q0JsRTNqMGZyL2w5cGdaQWhjbCtYK2o2elB5Q05Y?=
 =?utf-8?B?QzllUzJRWjJPSUZZT2ZzRUJweFMvL1hBc3NyM2p6dDlPNW5hUWNYTlpJenNS?=
 =?utf-8?B?Wi9FSEU4aXh3MWZBdjl3bWR2YUlvWGFWN2RnUHI5Z29yejh4cHlWRTlRSXdy?=
 =?utf-8?B?RU44WkozN2lRN2Q4OHhvdHQ0TXd4bHk2RFBvTTh5YzJUNzd2ZlBsYWNYaHow?=
 =?utf-8?B?ekUvUWdCbXZDRnB4dGh5V0U0bjRuQUs1eDVlYzMxc1k5cWFIcjA5Q2VUUDd1?=
 =?utf-8?B?QngwY0V1N1RlRXpCbnVNQ094emh1YTBzYVVvaGgxYkR5L3FLQW1iSGtDc09F?=
 =?utf-8?B?UnUydFFCVzU1QlhueXViUmhOalRkNWtOTWFYejViNGJ5cXFCMm1IWjQwOGRC?=
 =?utf-8?B?UHRrei9wN25JelA3Yi9YVGFXaTVvVnFWMTNrdm5qYVNoaEk2cVlGK0J3bEcv?=
 =?utf-8?B?d1EvNU1FRW52djBCTFpVWkJRM1NyTDJyWm5ENTRnaGNhR0NjR2ZYNXcvWlFo?=
 =?utf-8?B?TVJDcTM2cDRrWCtsRmVIMTBLVE84ZWFjbllzRXBmbGhyT21kZ2tPb1ZWSVdQ?=
 =?utf-8?B?R0t0U2NPOXVLRlByUlhZbUN3Z3FhTk9pZXFHajRXbUNTOVM2U3RQaFlkQWZU?=
 =?utf-8?B?NTkxRXh1cU1XdVFpR29qeGtOMnBkV2lmbFJ1RnlBeVd1V0pIOFhZbTN1d2dq?=
 =?utf-8?B?U0N4RFJ2eUFlOGtoMmc0RU1OakFJSzRzQlM0L0ExTGY4QkxIS2pqNkI3Ukhw?=
 =?utf-8?B?eTBZMUNhQjBUaDVFai91N2VtUmxzUjE3MUFaTWVYQzNpNkRUZDk3Tk5pRDVH?=
 =?utf-8?B?eVpqeFV3WnhBS0o5aWpmS0tYMjJXSFpndzZXeGs4eFBZa3VVR0JBcTNlcVJp?=
 =?utf-8?B?RVdrdzNYRW1PemlYbWZoYUdKM1REYlc5QzNpVGNKcGVkU0RlQ3Q0aS9Lc3Zj?=
 =?utf-8?B?a00yZGdUNDNDdzlGVGdtbTZha2JwNUF3dmtYQmF0aUlPZUFXS2RiRFlTbmpB?=
 =?utf-8?B?MDJaWWRBVGRXYW16UDZPYjYwYWZnQXUxUEtZdUN1VVh0MmtPK0xQYjlSTlBs?=
 =?utf-8?B?azU0dE1HeWhyV3AyaFVTL2FKQVcwWGNlUkJ2aEpWbWgvQlNkU0kzUENhbExD?=
 =?utf-8?B?Si9zd2ZkcjZhdXVGSHZnNDdmZDFEZmJ3UDhZVmRUeHBDbW5zR2Iwdkp2c245?=
 =?utf-8?B?cVc4MUp3S3J4eVdIWmhOQ2JQSjQ3TmVJRklZZjloNVVMR0RUa2hBWXhzdTlv?=
 =?utf-8?B?SU53YlRWa2E5b1prN1JjRmFWWHExS3IrVi82TmtGL0JaS3N2ZXl5YVlramZY?=
 =?utf-8?B?TGo3S2FyOW5UV29NQnZObVV3Z3hzMnFqVEF2eVZLcmI3WDhGb2tLc2VuMldu?=
 =?utf-8?B?Y0xkMG9mQ1NzNTg4V0FpM01USkNrT2p1YjNLTUtzNlJSUnl1akNHdTRVQTNk?=
 =?utf-8?B?WFhEWXFKank2Nk9TV2lKeS9pWDlFWFlJMkpqMHVZTXpxS3g2R3VzcE5ZOEdm?=
 =?utf-8?B?VU9FVjBudUZVMU5JWU8zM2F2U09kNkZWS3RlN0VHdGo5YUN0Q245UDJMcGtZ?=
 =?utf-8?B?bjJscXNyM3loR0wydUJBQ1N5N044SW1hK3U1SFNmbFhRYlBhTy9SQm9ZemhH?=
 =?utf-8?B?TzFBL1VaK1FSU3lTNTVSclZHaDNUemtaOVUwNVJLaE1rdkwyNDVrTFd0cWtp?=
 =?utf-8?B?b1g1ZjRVL0ExUlljUnAybWVUbElKY1hhdDNSY2hUNTFieFREWmZFTmdRNk95?=
 =?utf-8?B?QktQQnA1TWU1M095T1hkM0FPRmk2KzRQS0ZGbW4xREEzVmRWODZkSzdXVzNi?=
 =?utf-8?B?bTNOenNKRmtGMkdtTFc4M3NGcWp3cUlSTWN5aXBMQWQzNlJZNWo1c05oeS9T?=
 =?utf-8?Q?vNQUtLtgsBwS6o07ufDK2I6vy?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D621804E25F0C64AB841D37B17C23F73@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdc78532-da4f-4c59-e03a-08de18029be8
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2025 22:21:01.7557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NbrOOmF8GTJ0RoITSrsQhldizfXDKM+pDpTZBVete/CKbqsocElontvjkD2M6Iu+/2jxnxXDIXuWOfjg7SV2YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
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

T24gVHVlLCAyMDI1LTEwLTI4IGF0IDEyOjAwICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBUaGUgbm92YS1kcm0gZHJpdmVyIGRvZXMgbm90IHByb3ZpZGUgYW55IHZhbHVlIHdpdGhv
dXQgbm92YS1jb3JlIGJlaW5nDQo+IHNlbGVjdGVkIGFzIHdlbGwsIGhlbmNlIHNlbGVjdCBOT1ZB
X0NPUkUuDQoNCklzbid0IHRoZSBjb252ZXJzZSBhbHNvIHRydWU/ICBub3ZhLWNvcmUgZG9lc24n
dCBkbyBhbnl0aGluZyBvZiB2YWx1ZSB3aXRob3V0IGEgRFJNIGRyaXZlci4NCg==

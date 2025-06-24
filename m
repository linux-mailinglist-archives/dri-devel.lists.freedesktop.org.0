Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD647AE6D77
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 19:28:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7374410E60E;
	Tue, 24 Jun 2025 17:28:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="i4cOu5ao";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A429010E609;
 Tue, 24 Jun 2025 17:28:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYrjCXNQI0jP1uJrdcmTI7akFmG01+hWqsV5peoTXDuWfxifLSXkQv3RptpqaQrp1QezP+2zH9/VM/ba1ZulRtzOJL11qVhab0w7F0eCsRVF8JtzWt3WxXt/C1A1LPDQuS6iAe4i7kTEqB5qszGrbFaUeSEktvRJUNvcztyu/T5TMzvb4evTIor2uRF37qgP7J9ZMT8G6xxH+HDpBWpKTvLRGxRtSvVyc7RLLqVqFzfjG2w1oMdzZJcNez1RHhc/9txrmqFz7ChM2ERjXPfOHcj0h1L2NBVVFKSe7ChWXwytEngI8ZOw4/y4HsnuTu5FHylcP+4UNncY1MrluVzpoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTD34QVQmCFcKXW/MsGzdJ0aKl8vtY4SV41JELK14hs=;
 b=o7wl4pXm1cz5JZrC8pia7iP4Mi8otOMYWopb1f29e/a7lltbXNk0sgrqBbKuugTX1slsWuyU7U2gu7MCMbKUfeo6FhVeCtNe7OEOVIcQbihG0EqQkZ6LSLw7Z/A2zbZD6y6nQcK7eSfGfZvnI9ixOiFxjx0BDAJeMOkIpcGiXOcpxKxQodjdttFJ/ZX4zYr+4E7y24uMRrCn0oKL3phU4o6rNTqwzaw7OJpmfw2wXFVX1ncZiqRGUbnN3mVUrXcl0X3o5hKQLW+tXQl7jO7hhsuoRNY5AwNVW/m9eEs3VIaWQjWgrbM+vSTFhLGzR6iOJC/IZYQjyiYimO3JQQ9owQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTD34QVQmCFcKXW/MsGzdJ0aKl8vtY4SV41JELK14hs=;
 b=i4cOu5aoFhJuawWtbExDDHiNdPReE46sy9y6rOCab6j7fpucosBizw1M7nYW6XW0EU6BVXxHwCrJzaYobb6H5hwmYe3zZmkJHYJ2rSg0WQgovdAqyKf+Q627f//UH8cyXXVjjQg36VGBDTWx+8xVSJ9dgbuG80683cykNOR6nI4WqeADLM/D0zEooABAel/VXZ0PZdyKHMk1AUZzyMixe1coTq1rAPB8FRybXDXX9i6Jq/aSM25LNqtBASXNKhdduehZfs/ZARwCFuv/H36O9gWS1OC6Hs5dj5vuX5VZJ4jqoa22MdfdWOGkiTQ0garhgK0STNlwCwg2uQJSERo5qg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CY8PR12MB8213.namprd12.prod.outlook.com (2603:10b6:930:71::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 24 Jun
 2025 17:28:33 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8857.020; Tue, 24 Jun 2025
 17:28:33 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "martin.peres@free.fr" <martin.peres@free.fr>, "kherbst@redhat.com"
 <kherbst@redhat.com>, "mhenning@darkrefraction.com"
 <mhenning@darkrefraction.com>, "faith.ekstrand@collabora.com"
 <faith.ekstrand@collabora.com>, "lyude@redhat.com" <lyude@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>, Ben Skeggs <bskeggs@nvidia.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Remove nvkm_gsp_fwif.enable
Thread-Topic: [PATCH 2/2] drm/nouveau: Remove nvkm_gsp_fwif.enable
Thread-Index: AQHb5IuPm2cMLQy/UkmBXqiNS1jtOLQSkbkA
Date: Tue, 24 Jun 2025 17:28:33 +0000
Message-ID: <c3902fcf8bc963cf315e9bfbb9ca4c66e28857cf.camel@nvidia.com>
References: <20250623220909.7591-1-mhenning@darkrefraction.com>
 <20250623220909.7591-3-mhenning@darkrefraction.com>
In-Reply-To: <20250623220909.7591-3-mhenning@darkrefraction.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CY8PR12MB8213:EE_
x-ms-office365-filtering-correlation-id: 348975b7-41ab-424e-134b-08ddb3448b6e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|41080700001; 
x-microsoft-antispam-message-info: =?utf-8?B?U2RvV1pvb1NXS3hNQUh5eG5ucDZteU0vb1d1L1dzTFdDMjFGUGdsTmlYUkg5?=
 =?utf-8?B?LzU0MGVwT1lRRFUvL3llYlUrbGs1M2JneTFGL0IzY3FCWmovbkNGWHlzNUVS?=
 =?utf-8?B?TTFSQlNsYmVxWWJtZ2YzTDdLUjZnTDk2dXFkaVpMWlgydHg5LzhmajhDclJQ?=
 =?utf-8?B?TklyaGREbDN0WXlyUXJ5b0RpL3BHMkhDRDNndjFpclBJdkVTUm9YWFhoUk9Z?=
 =?utf-8?B?ZTJlUFVuRElIc012SHo3N3RDRHdEQm5OM2o5ZytJQ2hHdGh2My9oTmt5aG00?=
 =?utf-8?B?aGw3c0FyUWdyNmVoRjlDYTZ4akY0NDh1QklyaDFiSVRBb0gvMFQ4b01yaGNh?=
 =?utf-8?B?VjlnT2pleGI1U3gxTjdUSy8ya0h4N0xRV1I5Sm5DWnlvbmNQNFV5NGRPZVpC?=
 =?utf-8?B?N0puUW9ZNlRhNFgzYWN0dVFmREJTdlRxekRUSk9lWXZacVJuQjQ3L1c5S1FO?=
 =?utf-8?B?NllaSGZuTCtDTHJtYmFTUjRKdFNOWUFwWkpNOGt1N2dETnJqS1lPWi9hQUVm?=
 =?utf-8?B?bWNiMDhCMUQxd0E0RG5jUW02bjNSVWc0WlIvRVRJUVZsbHFVR1QySEhDK3pZ?=
 =?utf-8?B?MFJ0K3ZCVmdBS09RcmhvVzZua3JHaVkraUx1MXZBOUFCZi9DNWVsRjIyRG1M?=
 =?utf-8?B?TjBWVTZneG1LWmhaVW1HNlJpZXJORFJLTlRPS1RhUGRldG14OUNHK0ZUYlBI?=
 =?utf-8?B?VmNINDJlcHIreVVldUhGNm1WVVNGeWU0c2tFOUg3ZlZLWlBLUzJNTm9sTUJ1?=
 =?utf-8?B?bUR2cmw4S2hCcWhpZ0F4OFQ1aStlWVNVTjBlWUw5TThVR0Q5d3FUdko3eHpk?=
 =?utf-8?B?eXBXb1hDdk8xQzF2dHcrM1g2d08zMnAweTFKWWxhdm9mWVZFYUtPc3ZlS3gz?=
 =?utf-8?B?a1IvUlZidTBGL3R4TitrQVA0YnMwTC9yakE4NnhKaU5mUEJWU0gyWjYveCt5?=
 =?utf-8?B?aVV1Tm1GSDNickpvU1ltLzFQNEQ4Z2orTFIzTjMrV055QjdZd0lsN0phYlZI?=
 =?utf-8?B?TlhRZjdFdFRDajdCS0NWb2FheCtvYUN0Nm4rUlA2eGJPOTUvblhmR3FSd3Fs?=
 =?utf-8?B?RkVGSHh2WWc4Q0pJR01leHBhMldXQzFrWFJzdi9kZDBaZzVTSjB2Qy90a0g4?=
 =?utf-8?B?N2ZOQ1kwL20zMDZwK1hXYnBPc3NybmMwUjR2QlBuc0xIbkxqYTNuc0E5akJD?=
 =?utf-8?B?eUo2RGVzakxmSU9oSmFGYko1Tk12elpRL2pka29PeVF0ejJYanlYempBMXJ6?=
 =?utf-8?B?T1VVcDBCNTlWMjRjQW4xUWtWM1Y4SnNValBsOFVIRE1iSHNEaXZ1MzNsanZZ?=
 =?utf-8?B?Sk5DQzZTeVJ4UC9KY0V4UlBxNDNEKzd0ODFmMk1ZYll5R0VQNllneUY0Y0RZ?=
 =?utf-8?B?SDdwM2ttUFRydENyTmtFdkZkOS9XQnorR0VsOXZodTRDUElEbFZFbmRlcVhV?=
 =?utf-8?B?RmVPbjFUcjJ3T29BOXMxdDhDMUthSncxSGQ1bHdvV3IrUE1JaFVEVy9TOTJN?=
 =?utf-8?B?eW1Id2pjT3EyTnA2RFVpb0h4OTEvYk1UNDhhaDRDY3YweG1RT01MV0RDUHV6?=
 =?utf-8?B?TmRMNTdhTnpZRHhjTEJyZkhSbGJjd0U3ZllOQjdTSmIrQ3hJRW91cEk0M1lr?=
 =?utf-8?B?UjE0ajdFeVE5Q1UwdWkxbzVSQXR2N2pkVUFYc05DbkJwV1B6OWpodUo1ejJD?=
 =?utf-8?B?OHVLcUZ4R0swbUhMWk1qZy95V0xDOUw5dEhSb3hjT0dUODkzR3NyOS83KzJ2?=
 =?utf-8?B?Z0lFeHJkaUx1UGFrRFNJYld6RHIrM3NxL1NUdHBnQjliSllsdyt4YTQ2eFVz?=
 =?utf-8?B?MWlUcmpCQlE4bUJRWVg2bkR1ZjZlRmcrdUJyOHM4T0RabldEb29HN0pFTnNN?=
 =?utf-8?B?eTM3S1NJZWJDTjBKU3k5RTRna2JSYW5hWEQvcjhUUU1IakkwQjgvMkg4U2tS?=
 =?utf-8?B?VytHSWIwMjg5Vkw3VE0xaEduYjJpZms0Sk0relAwa1Z2RUliRkpacVZnSy9Y?=
 =?utf-8?B?aWtzb3dIQWZxcVViYlF5MEo3enNkTk5idVF2NXJIS2tVMURTZGxzYWErNWdR?=
 =?utf-8?Q?scOpIb?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(41080700001); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NmN2RUhKdHFSSWZPQXZOc0ZDNzA4VGJTYUg5MUVuTnhBUVEydXFQR3dSTUlB?=
 =?utf-8?B?WEFhTmNsRW8raW54azNITGVPbFA3QXpBYjV5S3ZJYmNCeHAvRE50bTFuL2tw?=
 =?utf-8?B?Q0UzVGdVOVJ5bU00RVdsTjVRNExVZW9VTWx3Y2tSUkkwN1ptWWovZGpBQStt?=
 =?utf-8?B?ZkJEdllFWE1ldmtxWTNBS0ZIbkVUYnVPYWFZL0p5YXd4bWNLUE1qcjlyZ0hy?=
 =?utf-8?B?TnBpbm5WYmt0aEZhby9wWTVqMjF1czN2Z0pvOEo5eGFEbHNGR0FkbG5DaytI?=
 =?utf-8?B?L1hlZC8rbmNOby9WRytSQ1NmcW9IeElxR1hDSVFBQnNvL0Jnc3E5aXFDYUNq?=
 =?utf-8?B?MXdaNWZoR2lKclYrWGNXUG9KeXo2U2ZrTVVrMHNVOFVoYXhaRVpLdGJZMG5N?=
 =?utf-8?B?UWNLaSthSVc1L2NVWDk4U0dMMFV0TEo0K0dDa2tPYWo3Z2dMMjBaZ0tHeHk1?=
 =?utf-8?B?SlVxQzFGNU03Yk9GWU1KNDhqNzUwanRHNDVpbmNWTnZ0OFRSYkh4dkJuSXJ4?=
 =?utf-8?B?ays5SXljc29YTHRrcXRtU01LSzdndlZPNTFRaGMvc0FxRUpBczFzTGhMelRU?=
 =?utf-8?B?SUJEcDBkVUsvWDc4UWgxem5yZ2lZM1dYUGNJcktrWXhEQXZFN1ZtMUhnam52?=
 =?utf-8?B?VWZGMTAvNjBYSGcwK3pGY0Ewa20zTWY3ZnlYUGVlRmdDV0pkNnNqeVN3NE5m?=
 =?utf-8?B?VW5YaUxUUWNndWl5SWlOWFQ3YnE5MysyL2FPOEthUGh3MDVjMEUxclFYWXdX?=
 =?utf-8?B?VjJqVEo0YTZWaDdQUG56ZnZoZ1hMRWNGV1lQOUNvSlhjU2lsTVAxYWFlZ3dx?=
 =?utf-8?B?azJvdkxHYlAvQUkyRmRwQUZYNUZ3TE15MFlXQ0t4bEJxQkNpMlBEMHdrSXBV?=
 =?utf-8?B?ZGhtaHRhaVNhTWxsWGtZamVwNXdRcFAwdWFLRWFteFpNOXZSbFg4R2JjMUtH?=
 =?utf-8?B?U25KNVV1elZFSFRsTnl1R2ZpeHZzZXd2Skl4TnNmemZCaEJpODVBZFUwS2FE?=
 =?utf-8?B?Si93Tko0NXhGOHB0TGQzYTIyNlhpdWlUdVdIM3lpTkhxa0oxQ2VUNDFzTmkw?=
 =?utf-8?B?dVZaWjRIU3BVUTdORTd0Q1VyNGJGRzZMRUp6L2dwUHlGZUZHNFR3VWdzTjEx?=
 =?utf-8?B?dWlUNEtDZE85TkdWQTk0Ulo3MzJ5YndyMjV2cU84ZUx2Sm9sem5WTlZ4eWhZ?=
 =?utf-8?B?cXFsMW9qTnNraHAyRVhHU3R1aG5HOUZkTHZhU21hT2R5RS94KzB5TTkybnNa?=
 =?utf-8?B?NEtLd2IyYnNjdFVwM3grRGJHcm9kNjVwM3R2eE9rTm96bnpVZmszSFZMS21o?=
 =?utf-8?B?WUZscnVxZmhrOTNNcU51KzNuSkVxSzJjdXNvQU5WUmwxbHh0d0FLVXFBUzQ3?=
 =?utf-8?B?L0tOeG53UjI3cXNSeUJrdHo4bDNvS1k3MS9IbVZpT0d2SkFIalFocFZoYUlE?=
 =?utf-8?B?b2FMZU5MclFEUmhLTXpoRzRpT0FZRVJadTZxTnU2UWRpZ0x0TWVFWmxMbVVk?=
 =?utf-8?B?cWpMUjRMTldwNjVDTGxhMVQ0dkxCODlPVEEzT2NmUi9UNENnSVdySWU5TU1j?=
 =?utf-8?B?dmJYSHpBU0NnUTIxVGpBWWdjRy9ibHo0OGpCUi9jdVhobjBZaHhvOHJZc2Vw?=
 =?utf-8?B?Z0dxSjZKaENYQmUzaVJQWlUzcVc2djRuLzVzMXUybkZmV2FTVnBRdU8rVThr?=
 =?utf-8?B?SDZGaGpSY1FJU2RqdTVERnRZdEN1RDBMQVN3WGlucFdsV1ZSZTVCZ2drdERq?=
 =?utf-8?B?dVl2bW1uWUpiUzBwVEl6Q0JrRzQ3eWlLbHpxaGp2QTM3TVhUdkZyNDh2NVF2?=
 =?utf-8?B?V3pYc290VDFpUmlLblF2WDEybEhuU0FiZW1mMFM5cjd1UnN5UWlhYnlpSldF?=
 =?utf-8?B?QTVQVEJQTFNrN1RTUTlVdWY5Ung0Z0lkL1I5S1JNb1pXbDNmS251dGZXRGpv?=
 =?utf-8?B?VmZmeVd4cm5ubk9CdXJ5RTl6Ni9WcE9pRnc3aVZEUzNEYlQxZStUQnlkVlF2?=
 =?utf-8?B?QzBQcE94SWVSdWFqUytxYkVrT3ZINzNVRWx3RTlSVUNGY0REV0xEV1pDWXAw?=
 =?utf-8?B?OTJkVW5BQkRhQ2RPL1dGK3Z1ZlVrUkcxU3BOc2oyM1NIRjJsTDJSVDBNZE96?=
 =?utf-8?Q?SV3Z2LlKXLO0o/jLXixoxKFly?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B1512C10CD4B9B4F8FAEDA8CA2477EA9@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 348975b7-41ab-424e-134b-08ddb3448b6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2025 17:28:33.4276 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kNe2j9XfH9TydZggLc0HhOah8o327SjFW4l6eyEUwqaci0Tz7VpraMdwGA8J4QwBZqUIk54FdGQHWE0qT6R4uA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8213
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

T24gTW9uLCAyMDI1LTA2LTIzIGF0IDE4OjA0IC0wNDAwLCBNZWwgSGVubmluZyB3cm90ZToNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dzcC9wcml2
LmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9nc3AvcHJpdi5oDQo+
IGluZGV4IDRmMTRlODVmYzY5ZS4uYzM0OTRiN2FjNTcyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9nc3AvcHJpdi5oDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2dzcC9wcml2LmgNCj4gQEAgLTE0LDcgKzE0LDYg
QEAgc3RydWN0IG52a21fZ3NwX2Z3aWYgew0KPiDCoAljb25zdCBzdHJ1Y3QgbnZrbV9nc3BfZnVu
YyAqZnVuYzsNCj4gwqAJY29uc3Qgc3RydWN0IG52a21fcm1faW1wbCAqcm07DQo+IMKgCWNvbnN0
IGNoYXIgKnZlcjsNCj4gLQlib29sIGVuYWJsZTsNCj4gwqB9Ow0KDQpJbnN0ZWFkIG9mIHJlbW92
aW5nIGl0LCBJIHRoaW5rIHdlIHNob3VsZCByZW5hbWUgaXQgdG8gaW5kaWNhdGUgd2hldGhlciBH
U1AtUk0gaXMgcmVxdWlyZWQuICBZb3UNCmNhbm5vdCBib290IEFkYSBvciBsYXRlciB3aXRob3V0
IEdTUC1STSwgc28gb24gdGhvc2UgcGxhdGZvcm1zLCBub3V2ZWF1LmNvbmZpZz1OdkdzcFJtPTAg
c2hvdWxkIGJlDQppZ25vcmVkLCBhbmQgYSBwcl93YXJuIHNob3VsZCBiZSBpc3N1ZWQgdGhhdCBp
dCBpcyBiZWluZyBpZ25vcmVkLg0KDQo=

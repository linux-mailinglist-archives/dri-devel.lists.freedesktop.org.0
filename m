Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADE8A39CE2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 14:07:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E872610E6AC;
	Tue, 18 Feb 2025 13:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pXRNX6aL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2059.outbound.protection.outlook.com [40.107.236.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F322410E6AC;
 Tue, 18 Feb 2025 13:07:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rCrpNM6M+h1A7avKhcILNlMKXUY6wSqBr2Xje0y9PGnXf/G5FVMiSCCJGI1NV1uHxSsAVQ/8emyAlqwpv3umUSN2ZwdBR9VgwjhMTVfI7GsPg+R/YvB8R0+AqoTM9COdPGREnRfJke0+zTi4BaYJZ4WiVSODcT0I4uwVOaM+GAgCby7QBTXoHTUOEVPnm7KZ5WDHAzjfRePIyu3iF3vHTVVLgTlDZbEF8Jfh8fJd9xhYuT/x5p834X75njMpppF+eN05swlqhcoJDeJpfGDSA67PQoQV8yqzGWNVuyOBGXt9sO4gZylvUwCmPZNR5lOVbdXmHPSDViQBuHag8efonw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAMtxm/Z/eSzPdWjqOWrL4eOoGajBOl4GN9ewFtawp8=;
 b=c2LuzLGSIcN2fS5dAXCN6Ryp8WuMCgOyhzMEnj18JlXqBg/+np/Dy1LFMT9yWHQaas5XQMflwtSJjnkUuohLviHKmXA70lcWHeHsWqb7pDfTRNw/dfhLd8vNMP63BMLqLIgL1Q0raeFTCwkB6b7assNTSxy59K0IGzVgo7D/HCAkFavjHfe2HSJx8fCnwWZ+/zGjUehrrgYjLu1LyLpTh1wxtMXYEwjG8dBd6xCYuFp1zASGIEZxSuDAF7Xspl1Oa5xto2ERc+5CJW6BeS57u483lNqkQsx093J/SNJbSSy8jTPittwOzR3qNNqoA3Qq8tHwjG2OlhCaOsiBTJu3VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAMtxm/Z/eSzPdWjqOWrL4eOoGajBOl4GN9ewFtawp8=;
 b=pXRNX6aL8xc0fogKGf4+azHRDVeOPhCzHsHBo+4jg6J+G0Vej9wBPtF7JAqWytabfttFLkRkkd8/IV5/xRTV5r2wQ4QOWHkq7tuJc42WK5tD12p9riFmjMHbNxodxlT1x6887uxUtlkKS8avpQ6QC1OBjPvLmM96YxaetjPTu06FCXe16ZW8HaWA7wlQFqzQLYOhvvzq3Y9RjVKl9NbT68kAiArjPu1v4IKsYa3amDfqp/ID1evAqi+9pZuLg+6ctp8ePWJKJHoQMTju3wepHIwQdNkTNedU6sLMr9qQKBCmZUek1KF60Hnl9E6D+JrvpTsPfWPBTilFbAswZJ4YCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4084.namprd12.prod.outlook.com (2603:10b6:a03:205::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.14; Tue, 18 Feb
 2025 13:07:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 13:07:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Feb 2025 22:07:10 +0900
Message-Id: <D7VLEXCQ5VYN.3N0G7XXCVLH6L@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Dirk Behme" <dirk.behme@de.bosch.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
 <8d95cfde-30bc-4937-99d3-0077df43867a@de.bosch.com>
In-Reply-To: <8d95cfde-30bc-4937-99d3-0077df43867a@de.bosch.com>
X-ClientProxiedBy: OSTPR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:604:21a::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4084:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f06011-135d-4d80-b16d-08dd501d2983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|366016|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bVRFZ3RDOXdWRjR3Vm9JNUFYeDQ5V0xRSzk1MTM2dGpBZUlKN0F6UnFMdVZm?=
 =?utf-8?B?WTIwVVZnL0p2OGhZSWlQZTNJOFFXSUVsTEkwMWVXV3BvbFVycGFMa0grMXho?=
 =?utf-8?B?cUJPc1MyenF6NlM3bHJvb1B4VVFHejF6NmtMZEdUT25pWjczT05odXpMRU5q?=
 =?utf-8?B?QitDUWhRdFRnRjYwVVcvL0ZHUWxiSWthZ1hjZTVPRThqZUc1MVZNTFM0MHBX?=
 =?utf-8?B?NGV5ekV4YmhGV1kzVWR0MGFsSStqYm9kdnA1ZTN2NU5IYTNFS3M2dW9hNXNz?=
 =?utf-8?B?NG9seEtvME51TExTeEw0SnNPN2pGcDlwdTlyc21waXp0bEtJTDhINjVaTzQ4?=
 =?utf-8?B?akVkYVBIczNRd0tPUmQ5Q2k1eVlZY3BzcnpZc1ZlYmR1dFJGK08yUVB6d2dC?=
 =?utf-8?B?cWJraU81amZ6ZGZYREhDNVcxeWlrc29KOVhXSGNGOVlGUkh5T3FWQnJHSm1u?=
 =?utf-8?B?T2xiM0ZoQWk2c2pOcHpFSmpwVFNaSmR0b0h5Q0FvTGxackNYMlE0UTR4bStM?=
 =?utf-8?B?aHVvT1ZiUm54c1RNVks3WXNvT3Z1eTd2QVFZbkZXRlJNeHRrUDMwYzdlSHRI?=
 =?utf-8?B?ZWxmMkMxclYwWkgxZlh2NG9YSGxVS2FVUWZodzUrbnFiSDNSU1IwUW0rZzJx?=
 =?utf-8?B?VkVydlowMXBmL3ZNWlcwa1RaRXZ0MGZHVEhTZEwvQjIwcmJpNFRrMHdTYmkr?=
 =?utf-8?B?RXZpNUIyL0JBQmszRWM5Uk9KVVpYeTlYYlZBRDVVbTVBbkk5alYwVUcvS1Rx?=
 =?utf-8?B?WDhibFAxeUk4R1Q3OUVsTVZFNmZFSWtDY25lMzNCNzJYLzZkSkJwdW0wRG84?=
 =?utf-8?B?M0dKL0R1VFEwVnVMNWd3cWVHRFlUS0lEa21jSDJPZEFRekRuaVhEa21wV3Zn?=
 =?utf-8?B?RGJmbGNLNkpPL2FITHhaT3FoeXMrSUFHZmpRbEtwai94akZXVHNOZ0pqQlNu?=
 =?utf-8?B?Z3BIRG9nTFo2THIyUzZBMlpmOGVYKzAramYrR2NTU2UzNlV3bm52SkZlalll?=
 =?utf-8?B?THpzR2VveDR5R09NRndVTmxQWmM5d1NTWXZST1Bxb1JLUmR6Mzl4VjhNYlVN?=
 =?utf-8?B?MDJHZEZZc3VYRzNObEo5UWlscjJSejQxU1ozUW55dGVTR3gwRy9qZ1E4aDlO?=
 =?utf-8?B?UUJtOVVHYjRRUFlZUzdObkxTU3VwbVNOcE92T0w2b2FYNndaVksxUTM5dEtD?=
 =?utf-8?B?YlpLZG9FZEJRUFZ3eHBTWWVncUNBc2h4UnVVenlHd3ZFSytoeWxzZXRZUW85?=
 =?utf-8?B?MDJsSldaSi9kYm5OcDBxd0c3UjNNRkR2ZmlmZk14TTcxNXVHb0M3R1g5d1N2?=
 =?utf-8?B?ait1K2t5OFpORENWSU1oL01lMVVmcmN0R2l3NDU2UDlhZTVvTHVkQkZldExM?=
 =?utf-8?B?UG1xQ1dCRjZad1hLNWFxLzI3ODA3Q2JBa0hXbmtNUTRGYWpLdENTYXFUMkZQ?=
 =?utf-8?B?Vi83SW55aXZycGMrMXJxdHAreGtZaGFKd1ZoTUlUdWp1TFhvNGRTb0RDTzc2?=
 =?utf-8?B?M0czRFk0c2Q1OVhjcXNSUDdkOGtoSGVlYVc1ZGtBK3JNTkRXZUI3dEYvSWZp?=
 =?utf-8?B?VlhZbHNmTWM0dElXVy9udEdGbHpIVHh1SWU5QVFRSVBXVXNZSUIvOWVobU03?=
 =?utf-8?B?YktaQWE0Z2Q0aXREZWxZRUJUT1JyRGFtaisyNzQxbkZ2QWJsZWh3MUFCaDhm?=
 =?utf-8?B?TzE0cUVBdjkySXU5OXB5amVRR0tDUDJBd3NEekU0ZmdRNjFOYW1mYUVhdGNl?=
 =?utf-8?B?NElhcGVwWkNMV2dXaThPUmgyZ29GWXFvRkE4WG1LYUR3RkRib2d5NUVNeFNW?=
 =?utf-8?B?K1FhTmQ1MmMrWHVBRTZUMmVDcUdPcDZHelk3YWcxaEtROTdWbXhPdDgzM1lX?=
 =?utf-8?Q?a1wmhZEX2IOBQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dUs0dEszVEZuSDcxd0VZb3RsUVdyTWxBTUw4NXU0ekE0cDlBczdjalQzdUxK?=
 =?utf-8?B?RnBjRFh2T05iSmYyMU0vWi91OHJLc1NHc0xDK08rSDAwRVhRVnJLMDRQTUdW?=
 =?utf-8?B?ZG5yOGdXQnRxMURUeEw2WXhqRkxaS1FqOW9SZkxPLzdVL0o1UXQ1VU9Nd0xU?=
 =?utf-8?B?VVJHalNQWDBCekVCZjV5U2pqeTloRWRBSGEzRUNiVUo5YVUxTklFNmErUWNr?=
 =?utf-8?B?Z2tJOXlsODM3NFIxQWZaZUpmSDV5ZHRkSUNiQjAzcGtZeUpuOGxMY2hOTm9C?=
 =?utf-8?B?dmljNFF6UllCSnRGUXZuMjNISFlaRTZBQ2FvdHFzQVpiQ0FRQnJRMmNodExo?=
 =?utf-8?B?Y3pZaDM4RndpYTBXL3c1L3doZ1NHL1Avemt0TStLYURwTzNjWGEwc2JrTG1P?=
 =?utf-8?B?K2pxeXpPMGJ0S3JQUFo0RmtLTFp1NXF0STRBK3lJOTRaQmo2YkJVbUN1cTN6?=
 =?utf-8?B?c1c2b1dsR1R4S20yM21IczFRc28zK0Q1NjJpR1NjV1luTUR6QVpCeDFwRWhI?=
 =?utf-8?B?anh5ajZvRVBQNkkvYmlSb1d2OUFvcVpDYkNLSElWMGtDZ0NKRFRCM0kxeGdY?=
 =?utf-8?B?c0FKcGNFWGg5N0M4ZmJSeXJXeXBTWENIZ0NaNjNzMjBUMENrL1VGTkZVY1Nv?=
 =?utf-8?B?ZVNUNFBXWUxrQ2NEV3gvR2JVMTJnek1XTU16VXVTSzR4bTFEV1BvVHZlR29h?=
 =?utf-8?B?R2tNa0lmMU12cDRxcFBpdVhSNU1QMlp0M2cyYzluUTlWNnR6OUhlL2x0THlj?=
 =?utf-8?B?bDZEeWRyV2ZDU1FSL2o4Q0EweVAxSjRqNWZMSytFK25kVlpqQWwwU1lBZ0V3?=
 =?utf-8?B?bXo0Q3ptYmFoQ1IwWG1FcjlqTWIreVArcUMwcklDdWRwbnBiOHVsZXZ3N1oy?=
 =?utf-8?B?ZCsrSFNkZ0lWenZKbHJBU3lBR0VGS0NlbzN6a1piN1NGN0hFaFVEM1N3VWhF?=
 =?utf-8?B?SHBieDFLaWNqUnc4ZEVoVUJMTmZKVGNPTXBxelJOaTZZQVIzT3RndHZmTzB1?=
 =?utf-8?B?R29BaFhkY21PUWttMWVGOVptNk5YL2ducEVGbll0TnlwYVQxSks4b2lGTXU1?=
 =?utf-8?B?b25xUklXT0lERU5SdFZFcksvbFdOYUpzYVFORGlsdFRiMXV3UTlneWNKOG0r?=
 =?utf-8?B?dFhRdnpCakZNaFhCOE8vQkdtWUoyeEJ0WWRYNXpuZnl2SUliYzh0VE1rUkx6?=
 =?utf-8?B?dzZ5MEpTMlJVbW12SUpOUnBjbkQrNkVRS2Q0dk5hL1BGV0FsVG1aQkRzTDQy?=
 =?utf-8?B?Vk50MUFQVHRFWTc0QnRTTkhqeFZVZTIrZTltZXhPL3JzV05WMzV0UGRNMHl0?=
 =?utf-8?B?b2xDNkp2enlRWjVmdGFsUkNDNHpSTmN6ejZBSkY5OGRaajEyaGdrV1JYNllQ?=
 =?utf-8?B?Ujg2bllrR3Y1RjZ1UitBMXdhUjF1Z0l2VUVjZFFqUHNSNUxhY0hPeE5EcXdo?=
 =?utf-8?B?MVFSWHk0Tzk2N0NpeW5Ham5IeFdRUWxlSWtwQTRvbVR4TE5PS2FWRnBmTUtV?=
 =?utf-8?B?b2JIRUs5b0JPUUVlcHRJU0l6YUlrQ2Q2TzQvbFIxdlg0WldtbmtvN0FEa1VP?=
 =?utf-8?B?cUpMQ2twaWZXbHFYbHQzcW5MS3V6M2hCT3dKT3FNYXd1K0d6VU8veTBadW8w?=
 =?utf-8?B?dm5zTjRjT0F2WjZJWktCcFdTMHlEWThkSnBXVEJUYjAyelkzUTJsd3Bsa05L?=
 =?utf-8?B?WUowTzF5aUhpRDJveWIwY2hyVnZhcWhIdlV3NjdrS05SeUtRTnpWSTJXU1pR?=
 =?utf-8?B?SGZUb1ovczNSa1ZVM0U3R2Nhbk9BbmQyajB4c0R5MTVxaG1wZnVxYndhVFlo?=
 =?utf-8?B?UTVjbnM2UmxPeGlXTERDaDJILzB2WkJPRUpzb00rek1PWTlNWEtrbjFCUzEy?=
 =?utf-8?B?eEU3SStuRDZjRVlnN3R4MTJBcWdMaVlFaTkvT0htMHl2VEsvT3U5NFVDQm8r?=
 =?utf-8?B?ZVdaU1FweWp4YTVyL2ZERHNBNEZQSy9uUVZ5WVRKRzIxdDQvblhJQUtsN2pM?=
 =?utf-8?B?VHVjcURFSWVCOFV6c0Fjek1NbXJOamUxWkFmdDZXMVI0MktvaGRGMTZTUmx4?=
 =?utf-8?B?ajV4Vzc0ZWJuYWgzVDZVdkFzcUxCdkVIUXFkdURWaWhzeDZGTXAzbHlJb3du?=
 =?utf-8?B?ejJqdWF2azc5cE1MdFFSMTVDY205d1pEeEtLVDlLeHdrZXJmYjVudlA1RVkx?=
 =?utf-8?Q?nq8xEPH7tFCKoQwooqO3LxLxUjVUj4Rw0BcPpM7Vj4A5?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f06011-135d-4d80-b16d-08dd501d2983
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 13:07:13.8761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hGA/qDR5VNAeFO+C6xPh2t2T1mI5vnCLLo/gKaiSm5RzD39OZWWNwcrtPzwKK8pdTKY1cR4D3j3qCssR+QDiJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4084
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

On Tue Feb 18, 2025 at 7:07 PM JST, Dirk Behme wrote:
> On 17/02/2025 15:04, Alexandre Courbot wrote:
>> It is common to build a u64 from its high and low parts obtained from
>> two 32-bit registers. Conversely, it is also common to split a u64 into
>> two u32s to write them into registers. Add an extension trait for u64
>> that implement these methods in a new `num` module.
>>=20
>> It is expected that this trait will be extended with other useful
>> operations, and similar extension traits implemented for other types.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/lib.rs |  1 +
>>  rust/kernel/num.rs | 32 ++++++++++++++++++++++++++++++++
>>  2 files changed, 33 insertions(+)
>>=20
>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>> index 496ed32b0911a9fdbce5d26738b9cf7ef910b269..8c0c7c20a16aa96e3d3e444b=
e3e03878650ddf77 100644
>> --- a/rust/kernel/lib.rs
>> +++ b/rust/kernel/lib.rs
>> @@ -59,6 +59,7 @@
>>  pub mod miscdevice;
>>  #[cfg(CONFIG_NET)]
>>  pub mod net;
>> +pub mod num;
>>  pub mod of;
>>  pub mod page;
>>  #[cfg(CONFIG_PCI)]
>> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..5e714cbda4575b8d74f50660=
580dc4c5683f8c2b
>> --- /dev/null
>> +++ b/rust/kernel/num.rs
>> @@ -0,0 +1,32 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Numerical and binary utilities for primitive types.
>> +
>> +/// Useful operations for `u64`.
>> +pub trait U64Ext {
>> +    /// Build a `u64` by combining its `high` and `low` parts.
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::U64Ext;
>> +    /// assert_eq!(u64::from_u32s(0x01234567, 0x89abcdef), 0x01234567_8=
9abcdef);
>> +    /// ```
>> +    fn from_u32s(high: u32, low: u32) -> Self;
>> +
>> +    /// Returns the `(high, low)` u32s that constitute `self`.
>> +    ///
>> +    /// ```
>> +    /// use kernel::num::U64Ext;
>> +    /// assert_eq!(u64::into_u32s(0x01234567_89abcdef), (0x1234567, 0x8=
9abcdef));
>> +    /// ```
>> +    fn into_u32s(self) -> (u32, u32);
>> +}
>> +
>> +impl U64Ext for u64 {
>> +    fn from_u32s(high: u32, low: u32) -> Self {
>> +        ((high as u64) << u32::BITS) | low as u64
>> +    }
>> +
>> +    fn into_u32s(self) -> (u32, u32) {
>> +        ((self >> u32::BITS) as u32, self as u32)
>> +    }
>> +}
> Just as a question: Would it make sense to make this more generic?
>
> For example
>
> u64 -> u32, u32 / u32, u32 -> u64 (as done here)
> u32 -> u16, u16 / u16, u16 -> u32
> u16 -> u8, u8 / u8, u8 -> u16
>
> Additionally, I wonder if this might be combined with the Integer trait
> [1]? But the usize and signed ones might not make sense here...
>
> Dirk
>
> [1] E.g.
>
> https://github.com/senekor/linux/commit/7291dcc98e8ab74e34c1600784ec9ff3e=
2fa32d0

I agree something more generic would be nice. One drawback I see though
is that it would have to use more generic (and lengthy) method names -
i.e. `from_components(u32, u32)` instead of `from_u32s`.

I quickly tried to write a completely generic trait where the methods
are auto-implemented from constants and associated types, but got stuck
by the impossibility to use `as` in that context without a macro.

Regardless, I was looking for an already existing trait/module to
leverage instead of introducing a whole new one, maybe the one you
linked is what I was looking for?

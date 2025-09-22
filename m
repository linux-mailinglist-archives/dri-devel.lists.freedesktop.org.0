Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E01B8F4A4
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 09:28:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3099E10E3CB;
	Mon, 22 Sep 2025 07:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kEzMyA+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011012.outbound.protection.outlook.com [40.107.208.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1787D10E3D4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 07:27:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9ChRTVTaMPYd8AktZjiHd7QQCLdsd24aS22VRHffoC5trsRO509cAUTFf33L8xpOH+OBuz2XeDr92BkoZDOCKAqX/ESLxSHGytWc+nC8k/NUr2i1XRSRb/ksNjjH/KG+kaQr8bEOESvF8tlkvGceCoydboQ3wo9RzYo+L/0F+zRqnBLLg859cyP4mssbmrLoFo767AYPOoPHJ9xi69GFFqFZlUc04PMORUWXNGSJkupF518NSCcKpFy1kOZR8YSXBGhU8noQy1J2855dKPq5eZa7AQSGehBnwvknR5xxNSeYWhgAfuzZ3CLidC8hl/YxrN/fOTDdz0j/DPqgAM3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wi9T/LqXsl7MIFU4yUmsXN8WkfPyY1InD+P1+nOAGzA=;
 b=R2JFA/9WkCUEn9dWEjJlZQc/bLBtl2aN9gEJpy/1WVLJnzcuNXLwopaZ7Vv562SkTld2vy8F6++dN6RdPPYhxbvnVQAKv9oD4dsPqfpmIr7sm+SsHAzzEEcwKFDjWQlOh4PYyi0X/Bypy0Nn9kMwIQ/9yJQR2H3TUU1ufR7oHr+zKOL2lMmtwQNnWUMCAr+d7NI5WmgKvvMvpaWpRwzxCJRUEzMimsPKu3fAGylcqw6tCapw15ZL96oB1UNoSNg6p85KaArZC4QWPODVeI+6zDgoDzQ9e+TS38ChwBbilZfyBtJDS4ipA+QinzTcY+1Kb5kpYdaEgrwQW/Cw3lnDuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wi9T/LqXsl7MIFU4yUmsXN8WkfPyY1InD+P1+nOAGzA=;
 b=kEzMyA+9iEuUVTMouJC9qNXOZtHr2YeRRz7NksmSa7SN4jfRcBBiV1xlLr5oIdIbuqfF1vYOmZvM/0LTP2UozN0MVnqTTLPjcS3BT2UgBTBKERVgdxkw1loQnOrym+Epf+ZEdoLRcZ3MU5BAdJwtWVE2PnO+/ayjDCvd0rhVyeNOnqUJ0Grf7xak1nH9ySEQWD5GD5QICxg1Junb0Ktujqe2o1BRU9MDqi/tusvTsJ8Zu5W8LiQAGtKMIwqOY9NochH5jvLKm7qm2pIpmjgMH6k8PSQHFRShmoeDyxsS0dPCaTb85kpTsrJ/Dfs8eb992+/2zhsFjyLHKphFX/kU9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 BL3PR12MB6474.namprd12.prod.outlook.com (2603:10b6:208:3ba::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 22 Sep
 2025 07:27:54 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 07:27:54 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 16/23] staging: media: tegra-video: tegra20: simplify
 format align calculations
Date: Mon, 22 Sep 2025 16:27:51 +0900
Message-ID: <3074302.Sgy9Pd6rRy@senjougahara>
In-Reply-To: <CAPVz0n0TPKa2cVXZdUEAWWHquGeqzj=p-9cXx79jc6RwXLkkGg@mail.gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <4198615.hdfAi7Kttb@senjougahara>
 <CAPVz0n0TPKa2cVXZdUEAWWHquGeqzj=p-9cXx79jc6RwXLkkGg@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0149.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::12) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|BL3PR12MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 52a04169-e899-41dc-a0f1-08ddf9a98b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ck5tSEF1UEtQcG5wbmloSi83N0R6K0w1dGpzU2Z4b3hzWlRLZVIyeHJuTlNx?=
 =?utf-8?B?VzU1bGU0RVZYekorS1grbWRGY0dFZDJpODRHWlZudkY4dTdqWXN6K3YrYnFS?=
 =?utf-8?B?Z0ZHREJPazB0bHhmTWx5SlMyR3NOT0hucjR6c3RUc08ybkk5NmRrUVBBendN?=
 =?utf-8?B?MHZQbUJOejg1Y1ZnYTBvc0lrSnNGMVM4aHFhZjkzaXZVZ2U1SUtZT3dHNHRz?=
 =?utf-8?B?Mis0NFhBSUZpYzZtdmhPekFoQVdIcDFzSWg3SmVmQlQzZ3hmczhWdFd4Sm9G?=
 =?utf-8?B?QWxzRkpOOXFmSUJZN20rSnlkSk9oSStpWWtjblpKT0pXSnVYRFBVTXlSNWlh?=
 =?utf-8?B?MVUydnhib0ZkNWJVMDgyN2RheHQ3dU8vOTk5VFBPaWg4Q01Dbm1Oa1FlZjBi?=
 =?utf-8?B?NDRkclZHdm1lSzU5bTRwUjdDSXRocVk5T3N0L3dWRGdBMEM1eDVXNWc4TDRp?=
 =?utf-8?B?MDY2ZjZsclNYZmxVSk1YcGxLbndjaTU2VmdZZmlLWFVhbmJhN1h2amxIQnVn?=
 =?utf-8?B?UmgvWHFRZE94TXg0T01hVStCb3JMNmJSNGQ4STFDMWVncUR5K2pDUzQwcXpw?=
 =?utf-8?B?SThGdU1kOHR4b21xQlFpcVFNMXk5bnRtQWI2RHFQR2tucjYyZGk2ZDF2OEdU?=
 =?utf-8?B?cjc1SHB2NXNGRnlyUzMvTjVuVjFCdFdud0I0MkhTYnNsbmNXSEVOTUNjRjMv?=
 =?utf-8?B?SHdFT0crYXlLOGUwdVhlakRXY3FYOS9BQzczdE9OcWJKU050ejhiWVhRbmFR?=
 =?utf-8?B?MXhHcjZKQ1lSeEQ3YjcxWmxnUTQ3b0lza2tBMVpPTStpZjNpZ3dnZTN4VmhB?=
 =?utf-8?B?WjlNbWdMTWprODczakpZOVQzSnNIUks2ZkRWR01mdkVRNWFOYWwyZUd5SVFi?=
 =?utf-8?B?K3hTUXdIdGxYeExlYW5zRzd2eUZ3S1hoZEs2cGxTUEJQckV2YjFmQjlralF3?=
 =?utf-8?B?M25VdENlZVhoTTYwWUhTMTdHU2F5MHlGZEV6ZEk0VWVUQlc0UjQ5NUxjMExW?=
 =?utf-8?B?RE1yV2hKaExBZjhHM25BVC92aDRaMXV2MllpTWErN3g4NjBpamJ0M1hCdlVq?=
 =?utf-8?B?MzYvNCtNbGpCaVZQb3BuSURmUjNaSXdaL3M0bzQ0ejRTRG9vMk8xK2FhSGho?=
 =?utf-8?B?NkFXSVNWd1dROGhYWnpmRCtSODVMWG1Wa1hXck8xMTgreWh1NTBxMDk2akNP?=
 =?utf-8?B?ZEVuc3lHVFlHYThmTUlRMlYyTWJHQkFkVHQ3cXhRK1phdGJJdlVUMzZwZGJx?=
 =?utf-8?B?WEI3dWVNQ1hDQ3ZTWTI2UnlSYnkrTVhOZ2NZQ2RlTFdJa3NCKzFJcUxkLzdm?=
 =?utf-8?B?WmVRZ292a2xxUUNYcnVDd2JSTjNJZ0tiV2hVU0JQYURFN0VyZFJhZzZDckN0?=
 =?utf-8?B?YjJqbkdWTGd5T2s3eXhtRURXTk5jTW5IVWNPSDJqKzhXRWhUZFZhUzN6b3dV?=
 =?utf-8?B?M2VOYUYrcURvVU5zd1F1VzJGemp2eXQyTFo1WmF4TkYySUFiQjk3TXRIUFNW?=
 =?utf-8?B?dU9VeGI5aTJraVhQTHYxckpRWlNYV09jZDZMRFN1TWlHZVhYNmdWbCtXU01j?=
 =?utf-8?B?L0VoTzhOQ1AvK1pPM01XYy9mUmpZcHBNQWREZ3Q1eG1JV2JzK1o1QWExd3NO?=
 =?utf-8?B?MDNqbVpLaTVGTlNUaExOS1NtRlp2TDd6OTM5dW1LcW5kVForbHh0a3Z3blEw?=
 =?utf-8?B?TnF6bXk3TmpPcDhwVENEOGEvYVJRVTVKclpVZFd0dTdQdUFGenFXcGxkZ0RM?=
 =?utf-8?B?VnNsL3JjTXlVQmZCVzlDUHhqNndMMWo4QTdqamFidU9jTVpOd3kzc1ptbDBF?=
 =?utf-8?B?SGlSelY5cncwMVg3cjdaN0lReTc4N2l3TjBXUTBaeW1uejJxN1l0MDllaE5n?=
 =?utf-8?B?cERGNzViWlE3VEhRdlZ3dGxiQUZrbDVaWjNKYkpFYmYxNThKdElweklYcW5z?=
 =?utf-8?Q?cDKMoJYH7co=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXREUHhheHJyb1phdC9OTnkvZUhvckpXKzJaeHlmdVBOYnhlNElwWC9QL0Rh?=
 =?utf-8?B?R2x1Njk0TUtyM3lqUGpVSmU3SW92ZzRlbXp3SHpIRHR5KzJLMjJwSGYwZm05?=
 =?utf-8?B?Ui9MMnFnOW1xenlGVWxFeGtqR2hTSFdDTFlKdnFBbWUxejRJY0FpelFNMVgy?=
 =?utf-8?B?OVpMNFNBM3EyeUNYSGM0Q1JRdk1Fcm9MaUhxUHlyZjdKM1JWYU1PVEU5Mkla?=
 =?utf-8?B?Rm1qQi9JZlJaZFBZT0gyWUlLRURJdU1kWVc2b3o1V2JpRUJxT2hyU0RjU051?=
 =?utf-8?B?dlVIR3ArNXNWZ0E2VHhYYWRpbTVHdG1BYlhNWTZTZm1vbTQxQUdMcmlIWkd4?=
 =?utf-8?B?VS9sWEIvMkt0VG0vY2VYdGo5T2pya1JJRFVWa3NOT2ZHWU1sQWRrQ3BZOFVt?=
 =?utf-8?B?RzhBRHdKOVY4TEZFcjlFVzMzWjFqUkFwQkJxR2IwaHB2UWc0RCtobVJwUjVO?=
 =?utf-8?B?bXBnQUJvVEcyVzRtL3YxVC83NHhBRXowZFBTa2FCTXdud01Udlh6ZllKZ1lI?=
 =?utf-8?B?RC9aOTQzNzg4UlZzamY2L25nSCtzSUk1RWYrcTd6dFJjcVFuNGJlNThKZXVh?=
 =?utf-8?B?dGJ5NzVHN0VBVksvRE9OcWFsdUdBS1JINTNvOUdjdGtPUDN2VHN0UFZGYXUy?=
 =?utf-8?B?WndDTXlFaVo2ZFRpMllpOEJqdnJ4YlVSd2J6NytKZjVMRWtPTGFSZjZteDV1?=
 =?utf-8?B?ajlHSGx2ZXJ2Mm5XemwvK0JROTJONmI4ZlZHUkEzUlBQQm5Jd05XUDl4dy9H?=
 =?utf-8?B?TzdIZUF0YnMxcDNnVFFpVTREUmdUbEdtYkU4dW9iY3ZFMzBxMVBTdFJwajdE?=
 =?utf-8?B?NnJDUFcxckM4bCtFZi9UK3RLb1NOWFNINkpMcm9vRm5FaGw5bzk4dmZvRXds?=
 =?utf-8?B?WnJUcy9UN0lTYlFqUDZveUNubWFpSjcvb0NyWGFRSTVjN01pVE5qdGxWMzg5?=
 =?utf-8?B?WTMvZUl2Skw1L0t4L1JZRnc4Q0hmdHNlOUUxcHhzMFRxZCtvd2d4MDdCTzZu?=
 =?utf-8?B?amhQNmhqUDBOenNXY2ZnUHVlWWhYNE1UaDJxdmgrQnJpdVk1YUZKeWF0b3NZ?=
 =?utf-8?B?YWxqOWcwbEJ2TDEvek0rOXBtLzZSRGowRVY5b2NGREZlS1hYYThaZUQxcVZh?=
 =?utf-8?B?UmFqbmMyckU3N3hFRXZHMFhmNXV6UGhxeU52QXBQbzFYU3JiTmFLbUx6dUsy?=
 =?utf-8?B?ZEZ3SGZVbmo1RUxJK1hGMi9aZzNvdXFDc1kvQ3U5TkFPVDFJWEg0VFZMbmZ4?=
 =?utf-8?B?RTBIVVFINFZVczE5NnVDZ3NrRi9KTUxwQ1llTk45MEdsL1VKT3N4dWJkcHZo?=
 =?utf-8?B?TFp6TlVsZVh5SGQxLzJUd0ZxYitSaWRVbzFyZGNMZnlvc1RvOXIwcU15Vk5N?=
 =?utf-8?B?alpnRjZ6K21QaEk4bzJ1QWNrOVpYK2gvWHpMbEVaY244MXNJcC9aOTl3Tmgw?=
 =?utf-8?B?cnRETFA4eTdPV3hWdlJ6K3ZhOEhMUENIWDVFRUxIVUk3UzM5aXRoNXdLUnVL?=
 =?utf-8?B?TmMvNHJhdk50YWVZb1ViRDhseVl4VGFUaDY4RFJqcm9lMlpOcDlHcDVnK2Yv?=
 =?utf-8?B?UVVCNEszMnNydkttR1cra2J4bExGVGpLVDgySFJlVEcrZ0VnczJnaDBHenAy?=
 =?utf-8?B?R2dZVTJVNXl2enIwRjRMWTRBVkp5a3FONUVPNnphWG41bkF5d2lPSFhJU1VG?=
 =?utf-8?B?eTZvMm45SGJkSHpHWk5ONDNjcUgrMWlqa3JMOW40RWxHdFlhN1BtczNkaEkw?=
 =?utf-8?B?U05qVWU0b3lDakxyRkRtbGVyUU95YUQ2ZHd1R3NleGVaSVEwcGxuclY3dDRu?=
 =?utf-8?B?akI0S0pCRWNNNlM4Mk5DQ0xZSjduczdhamMyWG16MzJWWmNnT0ZhNm1tb2Z6?=
 =?utf-8?B?S1dMQTF5MGRUNkcwZnd3Sm91STl3cUErOVRDVnllWWIwNkozT0dXY3oyTHpW?=
 =?utf-8?B?OXVubEkzQTBsZzFsNlV3cHp3Q1VBOG5KNUlLT1hKbElDbThXekZtU0hmV3ln?=
 =?utf-8?B?ZzRrNHNEVmEzekRiQitweTBxRHQrOW5icEJtTXFqdFlJOGQ5eGZyTmR1VXBV?=
 =?utf-8?B?b2JiWFF3WnFsd3lxOE1rY1lrcGtDeDRFS3BrZU83VGRUQVlxZU4yMHpucVFC?=
 =?utf-8?B?U1p3blpVZXBSeGdqeEtsVG00RTNEdFRyRnJJdVMwRkl5YzNoR0w3VVNGNHY3?=
 =?utf-8?B?NmVxYUp3ejJVT1hZOTJNWDFTN0R4dHY4dHk2amRweHZYWlhsenJaeEp0elAr?=
 =?utf-8?B?dEx1c3FwZVp1amhqRzZlZmNRTEdnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52a04169-e899-41dc-a0f1-08ddf9a98b7b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 07:27:54.3262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QDZNkMDXihUJUw1/AaOt6AzDFrUA5KhJbS9Cx9NLpdXAd8nCJlTf74NTxEM1Ej5qR6X6lQrueSXBDPA25uet8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6474
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

On Monday, September 22, 2025 3:30=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:23 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Monday, September 22, 2025 2:13=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 07:4=
4 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wr=
ote:
> > > > > Simplify format align calculations by slightly modifying supporte=
d formats
> > > > > structure.
> > > > >
> > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > > ---
> > > > >  drivers/staging/media/tegra-video/tegra20.c | 41 ++++++++-------=
------
> > > > >  1 file changed, 16 insertions(+), 25 deletions(-)
> > > > >
> > > > > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/driver=
s/staging/media/tegra-video/tegra20.c
> > > > > index 6e0b3b728623..781c4e8ec856 100644
> > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(struct v4l2_pi=
x_format *pix, unsigned int bpp)
> > > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MIN_WIDTH,  TEGR=
A20_MAX_WIDTH);
> > > > >       pix->height =3D clamp(pix->height, TEGRA20_MIN_HEIGHT, TEGR=
A20_MAX_HEIGHT);
> > > > >
> > > > > -     switch (pix->pixelformat) {
> > > > > -     case V4L2_PIX_FMT_UYVY:
> > > > > -     case V4L2_PIX_FMT_VYUY:
> > > > > -     case V4L2_PIX_FMT_YUYV:
> > > > > -     case V4L2_PIX_FMT_YVYU:
> > > > > -             pix->bytesperline =3D roundup(pix->width, 2) * 2;
> > > > > -             pix->sizeimage =3D roundup(pix->width, 2) * 2 * pix=
->height;
> > > > > -             break;
> > > > > -     case V4L2_PIX_FMT_YUV420:
> > > > > -     case V4L2_PIX_FMT_YVU420:
> > > > > -             pix->bytesperline =3D roundup(pix->width, 8);
> > > > > -             pix->sizeimage =3D roundup(pix->width, 8) * pix->he=
ight * 3 / 2;
> > > > > -             break;
> > > > > -     }
> > > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width * bpp, 8);
> > > >
> > > > Assuming the bpp is coming from the format table below, this change=
s the value of bytesperline for planar formats. With this it'll be (width *=
 12) / 8 i.e. width * 3/2, which doesn't sound right.
> > > >
> > >
> > > Downstream uses soc_mbus_bytes_per_line for this calculation which wa=
s
> > > deprecated some time ago, here is a fragment
> > >
> > > s32 soc_mbus_bytes_per_line(u32 width, const struct soc_mbus_pixelfmt=
 *mf)
> > > {
> > >  if (mf->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> > >  return 0;
> > >
> > >  if (mf->layout !=3D SOC_MBUS_LAYOUT_PACKED)
> > >  return width * mf->bits_per_sample / 8;
> > >
> > >  switch (mf->packing) {
> > >  case SOC_MBUS_PACKING_NONE:
> > >   return width * mf->bits_per_sample / 8;
> > >  case SOC_MBUS_PACKING_2X8_PADHI:
> > >  case SOC_MBUS_PACKING_2X8_PADLO:
> > >  case SOC_MBUS_PACKING_EXTEND16:
> > >   return width * 2;
> > >  case SOC_MBUS_PACKING_1_5X8:
> > >   return width * 3 / 2;
> > >  case SOC_MBUS_PACKING_VARIABLE:
> > >   return 0;
> > >  }
> > >    return -EINVAL;
> > > }
> > >
> > > V4L2_PIX_FMT_YUV420 and V4L2_PIX_FMT_YVU420 are classified as
> > > SOC_MBUS_PACKING_1_5X8 hence we get width * 3/2
> >
> > Googling this brings up the entry
> >
> > {
> >         .code =3D V4L2_MBUS_FMT_YUYV8_1_5X8,
> >         .fmt =3D {
> >                 .fourcc                 =3D V4L2_PIX_FMT_YUV420,
> >                 .name                   =3D "YUYV 4:2:0",
> >                 .bits_per_sample                =3D 8,
> >                 .packing                        =3D SOC_MBUS_PACKING_1_=
5X8,
> >                 .order                  =3D SOC_MBUS_ORDER_LE,
> >                 .layout                 =3D SOC_MBUS_LAYOUT_PACKED,
> >         },
> > }
> >
> > which matches that you're describing. It doesn't make sense to me, sinc=
e it at the same time specifies PIX_FMT_YUV420 (which is planar with 3 plan=
es, as documented by include/uapi/linux/videodev2.h), and LAYOUT_PACKED
> >
> > /**
> >  * enum soc_mbus_layout - planes layout in memory
> >  * @SOC_MBUS_LAYOUT_PACKED:             color components packed
> >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_U_V:      YUV components stored in 3 plan=
es (4:2:2)
> >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_C:        YUV components stored in a luma=
 and a
> >  *                                      chroma plane (C plane is half t=
he size
> >  *                                      of Y plane)
> >  * @SOC_MBUS_LAYOUT_PLANAR_Y_C:         YUV components stored in a luma=
 and a
> >  *                                      chroma plane (C plane is the sa=
me size
> >  *                                      as Y plane)
> >  */
> > enum soc_mbus_layout {
> >         SOC_MBUS_LAYOUT_PACKED =3D 0,
> >         SOC_MBUS_LAYOUT_PLANAR_2Y_U_V,
> >         SOC_MBUS_LAYOUT_PLANAR_2Y_C,
> >         SOC_MBUS_LAYOUT_PLANAR_Y_C,
> > };
> >
> > i.e. non-planar. The code in the driver is handling it as three planes =
as well, with addresses VB0_BASE_ADDRESS/VB0_BASE_ADDRESS_U/VB0_BASE_ADDRES=
S_V. Since the planes are separate, there should be no need to have more th=
an 'width' samples per line.
> >
>=20
> I did not invent this, I have just simplified this calculation from
> downstream, output values remain same. I have no cameras which can
> output V4L2_PIX_FMT_YUV420 or V4L2_PIX_FMT_YVU420 so I cannot test if
> this works either. Other YUV and RAW formats were tested on real HW
> and work perfectly fine.

My understanding from the code was, that the MEDIA_BUS_FMT_ formats listed =
in the video format table refer to the input formats from the camera, and t=
he V4L2_PIX_FMT_ formats to output formats from VI. Hence VI could input UY=
VY8_2X8 and write to memory in YUV420. The code dealing with V4L2_PIX_FMT_ =
values seems to be related to the output to memory. Is it possible to test =
this (your camera -> VI converts to YUV420) or am I mistaken?

It's certainly possible that the current code is functional -- if bytesperl=
ine is set to a too large value and that information flows to userspace, it=
 could still read the buffer. It would just waste memory.

>=20
> > >
> > > > > +     pix->sizeimage =3D pix->bytesperline * pix->height;
> > > > >  }
> > > > >
> > > > >  /*
> > > > > @@ -576,20 +564,23 @@ static const struct tegra_vi_ops tegra20_vi=
_ops =3D {
> > > > >       .vi_stop_streaming =3D tegra20_vi_stop_streaming,
> > > > >  };
> > > > >
> > > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC)    \
> > > > > -{                                                    \
> > > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,           \
> > > > > -     .bpp     =3D BPP,                                 \
> > > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,               \
> > > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MBUS_CODE, BPP, =
FOURCC)      \
> > > > > +{                                                               =
     \
> > > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYPE,            =
       \
> > > > > +     .bit_width      =3D BIT_WIDTH,                             =
       \
> > > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE,             =
       \
> > > > > +     .bpp            =3D BPP,                                   =
       \
> > > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,                 =
       \
> > > > >  }
> > > > >
> > > > >  static const struct tegra_video_format tegra20_video_formats[] =
=3D {
> > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > > +     /* YUV422 */
> > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16, UYVY),
> > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16, VYUY),
> > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16, YUYV),
> > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16, YVYU),
> > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
> > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> > > > >  };
> > > > >
> > > > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > > >
> > > >
> > > >
> > > >
> > > >
> >
> >
> >
> >





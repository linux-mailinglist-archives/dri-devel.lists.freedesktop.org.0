Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E7CB1E0D0
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 05:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A13910E8C0;
	Fri,  8 Aug 2025 03:08:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uAOP6H7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2076.outbound.protection.outlook.com [40.107.244.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D71F310E8B7;
 Fri,  8 Aug 2025 03:08:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MqoHNcpVM9k3g1GieKnKwOIwVKKLyYERJGiiXoz/ebRVsVS7GzMYKviZq35tXnH4nSgNMMprFhS+m5m6zOqk8zgDbTFhmOLa1gzHJ70Ft3f4HnKE3l4GpAiFOsho1IwjkH7gpmqTnLy6fZ8zsj/U4RhwxgebnJT08gxwUCfisK+fv3a1I2dcsRlwhP9bVgdGaDvIlwL1GDF+XuMBZmnL2YCS0oQW7JWGdKpDksFYtyFf77ZvrFKx0jPgz6505iezc1fyEy7XUquKmiqhnIMLOPvy9iQMY/5SseLv30LhjccGbj0aWk6wooKG1YHVMariIgoZKaGzIzMsoDvbMdFPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x9W123PpjDYEpyW8KGTcKsQAV2FhbePtIiXa5a2sAN0=;
 b=HAURgpatl7snxLfNddC3v9EwmZWiz4I++t0QwXKSto8QH8JFBbG6VxqcXaa9YoqTVRobtFX9W11K+eNCW5RKxR+WoXEo+yRi/WT0ia1P43K6Hq1tbMTbDuM7QokrBYaUlkrGT4K7NKSodImVXet+zED62TfLZDG9V67GpQNpPYO5f8kEjKTMTwxXSaY8mQlSkMh3zw5ZDGTyaRFRDcapbsDlVWsdnHffckB4CpJN393cNSJgMMGaH3dLXxfVuTyFN1+ILIbyBksZGSSrE4/tWuQeAYmD6ho6tF7S+AS5zVsvtXslC8X2GyYR8VduKmGkDRR2CKocAnIW2rHrFyl90g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9W123PpjDYEpyW8KGTcKsQAV2FhbePtIiXa5a2sAN0=;
 b=uAOP6H7ReOuXg7PfpSxi5LiFw084Fv7Ie4hf8wJ4T4qZPTd8FzLNPT69v2T+OSP3ndqBgVLob9KflZKuMI97au0eOTpKxHsfKZH07EyaGTTArMKx4A7rDyjHhNSfnVPSUKSCu2HkTERvfEJnQFnxO8qJX7BVjUyheuwQX+LyCB+TeGzmD0owpbbAZS+9CLzJBvghf+UoVU4OYPBHUOlV2xw/8Ah7ZX81yCMKWEqIS24t6p0DGP1WZaPs0X+dK6k/F2SYLtddt3wS42AymzOiO7loviYh0yniv96Dcca6XbMecMhUHs26xVFlD9vTl2dlm7yUSncypDaM9BZsbXvQTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6421.namprd12.prod.outlook.com (2603:10b6:8:b7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Fri, 8 Aug
 2025 03:08:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 03:08:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 08 Aug 2025 12:08:15 +0900
Subject: [PATCH] gpu: nova-core: falcon: align DMA transfers to 256 bytes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-falcondma_256b-v1-1-15f911d89ffd@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAB5qlWgC/x3MQQqAIBBA0avErBNsyJKuEhGWYw2UhUIE4t2Tl
 m/xf4JIgSnCUCUI9HDkyxc0dQXrbvxGgm0xoEQltdTCmWO9vD3NjKpbhHKLNqjJYt9Cie5Ajt9
 /OE45fxuvW4lgAAAA
X-Change-ID: 20250808-falcondma_256b-5fb8a28ed274
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:404:a6::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cc36491-a37b-4319-7406-08ddd628dc52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|1800799024|10070799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cVN3VDJqYWtpQk5FWkxncmFwdDYvaGljZkxVckJtTHBXOVBzdXBaN3ZTV3B6?=
 =?utf-8?B?QUN5TGFPcFRPZlZqaGxqbGQwRDF6clJBakg0QVR3dFJOeTVmSFB6MmxEK1hS?=
 =?utf-8?B?RUZiL3JMMzg5TC8wKzhETVVTbGtDN21Xb0pPUzIzb1hLcDVsbi85Rk4zcndH?=
 =?utf-8?B?UnBoNTM2cWFtMTJWOHZzVGxvNTNOT0xXWXhMUjVsZXN0Vzk0QU5Mc2p3UW9Y?=
 =?utf-8?B?SWYyVnBJZFVJYjhiSksxWGRqYytQSC9FOVRYUVloaXFFMHdlVVBROFh2c292?=
 =?utf-8?B?UDVnOEZibDR0ejByMXRUQXN0MGZOa1dCVDNYK0hQSlVaZTFUQmZuenJRSU5j?=
 =?utf-8?B?bjZENmUvVGF5SHNiVWszM29Nb0xWRExQWFlrVStPSjFuQ0FVbE8vNENLZjB2?=
 =?utf-8?B?Sjh4S3hsQ1Yvdk9veGI3QVdTM1ZkMlhtRERTaVlKNHNCWkZpTVQ0UGRta2Vj?=
 =?utf-8?B?cEpFRWFBQW0rV0ZSc05uODFiQW1VMXZ6UFJXWndRSTZnOSsySG5pVDE5bnFa?=
 =?utf-8?B?MC9FWFF2MjdPbFIwK0dOdkdXSURNRVpDbnVpNnU4TzN3Wk1UdzVrVndyT29n?=
 =?utf-8?B?MXVFbngyaGVuR09jdVJlWE5EcXNZbUswRnNyclNOT040Y0Q5S0ZXY2FQa0pH?=
 =?utf-8?B?Z1pVS0N3WEFhNUFJTDhjSEVTSXowUVZiWXMyT2hEdGd0Z29jSUJ0SDAyVEZU?=
 =?utf-8?B?Y2F0a3p0KzR1cWlYQ0pZVWRlSmN6bUtwa2Y0SXd0SHpiVjNyNTBNTEZKQkRO?=
 =?utf-8?B?MU8ya3YzalNtaFVMQlh1RVV0b0p6bW9wQTFuamRpeC8vc0UzMVd1eUkrMTBX?=
 =?utf-8?B?UGRoeWh4RHhLWnpZTzdRNnRtZ1VXL0g2bGxlb1liVUxITmhSQktyRFl5WGtm?=
 =?utf-8?B?MkFsWHlsdjFRNUs2MlFxUldFZEZ5SGJOMkQ0bTlsajdGZkZKc3dJOEt3Zjlv?=
 =?utf-8?B?d0VsMHpVRmthV2g0dFJsWFFPV2tWKzMzY0xSVEZZT244N1Bpc3dsRlpvSjFo?=
 =?utf-8?B?TldZY0UyUDJGZ3V0NUNSOENUTUlNWFQzT21xZWZ3ajZiWTBzK2RoTXpsdjdN?=
 =?utf-8?B?enczcnhWeXpRN094Q1hqU2FKNXZzYmhSVkRrNk9NQVpHU09mdXo4VUdkZmFm?=
 =?utf-8?B?Ui9vTXIxVFpQNUJjVzVTRlhpRy94ZVcvaWJpZDBRT0Yrc3pJNStHSDk1dWtr?=
 =?utf-8?B?K3B2a0pkRVAyK0cwWk1PQ3FMc1JwbkFNZjhJeGxBS01kdFpQdWg0UkZUUStL?=
 =?utf-8?B?eHRULzNSanRqK05jYUdrczBkYkVjZTJqZERvQklhTU9vNzhzbVNseHdzejlV?=
 =?utf-8?B?UVBUN2Fwd205RU5idldtaTlGZ1Y0VzBkV1A5NG96ZU4rRHdNWFI0OStuZmxE?=
 =?utf-8?B?Z2ZZa0x3dEVjajdhM0FMZnBUTExQbzlacXd4SzZPdi9FeTFIdDBrVnpJQVBq?=
 =?utf-8?B?YVBFQzBZV3FNY1Q4Z28rTHBuc0s5RlZ3eERzUTBiY3FJQ29tbm4vVnkzUGZ3?=
 =?utf-8?B?NjJvU2ttOVZhb1h4QXFtclZBVWNPRHBQU0hLMFFCU0ROeGdHbWRTaXdOYmFV?=
 =?utf-8?B?dUtxSjVrdnFRRW9TWDd2SUt3NUIyUmNPOTlzWmd3bFQ4QWFJSjNmNlFnMWx6?=
 =?utf-8?B?QWI1K1U5NWxTUm5DRmd1YURGYlFjYkVkSlVDbSt3akdwZE45UDBTWGcwR25t?=
 =?utf-8?B?anN1RkJNazlSdm5BTnZmM3ViY0NVSVBYRWJGRnVsZ09OVi9EL1IyNmI3Rjht?=
 =?utf-8?B?Q1JNa0VtOGFhTy9XRk85ZVh6RmNkaW15S1lHa0lvQTB4amQ0bEdNK0UwR2lk?=
 =?utf-8?B?UzA1dm9ySUNCWmdieVhBWDgvRCsxMVlLNHJsTjVjd3JHNW5BeEpBWUVHcng4?=
 =?utf-8?B?L2pHbkJqcHZRT3krWEg4NUc0RkNGMS9ETGZUS1dZRFlEQXd0LzVUR0NlWTRJ?=
 =?utf-8?Q?Hji/P80cefI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WERGTk1taXJiNnM5d0pzN1ZPT3FXd2pHVnBwWDFlR01wUU1FdWtqT2hseTd3?=
 =?utf-8?B?WmxiSXhZSkhZM1hpTFhPQjRJN0ZHMjRSQUxYcUh4dERia1hVSytBZkJwMTFr?=
 =?utf-8?B?K0NYWHFVeVRYbXhaR0JLRklYajMrQXhtVEZlWGxESXhGS1hrVTNsMHRCaTJh?=
 =?utf-8?B?TzQwY1c5dE1YeU1QL1NlcWFxckpGWFhmSWttWDlFSzRXUTdPVXpyQkxFSWdO?=
 =?utf-8?B?MWQyUFo3V2I0SWQ5NktaL2hncVY3LzdIZTRiTnJJK3FhYzBIWlI2R1FUeWVL?=
 =?utf-8?B?TkpNdEFId1p2MExoaVZsZWtDdm8yeHVHTWJ1KzZ4clZYZlZDamx3eGtoOXA1?=
 =?utf-8?B?dEJJMUxwMzFXTEJXYzZFNzVYdi8xS05yUVorTldpR280VlEzU3gxS1FXOTJx?=
 =?utf-8?B?WE1QZGl2cjNzOG1FRW1tRDBhNHF3Ty9qVlVQRkQ4TFhKOFI0bU5NK0N6ZW95?=
 =?utf-8?B?Y3Q0MjlIR3A5R0tNcDZ1dklKalpUTTBHOGoyZmU1UllzRkx1anc3UnBoSy9u?=
 =?utf-8?B?L2x4WGxwMVFwNG1DcGhjMW5KcDB2N3dDQlBHKysydW45MW15Ujc0Z3dKbFJM?=
 =?utf-8?B?QVlmSzZNYTd1U05FeW1NUEZpTUt2d251OUpsZUV3UkFtaFdvdDZ1bFJEdTgy?=
 =?utf-8?B?SjRUeXZvWnBtcVJKOWRQcDdEdStwcEllcEcreDA5NmI0K3NCdHlTUDRIOXR5?=
 =?utf-8?B?UnFjSTV5ZmJuUDIvMWdUSUtGKzExU1NpTnZDWE1XZFNPMFcyaXYzdTZZWG9D?=
 =?utf-8?B?N2syMjBzQXN0c0FvR1h5WVQ1RE9zZGJ6ekVIOGV3bjAwS1RLWHZCdnlHenFp?=
 =?utf-8?B?MDFaeVJTTUloSG5lME9xZUpQeXJCc3pIMHVoZkJoRDdjVmhVMVFTalJ5MEhq?=
 =?utf-8?B?OXZHK3FqZ2MyVkl0NnZQdTROZ1FicG9oc0VIb1hUZE1yMVE5WHU5eFR3eHk3?=
 =?utf-8?B?UW91WmZEOWNkM3BveFl6SFRPTWhEamhxMm1qaW4rNmduOUlnT2szQmtCOW43?=
 =?utf-8?B?VVlRL3hUZzUxM3VNSGJOVitJYkhjM0NQU1V4WkNidGs5eFQyYWt4bGlvT1Jr?=
 =?utf-8?B?aWtUcjNVOUgyUEl4eWxGQVlYODl3c1R1WTBpbWxiOS9xajlqT2d0SHV3UHB3?=
 =?utf-8?B?cG5PVkJSYldOanUyMXJLQkRxdFR2RG1FRkdBVWRDUU1CWmgwL3c4OW1sMzgv?=
 =?utf-8?B?bzN3aHNPbE5HYVZ5RC9vYlA3cC9zN3VNUkU4VHJJbGdobFRLWnNFUGhrYU50?=
 =?utf-8?B?NkVyT2NUbStsNmhBamtEVmx3bWN4d29XOHZkZndMQTNBVVBRNGhWVnZJT0Fp?=
 =?utf-8?B?SzJYM3pyZksxaHcwUU5mMlIxaGUwZVdKN0NaSWp3eDVyVTEvZWdTOWhhbW5Q?=
 =?utf-8?B?bTBYWlhkZ1prVTM5eHJNZVg5bi9qc2JzdTRFMm9sTHBQVERQQVdYbjZsNVVH?=
 =?utf-8?B?Mk5adlZCOEhDU3hGZkdPTEhKNk9XTWFmYnAzZFFRYWFQK0dHd21Ia2FnQUJN?=
 =?utf-8?B?d1A1YXBDTzFpMEZ1MnhwejNqTktkS0dEN3dOZmtoMExDOWtNUThmZ0dZZ05I?=
 =?utf-8?B?UEhRYlNQYnlVVUFyM3EwZE1TNXhwMGl5ZkZQU3Mxem5jYUVKbTd0dm0yMkNx?=
 =?utf-8?B?KzJqWkZWNVVZN3AzQ3BVanBUM0ZqUjROcFpndGs4NEJYalRCdS8wMk1HNE9J?=
 =?utf-8?B?ajNaellvdC85cG5QckhGdGRMdFg1NE96cHBwblVqWk9HKzdOcTJidEZsc05L?=
 =?utf-8?B?NGg1Zk1adkF0Tk1XaHZEUHVPbVBNQ08wS0pzWjBndzg1VlZTd3EvRDY0bUV6?=
 =?utf-8?B?ZFREZFRZSWRtR2dxcTRQRlVNeVIxNjJrRnJwTjlIZk9HRytHSHpaMFR0SGM2?=
 =?utf-8?B?eXdLVzFXQVQycFQyVWJLZ3FaSU9LbXNjWW5LZU4xM1NYNVUvOGJ3ei9OMjBY?=
 =?utf-8?B?cTI2S0ova3hqRURDdldKbm1SUjFDY1NuOHM4ZmorM0ZySFh0aCtIR1pnWXV3?=
 =?utf-8?B?RklEaGNRN2VPRkgwT1dNQTlrZVdZNzkwRVowRVU2cHdRTTFjZitORmRGUFNP?=
 =?utf-8?B?WDFEaUtFY05LWmNPaFRaQVFPZHBScHpCUEV5Qk1ObUE3cTNxRk0wSjJtaUhP?=
 =?utf-8?B?bDhvaGFPQXhXRUFCWjZrRjQwQnFXL1JxQlcrTTYrbmFqTVlHeTZaRTU2cDVo?=
 =?utf-8?Q?q33sl0e+XF8ikuNxvi+ZhvQVoGKZoSSHPOxrGpF0FGP/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cc36491-a37b-4319-7406-08ddd628dc52
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 03:08:34.1433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmxsgJUF0Noaf214vkOG5MAKmeMTXQ/zt1Iq/lbEcdH9ETJ7SOLRFYd1ainitHbKWMzLaGrBmOxFIeEcFK2CNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6421
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

Falcon DMA transfers are done in 256 bytes increments, and the method
responsible for initiating the transfer checked that the required length
was indeed a multiple of 256. While correct, this also requires callers
to specifically account for this limitation of DMA transfers, and we had
for instance the fwsec code performing a seemingly arbitrary (and
potentially overflowing) upwards alignment of the DMEM load size to
match this requirement.

Let's move that alignment into the loading code itself instead: since it
is working in terms of number of transfers, we can turn this upwards
alignment into a non-overflowing operation, and check that the requested
transfer remains into the limits of the DMA object. This also allows us
to remove a DMA-specific constant in the fwsec code.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
This came up as I was writing the next iteration of the `Alignment`
patchset: the alignment operation done in `fwsec.rs` would have required
an unsightly unwrap, so let's fix it beforehand.
---
 drivers/gpu/nova-core/falcon.rs         | 24 +++++++++++++++++-------
 drivers/gpu/nova-core/firmware/fwsec.rs |  9 +--------
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 50437c67c14a89b6974a121d4408efbcdcb3fdd0..29fa7a2bcb580597762c9b4c7aa4239e51096cd6 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -451,14 +451,24 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             );
             return Err(EINVAL);
         }
-        if load_offsets.len % DMA_LEN > 0 {
+
+        // DMA transfers can only be done in units of 256 bytes.
+        let num_transfers = load_offsets.len.div_ceil(DMA_LEN);
+
+        // Check that the area we are about to transfer is within the bounds of the DMA object.
+        // SAFETY: we are not doing anything with the slice, only checking that it is valid.
+        let _ = unsafe {
+            fw.as_slice(
+                load_offsets.src_start as usize,
+                (num_transfers * DMA_LEN) as usize,
+            )
+        }
+        .inspect_err(|_| {
             dev_err!(
                 self.dev,
-                "DMA transfer length must be a multiple of {}",
-                DMA_LEN
-            );
-            return Err(EINVAL);
-        }
+                "DMA transfer length goes beyond range of DMA object"
+            )
+        })?;
 
         // Set up the base source DMA address.
 
@@ -474,7 +484,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             .set_imem(target_mem == FalconMem::Imem)
             .set_sec(if sec { 1 } else { 0 });
 
-        for pos in (0..load_offsets.len).step_by(DMA_LEN as usize) {
+        for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
             regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
                 .set_offs(load_offsets.dst_start + pos)
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 0dff3cfa90afee0cd4c3348023c8bfd7edccdb29..47f5e4524072888cc3f89520ff4beea766071958 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -202,9 +202,6 @@ pub(crate) struct FwsecFirmware {
     ucode: FirmwareDmaObject<Self, Signed>,
 }
 
-// We need to load full DMEM pages.
-const DMEM_LOAD_SIZE_ALIGN: u32 = 256;
-
 impl FalconLoadParams for FwsecFirmware {
     fn imem_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
@@ -218,11 +215,7 @@ fn dmem_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
             src_start: self.desc.imem_load_size,
             dst_start: self.desc.dmem_phys_base,
-            // TODO[NUMM]: replace with `align_up` once it lands.
-            len: self
-                .desc
-                .dmem_load_size
-                .next_multiple_of(DMEM_LOAD_SIZE_ALIGN),
+            len: self.desc.dmem_load_size,
         }
     }
 

---
base-commit: 14ae91a81ec8fa0bc23170d4aa16dd2a20d54105
change-id: 20250808-falcondma_256b-5fb8a28ed274

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>


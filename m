Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 514EDBC01B6
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 05:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F7610E4DF;
	Tue,  7 Oct 2025 03:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YKWUA9A2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012038.outbound.protection.outlook.com [52.101.48.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D66810E4DF;
 Tue,  7 Oct 2025 03:41:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pF1x9j0Zpk+n9MebBcloPpU+gijhk7G4xBap4LcsWzwf971AVWfCJ4PjqgZEkOr3O+6rzSGQ3GoeGUJuR5Ze7OV8jii7FnYgSuRiV4hDDAIj9HVC3uf2kZpU7KEw8dfUUBAgO+k1SbTdLTyvBl6y+jKA1yibrY4Or1MCrQUxSs4WSWMH+IOTyqRIfkf7zFHli2b8aI/KeHtTd/yCUS3RQkqf0oUKmXghO0FCfMvgokScg3BmW2dNESc/K9oR3wFeFEytTAcYWM37KNgPD1PRtcIJ22tjFWeowxDTP0CFzykHWnOi0cgELvYq+wxEL1GAL7p9hHtiylZmp1RIWKBQIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nT/krns1yiRmRDZBfkUwnScWjzDoTlz8tUYEau38Zuo=;
 b=vzuZ7J2sL2SNLhOIJK9Ks+hzyWOjeXaXnoKf0X8TeNKI5MH40bgpay+piQSttiMTIsdDxlLAMp5ugPhdUKq6cAnwG1ecSHnJ4GBmqgJS5yXvckoyjnWgMKd3wLqjPRrGCACigt6Lt88nYC0CrYR5SCNNzn4vJ1YzrSTEIGIsHBbE198Ii7j3g2ysjlnQidRJ1yEVpnTV+5ZnKATjNl+nqoB7v/WeCLsBasypIaoDHmjkiO0B4E522/DDKvXhXRhIPnShqydzo4HXuBRyIUC3OLsItEU9/iYAPIgvRzUsMUl2SRlEPgIGz+G23x3O0VyjD0Jy2+FplL50GGgZn5c9NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nT/krns1yiRmRDZBfkUwnScWjzDoTlz8tUYEau38Zuo=;
 b=YKWUA9A2pWln2/lgwJl7NcnBiXHpJkJ5TDkfZGT4RlETvV+R45ZWReDPkFHuOaLDCxLooqiMBiEISzX4CpEJT69fzecYqYClMaTtRLtdNLT5V1hsCJyJEJrDAAPaPmjhUpp9OXb+1jPyOZMACs0hbc43jK59do5p6hLYNYY9Rkrl/QBdwS2dwUZ3xIWzG7fyk5jToV+cEm1O4Lp7Q5uUKNtDrpb3yGdd8aVdO6bD4QtV2DSSMMTWOof4fVbMcorz9AJSzUJl5AfZi0Em9WO2ol/tVtkFcrTOeQo0VHJRigVxT9zIRWwbu6+O1foL1pRllbTpSTZ0WgkiZGxxFAjRUA==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SA1PR12MB9489.namprd12.prod.outlook.com (2603:10b6:806:45c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 03:41:51 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::d620:1806:4b87:6056%3]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 03:41:51 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@gmail.com" <airlied@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "dakr@kernel.org" <dakr@kernel.org>
Subject: Re: [PATCH] nouveau: add option to avoid 535 firmware in initramfs
Thread-Topic: [PATCH] nouveau: add option to avoid 535 firmware in initramfs
Thread-Index: AQHcNysd9qNU+e6b00yF0jiV6WT0IrS2BtKAgAAAtACAAALFgA==
Date: Tue, 7 Oct 2025 03:41:51 +0000
Message-ID: <a02a0105aed482a977b06e66391b35e5a6f39cd0.camel@nvidia.com>
References: <20251007013207.1469618-1-airlied@gmail.com>
 <d57eb562b87f9c3ead50acc81d76526e947d0ab9.camel@nvidia.com>
 <CAPM=9tx3Q4NdAc5NDGUjdjOH-ZPagKNu43+zOUZTVcpEO9zSsQ@mail.gmail.com>
In-Reply-To: <CAPM=9tx3Q4NdAc5NDGUjdjOH-ZPagKNu43+zOUZTVcpEO9zSsQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.56.0-1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SA1PR12MB9489:EE_
x-ms-office365-filtering-correlation-id: ce586e41-c0b7-4954-dd84-08de055373db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?UE5jVU9iWFdVVEZYNlZ2VHU4SzlUR1hHR2hPNVJWNTIveXg2SnlnV21ZdUpU?=
 =?utf-8?B?VDY4MUpqcGpVREV0MENKdWw3UEp0WWl1ZjdKY29IbWpmNGw2a3VWajl3dGI2?=
 =?utf-8?B?MWRYNm1NNnJWL3lzVWZhUDVTS2tlVllIU0RJYnByUXY4ZWZ3MnNrWGZxdWdq?=
 =?utf-8?B?SEZFbHpWQ1Z3Ymkxb3NoZFlCL1dyeFVaWFkxQ0NzRzkxRWY2Vm9MYURua0hV?=
 =?utf-8?B?ME9vWTJyU3VwV1lGL0o4ZUd5YTY1UVJjeS82NUM2Kzh5NVFYT1pMZDRoSWt5?=
 =?utf-8?B?Q0hxVGwvT2NKcnBrVFhFMmwzdU82NEltZXYzSVJ5RitSNEN6RmtYSSszNElK?=
 =?utf-8?B?OW1nRmJMZ1pKclE0Q3MzTnV3MVJ0M29YMkdKZTFpOG1hZWFaQ1AzOVRuQmFZ?=
 =?utf-8?B?RzY0MHNObGF3U2dRbDY1U2JlNVNwQVNZRUkrdG5RelVUUm13bmhhc00yM2pv?=
 =?utf-8?B?Y2pEWEcvTFo5ZW9jS2JYcWFFMWxGZkdEaDM2Wk9jR2ZYbWg1TEZZMTZZM2tZ?=
 =?utf-8?B?M3JQVmhwMU96UWM5cnUxTjVvVW12UlFFaWs3d2t5WEtUNUxrcEFYZ1hvZ1Ix?=
 =?utf-8?B?d0M3RlBHTUhqMDFYTERRSDVBVkJJZVRacUkzS05lRU5GUkdCQytFZjFKRkUw?=
 =?utf-8?B?THJGZExMNENwRkRsZUh1QTY4bmxTVlFURWYvM3ZaS0htRGNPWUdlNWs5NUc2?=
 =?utf-8?B?VDlvLytQTXJKU2d4OVhFKzdOMlRTSzlYSml0NmNNUkgrR1BqNjJyT1JsUTJU?=
 =?utf-8?B?dzlHVmZaSEs4eGNvZXk3WTAvTGVDVmRkTjEzNlYwVG15VTNXYm9lL3dBZm9P?=
 =?utf-8?B?L0R5ZDJXVmx6UzR1VDd1eWhoSnNhdldtODdiSm41TUxOTmtnUERtcVR4bjZ6?=
 =?utf-8?B?NEcxZ3JhNThJV3YyNVhsKzZKZ0VyMGNoT1F3eTRSa1k3SzZudXRrQ1QzUlhn?=
 =?utf-8?B?TFVYeDhONm1ROXh3RTNiTmxVeDYwbnJHY1BXN0FrOEdaZW85UnVoZ3lMNC9B?=
 =?utf-8?B?VlZFUldQZ1FvUDNqMjI3Nkc2RGRyU1RJNVJ4bTRtdjBoMVVJanFpYngxVENi?=
 =?utf-8?B?bUlBNUpEbFk4TzhRWHNHT1d1SFBaVjg1QWdZSXdaZVZ0bmVxRkhWWnJGd3hD?=
 =?utf-8?B?WDJoZlh0aFQ0c3ZiakozK1R0M2VmKzVLYXJyR1dGWWc0MDMvaU83b0N1OFhV?=
 =?utf-8?B?ZDZiYjRGazJydDBhM0RpaFl5Unh1UDlJVUV0N3dXQ05TN3VSaVBGajYvTXB3?=
 =?utf-8?B?NmNJMStyckJUakNybWc0eFBhaTNnenNEWndLYW5wYXpzT2djOFJYemNkeHEr?=
 =?utf-8?B?RVF1ZFUydkN5U21GMGtVaGhMVUY3WTBMT1hHVng1NVFGSjBMRE5mMytlTDlm?=
 =?utf-8?B?RGtBc1VpcW44V1IxOTVqQVd5cnpUWWRqNlk4NmdqV2lVN25yT0RkRXczZUhz?=
 =?utf-8?B?YTFteHl5dG9kbkxScGNsR05VSmMydDhicE9IZ1QraVJiLzZhSERIVHhYSVJM?=
 =?utf-8?B?WlVOdG1zczFtMkZlaFJNT3d2dDBDMnJZaWdYd29lb3ZaOTVTSm94cFU1U1E5?=
 =?utf-8?B?Q1lOcDByd0g3clpOaWF0NHJleVZKUmx6WW9xQW9Ta01lSUhldXUvNzlBN3VV?=
 =?utf-8?B?NjJLWWdYT09hTUhORUhPbVY1THl5WVQrb0l4TkJldVhqZnpvYWczYTBMbnVi?=
 =?utf-8?B?Qmt6SWNtd2dLVTgvNFppUWFjQW5uK25zWUpLNHFTam5vSXZIK2poUkhZWm5y?=
 =?utf-8?B?MmVKaHdldHh1R0xLUmJaY0VQK3BNMFRnWmN4WW91RU83Njk0U2RFWjhVcCtz?=
 =?utf-8?B?MjJEM2N0WTZONHd3Y2hienRRRWY2UWtsWHlCY0JFVnhGVlJDMSt4bVlCL3dm?=
 =?utf-8?B?MzdFOFJMRXJKZkxRMlFCSmoxZHJ2ck9SWjMzalV3a01IaHAveDR0NkUxQU1Q?=
 =?utf-8?B?MlNCN0IwQkZhcWlURlAvaERuK2lXbXg1NnRoZisveDJzeDZyV0dCVjBKNU5i?=
 =?utf-8?B?TVdVKzlMY2lEZkVFQzVjTWZrVHVjTTV5MVRwYlA4Z20rb0hYclFDcWRtVkwy?=
 =?utf-8?Q?LqMoKc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enFjSkk0dDl4cXRZR2pmbTF1Q3FCZmJoRDM2YUxTM1BrdGZzSUhsbFN1aVhX?=
 =?utf-8?B?aitGbndscDMrSkowUU0wTDVPVEpHM2N0VEczdGRwc0lEVnk3blZrR3MvNzN6?=
 =?utf-8?B?alVCSHo0VjkySXZiTUxXYjJVTmU3RUgyUk9ZUlBGQ2dNKzZYMlBKLytyQzBk?=
 =?utf-8?B?SXN5M3pIcUQ2b3dkK2M1UWxkNlZWY3Q5NEdES0xiT1drenBwdDhQWk9HN2hD?=
 =?utf-8?B?dTA1VDA0Vkw1M0t6RnZGaVlkNGl5N1FhUnVPV3hCTTRjSmx2dHlwaDVSc1FT?=
 =?utf-8?B?NTdVMnVML2xoNE43WmxXNmFnNVIyQkl6UTVSV3Yxc0JRYnl4QS9GRVFaTzBn?=
 =?utf-8?B?SEdmSVdINkVWSFNDL09VL05KQkJET2gzQzVkejJoZDlueUU3RkNKVmZVMFpH?=
 =?utf-8?B?NWhYbnhuMlp1cXhUKzUvSEFrVHhmVFFHL2N3cEtCamhmWEI1cTBwbkcrZ3M3?=
 =?utf-8?B?SHQyWFlQSkxEa3EvUldTcUlTWWQ2eGZLNEpGK2FtUmpJdGFlOHEvcFh5eG5W?=
 =?utf-8?B?Z2p1OElPVGhNbzI0a0FVRUl2WkdzSVhvWkw2ejVKSjd1UkFqTStYTElxaVI2?=
 =?utf-8?B?MTVVTGFIOFh6bnhQSGdLbFhhZkwyNGo3LzdnSDRieE1qV1o4bFZ0VTMwZXp1?=
 =?utf-8?B?S2VZNWd4MlRQeGpERzQ5cjF2RGlPdlU0MDN0d2JaYnREd2JlUGE0VFVFbTZ2?=
 =?utf-8?B?WlVIWFd0TU9TNEIyeVo5TlZyb3ZkY0dYRzBud2dBaEsyM1BjWFVldjVwUmZY?=
 =?utf-8?B?MEZMbktjbkF1d05FWkRmc2VJVnBQeVJoT1NRenVFRzJuSzkrbTRmSUl5ZlFJ?=
 =?utf-8?B?MW81cEN2aG5LYXpKSGJXM1FLeTlIbGhGeDhJOC8veUNuVys0c0h4YU1oSjhi?=
 =?utf-8?B?TEsxU1p3a1VZdFNEZFVzZnlkS2ZOMHUvdjcxWElxTzJiTlFVa3BERGtmMndl?=
 =?utf-8?B?UWxlOWR6djZaVEpIUjM4dmprYlVtMjg2S2ZjMzl3b3lZdU9wMFZreUlienR2?=
 =?utf-8?B?OVJjcWxXZDFXVWdrREJKdFIvS1dVK2E5eW5uaDRXMTB6aEtrd1VUbUZhNDhL?=
 =?utf-8?B?VWpCUXMzdjNvWitzR1MyUzFJQ3hUMThEMXJOYVJTVkJxUTNVNGRTUGVXbU83?=
 =?utf-8?B?NlpBanR0YzF4bmJsRWRGZzdNVzZuMXlsWHFQbmhqaGJxazJVTTdsQTZ0Wm52?=
 =?utf-8?B?K1ozOGNxcXRWTW1yT1N4aVNlVWRncXEwSlpqR014RlMzNE56THJYZ2xPRzMx?=
 =?utf-8?B?dHJwWWcrdnhULy80SzI0azRpdS95ckNFcEZEYjgzS0J3ajA0cHNjL2MxekRJ?=
 =?utf-8?B?MTZMUVJyWkg3R3pveHNlYlkwSHNXY0M5U0I5QUduNW1qY29LbHozWDFSRlpo?=
 =?utf-8?B?ZXlsQUI5SnVHL1d0MmgzTXUva05pNlhjOG9hWG1SZTIyYmEwTGdjbDR5aTZT?=
 =?utf-8?B?RkR2SXRMTzJ2UlpCRElXbTQ4cHBTUlppN2RiUXlTRlV1UHJSV3VKbSsvb3hR?=
 =?utf-8?B?SXhDeTd0SnNqSExZckNGeWhmamtuNjBmTCtYNE50eUtNbzVKZk5FUHNkS0JW?=
 =?utf-8?B?WWJ3NkFUUk13YUZLZThKRDhpd3FNZzlUTU52Snp5aUo5ZHNNQ0dXRnBxZE9R?=
 =?utf-8?B?VjA1enRHSWFyNVRWbkVFZTRBMjlMZTN6MldSY2o0NHBDR1ZhRGg4YlpjcmJP?=
 =?utf-8?B?VnFjQXhSczkyVmhrRHQwNVRLSis3VzlPWjlYY1lKOWdqOTA3aDV1dzFTNEtN?=
 =?utf-8?B?QmozdHJNb2pHRzBxa2RTdmtyUjd0akZCUCtuK05PdjA3dXIyam9STFNlYnJa?=
 =?utf-8?B?cUJwN1VoTTZRWW5ha1Rva3BzQzlHWlFIUGs5Wm9UNWV3cnF3RTRHUjNrL0RP?=
 =?utf-8?B?THNUdlpEOXJub3FnWGlML2l0U0VoZGlEcWNFMVMvR1UwL1grOThjeXVITy8w?=
 =?utf-8?B?aTdsMVZSUXZJYjZzMitNSXFtZ2p1Y3FYSklJY3FGQVZrZkIxdFduNWVDTUdT?=
 =?utf-8?B?a0Fjb3BaU3BoTmxaOXpuWVVYNGdhSmZNUUFqL0Fucys4U3crZm5CL1IySFZ5?=
 =?utf-8?B?MFE3VFc4NkQ0N1RnNFVad1IzQmdYWG9Md0hDbTM4RUxvVnlReWh2TEpnRXUz?=
 =?utf-8?Q?e1sHCXXKHEFQWOYqohAi2ly/J?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6360B304CABF594E8A69893BC9C28335@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce586e41-c0b7-4954-dd84-08de055373db
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2025 03:41:51.6932 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Bldp+Hf4Jqpydo/qhNteK1ryjpxxM5H7UiPbvEkFbKPaQRk6grxk3IZbcpe6ChT05D0R8DOVCPv4CT7e9dOhCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9489
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

T24gVHVlLCAyMDI1LTEwLTA3IGF0IDEzOjMxICsxMDAwLCBEYXZlIEFpcmxpZSB3cm90ZToNCj4g
V2UgY2FuJ3QgZG8gdGhhdCwgYmVjYXVzZSBpZiB3ZSBtb3ZlZCB0byA1ODAsIGFuZCBkaXN0cm9z
IGhhdmUgdGhpcw0KPiBvcHRpb24gb24gZm9yIDU3MCwgdGhleSB3b3VsZCBmYWlsIHVubGVzcyB0
aGV5IGhhZCB0aGUgNTgwIGZpcm13YXJlLA0KPiBzbyBpdCBuZWVkcyB0byBiZSB2ZXJzaW9uZWQu
DQoNCkhtbW0gdGhlbiBob3cgYWJvdXQgbWFraW5nIGl0IGEgY2hvaWNlIG9mIHdoaWNoIHZlcnNp
b24gdG8gc3VwcG9ydDoNCg0KY2hvaWNlDQogIHByb21wdCAiRmlybXdhcmUgdmVyc2lvbiBzdXBw
b3J0ZWQiDQogIGRlZmF1bHQgRFJNX05PVVZFQVVfQU5ZDQoNCmNvbmZpZyBEUk1fTk9VVkVBVV81
MzVfT05MWQ0KLi4uDQoNCmNvbmZpZyBEUk1fTk9VVkVBVV81MzVfT05MWQ0KLi4uDQoNCmVuZGNo
b2ljZQ0KDQpPciBzb21ldGhpbmcgbGlrZSB0aGF0LiAgSSBjYW4ndCBmaWd1cmUgb3V0IGhvdyBj
aG9pY2VzIHdvcmssIGJ1dCB0aGUgaWRlYSBpcyB0aGF0IHRoZSBkZWZjb25maWcNCmRlZmF1bHRz
IHRvIGFsbG93aW5nIGFsbCB2ZXJzaW9ucywgYnV0IHlvdSBjYW4gcGljayBhIHNwZWNpZmljIG9u
ZS4NCiAgCQ0K

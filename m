Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4D896EE59
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 10:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A7B10E9C0;
	Fri,  6 Sep 2024 08:39:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Zdbzzamy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2057.outbound.protection.outlook.com [40.107.255.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E3310E9C0
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 08:39:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IYbeeLyDTdqVD62GCIVaGBdeK6zrodWyvILJzRCD1SmapE/fQjSAT45iX4KRvrsiO180xbckCsU+6KwGVBOKqlAv0IRj20YNRkb3iVDP7HIkEDzEh/nDVtw0+Eqw1BRUS6XHB2CJOGQx0E9T3ULoa77YUwFrGyEyZ0x+uBrUcLGI005ICZvewEQfYE93Hns+i5sysCVCYF3SAPqN0P/lg+dzofHfGeFQ+1zKIoBBnQsKc2sygmnrWcbJ5M9iX/zrLIObwUqIOcbBCTv9E2pNXv6dtw+I2S5hoTe75JEIAC6ehCZ43zGmL/9Q2zCzfAHkTOiHWZzII2xh1JRWVYViTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nwi+ejIimbXUKEygfOTOBC49pdJ9FH/BOmF+zKgjrJY=;
 b=JRggBLP1r+SkWok8t28jmfKiA9Qs504I2VvuX/jyNcXYsjJjppDlWmcY9rGa7n5jBuSpbSuh5y1tQO3fY8BLu304n3WQffhmDnvSITGeGaXAbnnjAeRKN0eE0Qd3nDmOsNh5nhE6Ii10pqk8OZvRNcQpR4TSPZY4tfFPRDkJAKCW4nE/72bFQ/3rxzSZc9k7u8UxFw1K7rwABy25ZHTZeolLpO7dHdsNFqErqQo6J1BvAY+VW1SH6AUb5osoQ7Rh4vP+zde4+mmNkdm7yrJNOrbllmsCuR18NxcohmW39p85DcR45n/eV2L11ypU71lbqzBflGzaDmG6z6vv5Rh/zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nwi+ejIimbXUKEygfOTOBC49pdJ9FH/BOmF+zKgjrJY=;
 b=ZdbzzamyThGKwewX7Ms5iBmPk8s1am1wulx/roqIx2x/ygk4l5kDOIFf73jrTrgSELydOhGVRvYqoKIQMLzUCq4/FKPguk1BblTgptSEsWF9310Lkhci9SBPRHmvCoc5KVtQzGFRsxGhixEK5EtoNphneamKhpM5MwXQxo1aPcaDzDwxhWv/gwRNWZ/0Dx0KcQc7QClyvovNFzS5T5jGHSf8RVMCAWKKd5MSppUije7JOtq+ujqBIlXaRY1mZz26eJiSK4TevC/+0jmtFZo2L6ENTn5piucjuszOjjhQp9Tqkl+Twzp+s8GlGDDUGMhTcdYAe6qN4Z/rIikNoLNXYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by KL1PR06MB6017.apcprd06.prod.outlook.com (2603:1096:820:d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 08:39:44 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7939.017; Fri, 6 Sep 2024
 08:39:43 +0000
Message-ID: <d1e5d883-1ade-4d68-a240-9ac0301d2baf@vivo.com>
Date: Fri, 6 Sep 2024 16:39:39 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/7] udmabuf: remove udmabuf_folio
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240903083818.3071759-1-link@vivo.com>
 <20240903083818.3071759-7-link@vivo.com>
 <IA0PR11MB718551FE1B9B9D4CC7956144F89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB718551FE1B9B9D4CC7956144F89E2@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|KL1PR06MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: b429b7f2-5c24-44fc-6422-08dcce4f749f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|1800799024|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGRTajVWYm1uUXorelZONm91NVgxMmllbDd4TlBvbnNKMEhRQmlrQVRPTjBs?=
 =?utf-8?B?enZQVnROWDZ3Um0wWWZXR093NmhJZmo5TTRBMXdsWXYzVUc1STdnMGVWUUhJ?=
 =?utf-8?B?cnlaRDhZckEzeWtYcURFa2h3QWlEV0JDc3dSTi9pdVFqY0doTGZWbndCTmlU?=
 =?utf-8?B?RDVmY2lmRVJnU0puRlBmZk1zREt1SlNSU1hqdGMrdWtlRVBhZ1VHcG9USGFY?=
 =?utf-8?B?ZTNsVHliUDNyOGJrV3hxVWovOUNuNm9mb0xYQ0Fna2ZUa0J1YjZlV3pQY2Rs?=
 =?utf-8?B?Z0xTam83ZHZUTFUrMmFZSW15R0xtdnc4dmp2Q3Z6QVFxWlF1UjVJZEU1bWZw?=
 =?utf-8?B?Q2lVM1lzK3FndkZjZnBWYWlMUVFHOEtOTkRHM2pvUmVScE1NZ1B0RE80UmFa?=
 =?utf-8?B?WU41bWJnb2MzMG5MWnFpaEFIdUtKN3o5b1FWTkZKWGgrNWNEYTM0eTB4d01K?=
 =?utf-8?B?aGhkcU9tSzRsTmpqTnl1L25COXhlczNya1VDZEpVWThGbHRQMy9kc1NkQlRT?=
 =?utf-8?B?OTVGZkZCMkFvVU5RQlRIWUduM0hpcDkvNW9ySmZ0RmpwdnVKeW11aC9QbmdF?=
 =?utf-8?B?eERPbFNxUnE4dzNHMUF5bU5hWTdFM2MzblBHNVhjQUxOZGpCcU96c2JyVkVq?=
 =?utf-8?B?MUVnOWJYeEdreU5ha3YvaGdlbVBIVFpQaTJwU1prV01pYlcySFFTOUh1SzdT?=
 =?utf-8?B?OFpRRjk4TXpmRjVJN01zYitZTlZnc2lyak9WeXEvY0d1N3NiZVB2czZ3aTJM?=
 =?utf-8?B?V2daZHpNdlREU1pESWF5bDhmWFV1UXQwQUJyMzc0MnAxUDFRNUxybjRXaGpx?=
 =?utf-8?B?MWFIWXJHL3Z2WjNmZEEvK0J1d0ltbzg1ZllUSGpQWGR1UXlkbStSSDZhWUwr?=
 =?utf-8?B?VUNpZ3pSQ2pQS0NlYXRVTGh0OWs0TnNNeFg0UWNFMlBZSCtrNFErYTk2VllY?=
 =?utf-8?B?anljWjRlNUd6ZFRrNHgvSE4yeldyU1R3WmJpZXNtL2d6bGFrRXFpdjA5Tm1u?=
 =?utf-8?B?UUpxYUppM09pdkFmei9qamxwN2NrOUZ6UXVZanJURjV6SzJnV01hWlAxblVN?=
 =?utf-8?B?MUtRSjVDRzMzZFhsNjVxZk1BTE1YQU4xbkU0OWhJV1ErNTJkK2ZRNGI2WGFF?=
 =?utf-8?B?Y1ZlRlRFYWVtMjlnTFNaWEg3V0V5K3pGLzFoWTRROWt6Tm0zZGNoa1NKZExX?=
 =?utf-8?B?WDhkMGgrbTBUenZGUDdta0IyUVBraUt4amhCOGlxZm1KQk9JMkhFMENrODZy?=
 =?utf-8?B?SzdFQnlJUmxGa2poWHJ4Z2hBU3lNQm93dFEzNVR6K0svTGFRclBza2hSM1la?=
 =?utf-8?B?dFM5N0Q4cHpzckQzQW1QU2I2blMyS2ZFNmx2bktEQVk1ZlNncWFoY1dHeTFF?=
 =?utf-8?B?NkVmSTJpT2pIUzltbm9CZnY3azU1bkdRRzRaSWRwQjUyYkZqeWZMNFl5UmhM?=
 =?utf-8?B?TXErd3NNeHJuZ0Z0dEpUd2pWclNOUzRRcTJtWm9WMzZSMGhTdnVweGJFM0h3?=
 =?utf-8?B?U2R5YmZvWWJTNE51Nm5XcWtGaXVHek51VDlYdHNycWM1cUtQQ3JmSGVld1N5?=
 =?utf-8?B?NkYraXl2S3BqU0xKZXRhZGNZTWI5OXY2ZGZITFUwZ0RuV2VCK1Y3bVVqa0ZM?=
 =?utf-8?B?ZHdtaTR3QWRXNGRTeWp2Vm41ekR2SFdEcjh6SnRrV0lwcU9DSXdyaC95UytT?=
 =?utf-8?B?Qmp3NzJzQTFYek1Ca3dONjdMT1VWQmlQVXY0TnlnVWg0WjdGWFo1VmxlMTBS?=
 =?utf-8?B?T0RZSS8zN0kxUU00Y2lxWnY0L1J2WEZUR0lGS2ttMXBibnhiWlQ5dWdZa3FE?=
 =?utf-8?B?MlA1bDRRaDRhbDlpWGtJYzJGUFlWRXZmSTJZNlRqQ2krTTlNSFQ4MDhvTllN?=
 =?utf-8?B?NHUwYzRjQUpITHpFYXhxdjBHRDV0Ry9pa25XSjhkcTlLRHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VmNVNjFIN1FHaGZIZ29xVFo1bjkwMEpUaDhpTXlPditIKzJBS1RGdmpMY2JE?=
 =?utf-8?B?SDdNZXA4cXUyaHJuN01Qak9jSE1MQVc3OGdiaGxrU2g5Zno2aTd1NlhGQlRk?=
 =?utf-8?B?RTZGMjBJTm5GSTVaUDQ4SHNvQktEMDZ0bldLbW83SFoyRzBoS2lKc3M4NzZ6?=
 =?utf-8?B?dGZ4eU1LNWVpaURRTmZRTnA5SlBRMkNKYk5kUm1SaUhXUkYvcytaOFpLUlBP?=
 =?utf-8?B?MW1KMmRMbDJQRXFqUDhiUXlVaVV1VHNqeXNzQ0Rzdjc3TTJjTit4RWdYemll?=
 =?utf-8?B?VmdabldyV0hxMWY0U2M3Ylp2ZW8wclZWN3ZkVFdSTjhvUml3c0ZPQTlXaktn?=
 =?utf-8?B?aTIyR2dIWVllUlJiN2kxRWdjc0tWbDFodXRSRG1TTzRiNW95dk9UZks1QW1J?=
 =?utf-8?B?cFJTQmU4OWdQc2taaVZWYTlpeDVVM1RqaVF1WFhzcllINFludEdGcW1CWU8z?=
 =?utf-8?B?QmQ3S3JFc0JSRHBDMHY5WUVhKzk5SitUODhuWS9jYTBaUHpBZlhSSS83YW1Z?=
 =?utf-8?B?aDJqWk04aDIrek9XRTlGQ0xBWlZaaG85aFFqZXpyR2pKRUVTbS9LMEQydTl5?=
 =?utf-8?B?ZjdHNGJ5NTNEN2lLU1NyN3Vua3A2Qit1aHRRS1NGOVNYY1pnMG43cFpEc2Nl?=
 =?utf-8?B?aVRuZ0M4VEVkeGpQblhwVTZydHF2dTZNaHdLUE4rUGF2NHlLdmx3TGlOUzY1?=
 =?utf-8?B?U2pqcXpjNHpCa0pYSjdmUjI1cnBIWnlqOHVVa2JqQmxuYW0zczBXQ2tEcWEx?=
 =?utf-8?B?azhiRlB4bGlLRlRzNXo5VElQVXJRUWNOWUJvNk5YNDNRayt6dWxkL1lxbzBa?=
 =?utf-8?B?Q3M1L1ZqUGRxRGZUMDJ4RzFrekJpZkIwOElvbjdWYTR5TVc1b29UU3htWFVv?=
 =?utf-8?B?TWpVUUZEQkxQU2hZck1va2pSeUh2YjFWaWU0Z2NQbzVZWXk2STJVcENsWnNn?=
 =?utf-8?B?TDVyMXpwUHdocis2TWtsRGVrekJvOE83cHhJY2lMK2FsREpNcG56b0dSREpF?=
 =?utf-8?B?bnNkbnhyTnN6NmE2Z2pta2JUU1pVQWVXOHVkc0RDVzAxckdLUXVWckk0V3J6?=
 =?utf-8?B?ZkJtZkVRRHAyV3JpYmhWd2JFTWVwNVdoT2pMMzFleW9KUzFHY2VSSkg5Rzgz?=
 =?utf-8?B?dFg0QWV5dktRV3pqYmlzamIweUtVVk1FdWZqMFhjMUxDbTFENEFPUFRWTGx3?=
 =?utf-8?B?SGIrNnNYVHRxRXVBbzRyNnZMUFUxRENFMFNQT3ROOS9Cbm9PRkZxSlM4NVp1?=
 =?utf-8?B?eGVBbHRTdVBlN0dIdnNyT0xudWEwejdFY24yY1ByaFNKWHRZbE5EMmpEWUUv?=
 =?utf-8?B?dklKTSt0ZkxrR2RNQm80Vk9GTmxadEk3MDhtWVNmN3ZCUkpEUGF0bmN3OU85?=
 =?utf-8?B?ZzdrSTZaN3FtK3Q2VjV3bm1uWVhpYlJwK1ZyWTFmRHd3OVd5QzdaK2tuRmxq?=
 =?utf-8?B?QkpjRjdFM2Q5bXVVRGx4VWkweGNkNWxSUjJSRmU1MjJNVXBXdVUrREdoUnpu?=
 =?utf-8?B?TEJBNW1EZnkzK0hBNFljeE51Yzd3L1J6ZDNiWitkMmM4RE9GaGlVMWkzWVdF?=
 =?utf-8?B?WlpRNnlrOEVFa3IybzNxV1paZlpTVHhKRmF2UkxtVUMySzcrQXBBMVBQQTh0?=
 =?utf-8?B?MUF1c01hcXQzam9xVGFlUGZCTiswMXlEb0VCd3RWSVNIdE9CTHhqOEhldnhv?=
 =?utf-8?B?VS8yVE1BN2dRK1B3TnZ0SnRpaUg4cXkybWlYRXBCUllYVXJaT0Q3WTdtUktj?=
 =?utf-8?B?QWltdTNKcW1uanFmUFdMaVpKcEh1elA5cFdDSDhVaWp6ZHAvT3E4M1lkdG9s?=
 =?utf-8?B?TnU2bitZYUh4MjdtQlJ4OVp3SWhJS0lJMzkwREsyVEZBSG53eVhUb0pzSlI5?=
 =?utf-8?B?OG5kUGlsblZycmN4RHpjUExEWjZMdzFncjRsNW9ObCt2d21zaVJNL3NvR1JH?=
 =?utf-8?B?Q0JkN1ZPNGFKejN4bEswOUxETnRicHhKZG05dGMxb2dZa1A2dEFQTmFMVDJz?=
 =?utf-8?B?SDlhM003LzlHMzBBYWhudVhWUTRlc0wxc1FYajQrbm5RVGpOaFo0QVlMVDZS?=
 =?utf-8?B?STdZZWt1YXZtUFJPV3lpcTJKWExUbTFOTVdLMGlYMHMxZUJHSXQzdTFCNm5a?=
 =?utf-8?Q?SO3uM7iFHJyrdLKh7fioanSZi?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b429b7f2-5c24-44fc-6422-08dcce4f749f
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 08:39:43.5783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pR7wbjwZpIU92U6eeXxsPn0kbNT+e390VuF56uXR1WAkEohpjfwRSnK94FAqA7lms/IjQVOsoOaolyn/7fBMmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6017
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


在 2024/9/6 16:22, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: [PATCH v5 6/7] udmabuf: remove udmabuf_folio
>>
>> Currently, udmabuf handles folio by creating an unpin list to record
>> each folio obtained from the list and unpinning them when released. To
>> maintain this approach, many data structures have been established.
>>
>> However, maintaining this type of data structure requires a significant
>> amount of memory and traversing the list is a substantial overhead,
>> which is not friendly to the CPU cache.
>>
>> Considering that during creation, we arranged the folio array in the
>> order of pin and set the offset according to pgcnt.
>>
>> We actually don't need to use unpin_list to unpin during release.
>> Instead, we can iterate through the folios array during release and
>> unpin any folio that is different from the ones previously accessed.
>>
>> By this, not only saves the overhead of the udmabuf_folio data structure
>> but also makes array access more cache-friendly.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 65 +++++++++++++++++----------------------
>>   1 file changed, 29 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 254d9ec3d9f3..d449c1fd67a5 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -27,15 +27,21 @@ MODULE_PARM_DESC(size_limit_mb, "Max size of a
>> dmabuf, in megabytes. Default is
>>   struct udmabuf {
>>   	pgoff_t pagecount;
>>   	struct folio **folios;
>> +
>> +	/**
>> +	 * Unlike folios, pinned_folios is only used for unpin.
>> +	 * So, nr_pinned is not the same to pagecount, the pinned_folios
>> +	 * only set each folio which already pinned when udmabuf_create.
>> +	 * Note that, since a folio may be pinned multiple times, each folio
>> +	 * can be added to pinned_folios multiple times, depending on how
>> many
>> +	 * times the folio has been pinned when create.
>> +	 */
>> +	pgoff_t nr_pinned;
>> +	struct folio **pinned_folios;
>> +
>>   	struct sg_table *sg;
>>   	struct miscdevice *device;
>>   	pgoff_t *offsets;
>> -	struct list_head unpin_list;
>> -};
>> -
>> -struct udmabuf_folio {
>> -	struct folio *folio;
>> -	struct list_head list;
>>   };
>>
>>   static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
>> @@ -198,38 +204,18 @@ static void unmap_udmabuf(struct
>> dma_buf_attachment *at,
>>   	return put_sg_table(at->dev, sg, direction);
>>   }
>>
>> -static void unpin_all_folios(struct list_head *unpin_list)
>> +static void unpin_all_folios(struct udmabuf *ubuf)
>>   {
>> -	struct udmabuf_folio *ubuf_folio;
>> +	pgoff_t i;
>>
>> -	while (!list_empty(unpin_list)) {
>> -		ubuf_folio = list_first_entry(unpin_list,
>> -					      struct udmabuf_folio, list);
>> -		unpin_folio(ubuf_folio->folio);
>> +	for (i = 0; i < ubuf->nr_pinned; ++i)
>> +		unpin_folio(ubuf->pinned_folios[i]);
>>
>> -		list_del(&ubuf_folio->list);
>> -		kfree(ubuf_folio);
>> -	}
>> -}
>> -
>> -static int add_to_unpin_list(struct list_head *unpin_list,
>> -			     struct folio *folio)
>> -{
>> -	struct udmabuf_folio *ubuf_folio;
>> -
>> -	ubuf_folio = kzalloc(sizeof(*ubuf_folio), GFP_KERNEL);
>> -	if (!ubuf_folio)
>> -		return -ENOMEM;
>> -
>> -	ubuf_folio->folio = folio;
>> -	list_add_tail(&ubuf_folio->list, unpin_list);
>> -	return 0;
>> +	kvfree(ubuf->pinned_folios);
>>   }
>>
>>   static __always_inline int init_udmabuf(struct udmabuf *ubuf, pgoff_t
>> pgcnt)
>>   {
>> -	INIT_LIST_HEAD(&ubuf->unpin_list);
>> -
>>   	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
>> GFP_KERNEL);
>>   	if (!ubuf->folios)
>>   		return -ENOMEM;
>> @@ -238,12 +224,18 @@ static __always_inline int init_udmabuf(struct
>> udmabuf *ubuf, pgoff_t pgcnt)
>>   	if (!ubuf->offsets)
>>   		return -ENOMEM;
>>
>> +	ubuf->pinned_folios = kvmalloc_array(pgcnt,
>> +					     sizeof(*ubuf->pinned_folios),
>> +					     GFP_KERNEL);
>> +	if (!ubuf->pinned_folios)
>> +		return -ENOMEM;
>> +
>>   	return 0;
>>   }
>>
>>   static __always_inline void deinit_udmabuf(struct udmabuf *ubuf)
>>   {
>> -	unpin_all_folios(&ubuf->unpin_list);
>> +	unpin_all_folios(ubuf);
>>   	kvfree(ubuf->offsets);
>>   	kvfree(ubuf->folios);
>>   }
>> @@ -353,7 +345,9 @@ static int export_udmabuf(struct udmabuf *ubuf,
>>   static int udmabuf_pin_folios(struct udmabuf *ubuf, struct file *memfd,
>>   			      loff_t start, loff_t size)
>>   {
>> -	pgoff_t pgoff, pgcnt, upgcnt = ubuf->pagecount;
>> +	pgoff_t pgoff, pgcnt;
>> +	pgoff_t upgcnt = ubuf->pagecount;
>> +	pgoff_t nr_pinned = ubuf->nr_pinned;
> Reverse xmas style is preferred; please try to use that.

OK, I'll take care of it, and other patch. :)

>
>>   	u32 cur_folio, cur_pgcnt;
>>   	struct folio **folios = NULL;
>>   	long nr_folios;
>> @@ -377,9 +371,7 @@ static int udmabuf_pin_folios(struct udmabuf *ubuf,
>> struct file *memfd,
>>   		pgoff_t subpgoff = pgoff;
>>   		size_t fsize = folio_size(folios[cur_folio]);
>>
>> -		ret = add_to_unpin_list(&ubuf->unpin_list, folios[cur_folio]);
>> -		if (ret < 0)
>> -			goto err;
>> +		ubuf->pinned_folios[nr_pinned++] = folios[cur_folio];
>>
>>   		for (; subpgoff < fsize; subpgoff += PAGE_SIZE) {
>>   			ubuf->folios[upgcnt] = folios[cur_folio];
>> @@ -399,6 +391,7 @@ static int udmabuf_pin_folios(struct udmabuf *ubuf,
>> struct file *memfd,
>>   end:
>>   err:
>>   	ubuf->pagecount = upgcnt;
>> +	ubuf->nr_pinned = nr_pinned;
> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>
>>   	kvfree(folios);
>>   	return ret;
>>   }
>> --
>> 2.45.2

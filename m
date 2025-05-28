Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E8EAC6A16
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 15:13:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434CC10E5F8;
	Wed, 28 May 2025 13:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jZp6rQv2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2086.outbound.protection.outlook.com [40.107.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C906910E5FE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CWM8/bZyKVtVPsVSkhLfijZDJ3A9uO+bzovIraJm/FO7QQ6ZgUiIr968xoa1wQKp6lH0pAHnBDhs36rjQybBpUhuVmrvw1rzyZ4atDrnEnY95dCATmuS7uPyUAkZdUTPmvr1tHlbSWsF8E5vDtJkNa75jx0pK2gJcEqWF3C6jagaX3BYshKyrxlAjsF0tdNRfBgBVl4/3vPXUMKA1JO9qdViQJaRtr5qWOVwyllHbDu4lFQJzdZ+9P7jjhUGFnQ0qOvNvzQtcMyLWOfWh6vEacl2i85GcIHlgrPSzVPn1RQwaMIwd6P4IB7YctO9eVn71WzBhFEzYjvYUFlR/20taQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZONbTkryIMAa6DEPjnnO4FylNvTyA04TTrhQ2aPXwU=;
 b=cPKU/h97FMdXosx09YNoOMJax/+9L+Goa0+9TziUS+KqNl35Hf/SV43pbI5+uD/nhiVedng+v6fFwLqjWGXlMIoTB+cwNrTwfx5mO59/voG8lA6avGT/DESuXAyylHeKaxi2zoJDmo1xSyVVKEaS/zvkDKONgtB9b8bM6TXGHqeT87snnvXOb9ZQWuQYJrZ8woxzCmkOq6uIHndpCbbsy2TEMnCT43jlgoTBtlPfnsBamybAHZtIc6T8NJBtWg1gJ8OLK7qUi5EVC8wXQ1UGXE84obwiQZ1mW24JvFx6Gc0PzQ9BSpoWyiMrPFA9iRVJGEWIpGOLR8tS/qJbGKUtVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZONbTkryIMAa6DEPjnnO4FylNvTyA04TTrhQ2aPXwU=;
 b=jZp6rQv2seTujo3eyQ7SYRBJarpw0SspNQMI3gB6vZZGVrmW6A3wn+kNEo/K8vhZ4iu/mV3lUvtWaTrP6f+a89N2lbxXjUgsR1iLlP6dAjeBlzuKTPn3uzbKr4LCypTh6+/To3UOT0bTEEIkO9C2EeglLKz30CLmvJjaTLy8Tg0=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by MN6PR12MB8489.namprd12.prod.outlook.com (2603:10b6:208:474::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 13:12:51 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8722.027; Wed, 28 May 2025
 13:12:51 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>, "dmitry.osipenko@collabora.com"
 <dmitry.osipenko@collabora.com>, "Pelloux-Prayer, Pierre-Eric"
 <Pierre-eric.Pelloux-prayer@amd.com>
Subject: RE: [PATCH 3/3] drm/file: add client id to drm_file_error
Thread-Topic: [PATCH 3/3] drm/file: add client id to drm_file_error
Thread-Index: AQHbz6Q+VxwsvFnl2UKPQuf4dJTGnbPn4/wAgAAhCKA=
Date: Wed, 28 May 2025 13:12:51 +0000
Message-ID: <BL1PR12MB57537E469F301E3F6BF4C49E9367A@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250528074333.1807865-1-sunil.khatri@amd.com>
 <b5291db4-58c6-4d19-aa22-2f49a4321a36@amd.com>
In-Reply-To: <b5291db4-58c6-4d19-aa22-2f49a4321a36@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=dc9817e9-0dc1-42b3-972c-f8e65f29cc14;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-28T13:12:23Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|MN6PR12MB8489:EE_
x-ms-office365-filtering-correlation-id: 7a408777-6b79-496b-cfa8-08dd9de959b2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?cjExYy9PU3BLblcvUEZtNG10eWJwdXBmMzRjZ2lTdVc1V1YwUm5vOVAydUlR?=
 =?utf-8?B?dzh2bEpCWk1DSlV2MklwVVg0aWphZ21Gem9aTzNYcUFoUC9iR3pYazQ4bjhx?=
 =?utf-8?B?VmxBRng2TzVRWXEzVkdJd3MrWVpXMjlBRDZnb25ZODlma294T0I2SHFtUWta?=
 =?utf-8?B?TzRPQy9XR2V4b0ZvSkJDWDhqWEZ2ME1QLzNFWDdnY295Q29GNVlCRU80dklQ?=
 =?utf-8?B?ckhwVzgrRFZzejBEcXNMWC9ndzhHc0FaVlhBcFlaSHk5TVpVVHp4MG91T2hZ?=
 =?utf-8?B?blpoUW5HeVJTTWJxNHdNR2NOS2kycjJEeFJTcGRrbVY4RzRnVXY4d2lrVVpC?=
 =?utf-8?B?QmFNdmVNRTdYcmpqVVhsVnFzT082NnlWdGhVbWlEbE1QWnJUUXFDK2MwOUFX?=
 =?utf-8?B?cmFPaWtSdEJCbGg4ZzZ3VHhNbnlwWlBJdDhqdGt4TVNzQjVQZXA2djZSc1JN?=
 =?utf-8?B?bVh1T2hyRms4cWJ5bHo4TWVhSGlXeCszRzJ1a0NqdktnQUcyS1QrQzRyQ2Zs?=
 =?utf-8?B?TUVoa0xXNUgwY2M4dlYydUhrOGhSWW1HamdEbVRQOWhkRzFkQ3I5MDFjTklK?=
 =?utf-8?B?aytXVy9CT0h2Nyt1TEt2TmZzRjN1Z3BYMmNGcFNoYXFCb3Qwc1R2MlJOWGJ6?=
 =?utf-8?B?dHFsZkowSkpuN3JhVmZXbGtXTjJlQlB3VDhSZmVseWRZeGRralgzUCs2UWoz?=
 =?utf-8?B?UlNpWGE4SUVkUWNPSU93VzI5SldUaitoNDZ2d0VJaGNIZE01c3JEaWl3aHcx?=
 =?utf-8?B?R3VwTFFjYmIzS3NSV05jZncyU2RmOGhpRitHTmJIRnNCeXg2cTNIR2p3KzZz?=
 =?utf-8?B?UFZWaGN6TVdEMDg1QXFDQVk5TVJTbnZYeEZSN0FlNVZ3citSYzdkRTlEYUhO?=
 =?utf-8?B?azZNRnBzZloxVk9IS1lRdDdqNWlDTElLbEVxbFN1clQ1WGxhQ05mN09aUzB1?=
 =?utf-8?B?bnpPVThyWEUzQnY5bEkrQnRGUXJYUlo2NmxHMEQxMUViZXQ1R2tla3RUVmVC?=
 =?utf-8?B?NHNhWUpoR0tERm90WnlPcXRpWUI1K0V4VENwL2tiYWI2bWdSeSsxdDBvU1Y3?=
 =?utf-8?B?Ly8xVy9hWUZyblVYVGZ3OFZhdHFhai9mbHhxMlJnSGUvSmlHTlgxYUVmc0dt?=
 =?utf-8?B?SUZqV1BTQTN1dGFNK2dpSlJTeXIvaW1CWFFFR3crY05pQ0taVlREeTN3ZlAx?=
 =?utf-8?B?OXgvT1JmeXF6cFFlL1VKMU0yRmZRNThaSUFyaFVITTFSQ0tuWjI2bFlQRGVB?=
 =?utf-8?B?Zy8wV3JZWmtMVjA2WVgrbnlGL3ZoOVRnT1pXemwrMnVKUUpFOURFZG5oZHVZ?=
 =?utf-8?B?V3ljU3VNcENuKzc0SXJ2SWF1TXRZN0g1RWlZM2tPRHVNN3N2NXpWQVdjc21C?=
 =?utf-8?B?SXh6OXlhR1RKQ2xjU05ZeFU1cmszMFdFcSt5bmxrWW5kbzJMRnp4R0tzTWRP?=
 =?utf-8?B?c3dQWXBMQ3J6V0dJcHdRVVN2RWZ6Z05zdDVVdEk2UDI1VUZpMFdGMzkweGZO?=
 =?utf-8?B?QVcvZjVneG1lYTJVVGxzczNQTVJkaGpZMUZjWm9NbXlWV1cvcUFrWFoxa0t3?=
 =?utf-8?B?SnRueWVHRHk3VGdXRGEyejJzRDdIYXVpbThwb2RiUG9CMVhrcndlSitVcFVD?=
 =?utf-8?B?ZHY1a3ZLak1FT3ZsZGdVenhqSXFlK1hwbDV2b3NrOUxzV0ZJQko3eW9sM01a?=
 =?utf-8?B?a3J3NTkvay83RjVlN1JYaUpDaFBhb2hzc2lISnAzdGNXNWVZYUhSdkg0OVZG?=
 =?utf-8?B?ZDJseEluTXpKSmRVNUJSSkF5WUk5c212SUpkOXBQQ1Q5UW40SzFrRUNKbTg1?=
 =?utf-8?B?MHBFeExzVWJqNnZ2Y1Z4ZGUrK3NteE9OY1U5RnFrd2JjeHdXK1JZL1hKR3Bi?=
 =?utf-8?B?ZnkrM2VpbnRkbUkzbFdJTUxJTmx4ZnNzcStLTkdmQ2Fwd2ZVekZscVNLZ1Jl?=
 =?utf-8?B?aEpGM2FwVUtSWWdHOWdTM2tXTXhEeXpacFJyRW5ESEF6Z1dybjVWbXYyS0RJ?=
 =?utf-8?Q?FpbsmHWydkgpR9Gn0O7lIEKBaVg6n4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkVhVXd0NVcyUC9MZmxNeFRWZlRxTE1TWnlyMFpXS0xQdjVLWW5uQzlWSHNL?=
 =?utf-8?B?dUlNRmdnNHhtYWVDUDRLWVlGU2FsRjQ1RFFDSW5JRzZBSHVUelhacXFDT0ZX?=
 =?utf-8?B?Szl1dUM1bXQ1aXZrNU5XSHVvY1BvM04wUzJiNGRYbmhwNm9MK3pPUExwajdw?=
 =?utf-8?B?L0pjVGtPRWFTaTRJaC9YQytlU0JqVEZBSXNQanVNekpGOWxNelRiNSs1L1JS?=
 =?utf-8?B?T3RtVk9CVmk3VTZ3SFZxRkJRYWZ0UnFYTlBMZXVtVWNySnV1VHd0NTRCcW9T?=
 =?utf-8?B?aUhjOGNvZlhWQTZXczVOcCtDZVMxS1NIK0N2NFprbElDMVlITjBzV3piWmts?=
 =?utf-8?B?TUM3S3BreXpIVTZBamNidlRKeDBGTUpSbzdrL3dPQ2pBd2FoaEptL0ZYS3k3?=
 =?utf-8?B?V2V5YSt6VTNnWUFIajdqaCtvWjdvQ1ZqaDlzd1VITTdoUld5MjVYTWtnS3dk?=
 =?utf-8?B?dlV5MGlUWVQ4VW8ybnpRRUlaSmhGanI2R0FVWjM5bUNNOEFkNXFQbW5vb1I0?=
 =?utf-8?B?dVpSdkhIbHVzejJKTmt1L3BWNFNMSzVCL1ZaR3U0NmJxY3F1ZnBpWVR5d0RM?=
 =?utf-8?B?WVJzL2ZNN3pjclc0Y1dxUkY2Zk45cE5ZV0w4MEJ4MXVxazlUZjdITDBBWkEw?=
 =?utf-8?B?SVVmclR6T3ZneVVQMllVdXZkYVFKRXJEK1ZWYXVPZXYvN3pmZll0NFNtU29U?=
 =?utf-8?B?U2F5VjlwR1I2UmxvU2E3Mng3QW54TFc4S0FSMjNRSHAzYnJ1R2lTWklkYnZ1?=
 =?utf-8?B?ZDFZaGZOQmsySllDR0xEOUxVVjdCNzFVL1NYUklDQ2FVUEpWRkZFZWh2aTQz?=
 =?utf-8?B?YkpnYVBNaklXMmZJdTc4ZWlHb3dnaGo3anF4MDhNbWcwVGlkc3NhaUhnc2hM?=
 =?utf-8?B?OGJGUnJZbEF1Y09KN3R0ZWpScWZJakVuWHpEdjc0N1BHZEo5eStoc0I4R0Q1?=
 =?utf-8?B?RE1vR2d6NjVyOGF5N1E3UFVNWGw0ZUhSRFlFbEwrUzR0ZEQ1SmtzYTZZT3o3?=
 =?utf-8?B?TTlPWXNZZ0lWZXBKNk8zVVZJZklNWGxsZEVKMzBKaWhPV3NHbFFSZitZY3lM?=
 =?utf-8?B?MmRxUHh1MkV4R3lJeUNUQi9sS201ZWtDdHhJeENUZk92czFqcjF3M3ZYNjN6?=
 =?utf-8?B?WFgwOUtnTUFzTmVudlRJNFBhM0JHM0N4c1g5TC9NbzBXVGt6U1Q0WlhZdFdP?=
 =?utf-8?B?Mi9uMmMrdjlJRFo2NjFidlh2OHhSVkI0OUgxUFBYUUgzMzh0QXVUZ0Z5MEVB?=
 =?utf-8?B?ZFMrdmNXZzhiNm9ZelNEWStCOFlWQzhBWE9jNWFRaGJ4cDZmSjlaUmRZaDIw?=
 =?utf-8?B?RjAyRnNPTGFXWFpzQ3pRaWpLcUZiWC9EU1ErbXc2NWJuN0tuNnpwZFo3Q0g0?=
 =?utf-8?B?b3NtejRQNmlXNnJMSFd1VFlWSEVZcjRGMkZNVDM2T3gzZXJtTDNTRnBaK3BJ?=
 =?utf-8?B?UnFyVXJvZDVCRGk5ZlpURW9uVGI5bUlVT2RVTUZjQWg1WmJ4dXAycC9jdHMv?=
 =?utf-8?B?TXA4b0dORGVlVjZTQmVRY2lEZldwdi81TkZqOFlWTUZ4UG41Nkp6V08wWU9Y?=
 =?utf-8?B?cFdrZHl0aFhEbEpsYlBZYzYwK1dXZDh3WGVWbXpaM2lod3BRWitsZnozbWVp?=
 =?utf-8?B?S296WmNwYzBaNkJlcGhpUWhIbnVaUU9ZWVRQWE5XYmhnTWlRR0lJTXlVN2Zh?=
 =?utf-8?B?Zmg3QitGSURHRHJOUGl4ZDNtdFZtcmMxV1k5N1U5VENFa25GZFFNcWdDSDhi?=
 =?utf-8?B?TExPWGk0cVFXWllBQUxBNXdIWlVGWXpXWlI5U094ZkYveXdUVXNldTFKUWNK?=
 =?utf-8?B?Qktld0pscllNVWgxa2FjK3BHR29PaU13YmVRSUpPelVXQ2VoQ2FaNjh0QXNv?=
 =?utf-8?B?ZFVIQXJxeHdBcFBIM2gzUFRVcy9ESU92ZW9CV0ZpNWNHM0pNQ21CbU50QUFV?=
 =?utf-8?B?QTZid1lnYlRob3o2ZWErVXQ5LzJTSUs2U0NQMmpLYndET2xHZEJGbyt1eDFF?=
 =?utf-8?B?ai9kNDdyREVoajFSV29EQmd2NlJiWXVjSDVMZVhNY1FjYlUvdWpRUE9EWm9N?=
 =?utf-8?B?Vk12ZjhSZVRobzFxc3ZoQ1ZpK05nMlc3ZjFkODFQWENEeUdnWkFLYlFlbDZM?=
 =?utf-8?Q?YXgI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a408777-6b79-496b-cfa8-08dd9de959b2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 13:12:51.3728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5WIUtgo1mZkMWGVpKGLyBfiNljjVfj26g4u1qO3thRaWQUibiK2ubngPssJC3pd7LNIVHNCKJQeNRNpVDWu5Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8489
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

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtvZW5pZywgQ2hyaXN0aWFuIDxD
aHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQpTZW50OiBXZWRuZXNkYXksIE1heSAyOCwgMjAyNSA0
OjQ0IFBNDQpUbzogS2hhdHJpLCBTdW5pbCA8U3VuaWwuS2hhdHJpQGFtZC5jb20+OyBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5A
aWdhbGlhLmNvbT47IGRtaXRyeS5vc2lwZW5rb0Bjb2xsYWJvcmEuY29tOyBQZWxsb3V4LVByYXll
ciwgUGllcnJlLUVyaWMgPFBpZXJyZS1lcmljLlBlbGxvdXgtcHJheWVyQGFtZC5jb20+DQpTdWJq
ZWN0OiBSZTogW1BBVENIIDMvM10gZHJtL2ZpbGU6IGFkZCBjbGllbnQgaWQgdG8gZHJtX2ZpbGVf
ZXJyb3INCg0KT24gNS8yOC8yNSAwOTo0MywgU3VuaWwgS2hhdHJpIHdyb3RlOg0KPiBBZGQgY2xp
ZW50IGlkIHRvIHRoZSBkcm1fZmlsZV9lcnJvciBhcGksIGNsaWVudCBpZCBpcyBhIHVuaXF1ZSBp
ZCBmb3INCj4gZWFjaCBkcm0gZmQgYW5kIGlzIHF1aXRlIHVzZWZ1bCBmb3IgZGVidWdnaW5nLg0K
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBTdW5pbCBLaGF0cmkgPHN1bmlsLmtoYXRyaUBhbWQuY29tPg0K
PiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmlsZS5jIHwgNiArKysrLS0NCj4gIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+DQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmls
ZS5jDQo+IGluZGV4IGRkMzUxZjYwMWFjZC4uMmY2YzBlYmUwODUwIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zp
bGUuYw0KPiBAQCAtMTAxMSw4ICsxMDExLDEwIEBAIHZvaWQgZHJtX2ZpbGVfZXJyKHN0cnVjdCBk
cm1fZmlsZSAqZmlsZV9wcml2LCBjb25zdCBjaGFyICpmbXQsIC4uLikNCj4gICAgICAgcGlkID0g
cmN1X2RlcmVmZXJlbmNlKGZpbGVfcHJpdi0+cGlkKTsNCj4gICAgICAgdGFzayA9IHBpZF90YXNr
KHBpZCwgUElEVFlQRV9UR0lEKTsNCj4NCj4gLSAgICAgZHJtX2VycihkZXYsICJjb21tOiAlcyBw
aWQ6ICVkIGNsaWVudDogJXMgLi4uICVwViIsIHRhc2sgPyB0YXNrLT5jb21tIDogIlVuc2V0IiwN
Cj4gLSAgICAgICAgICAgICB0YXNrID8gdGFzay0+cGlkIDogMCwgZmlsZV9wcml2LT5jbGllbnRf
bmFtZSA/OiAiVW5zZXQiLCAmdmFmKTsNCj4gKyAgICAgZHJtX2VycihkZXYsICJjb21tOiAlcyBw
aWQ6ICVkIGNsaWVudDogJXMgY2xpZW50LWlkOiVsbHUgLi4uICVwViIsDQo+ICsgICAgICAgICAg
ICAgdGFzayA/IHRhc2stPmNvbW0gOiAiVW5zZXQiLA0KPiArICAgICAgICAgICAgIHRhc2sgPyB0
YXNrLT5waWQgOiAwLCBmaWxlX3ByaXYtPmNsaWVudF9uYW1lID86ICJVbnNldCIsDQo+ICsgICAg
ICAgICAgICAgZmlsZV9wcml2LT5jbGllbnRfaWQsICZ2YWYpOw0KDQpTYW1lIGNvbW1lbnQgYXMg
d2l0aCB0aGUgZGVidWdmcyBwYXRjaCwgY2xpZW50LWlkIGZpcnN0IGFuZCB0aGVuIG5hbWUgSSB3
b3VsZCBzYXkuDQpTdXJlIEkgd2lsbCB1cGRhdGUgYW5kIHNlbmQgYSBuZXcgcGF0Y2guDQoNClRo
YW5rcw0KU3VuaWwNCg0KQXBhcnQgZnJvbSB0aGF0IGxvb2tzIGdvb2QgdG8gbWUuDQoNClJlZ2Fy
ZHMsDQpDaHJpc3RpYW4uDQoNCj4NCj4gICAgICAgdmFfZW5kKGFyZ3MpOw0KPiAgICAgICByY3Vf
cmVhZF91bmxvY2soKTsNCg0K

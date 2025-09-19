Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E661B87C06
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 04:51:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC20D10E924;
	Fri, 19 Sep 2025 02:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hsEGUpCF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012031.outbound.protection.outlook.com [52.101.48.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D59810E21C;
 Fri, 19 Sep 2025 02:50:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5P59vGFaf1mebSWH/jPoDHzUTi882fIfbg+0+Fv9uzs1DFfFVR5K6sLMCqFibaBJn0bGGmwxH8J7mOm0JKleSOi7hzEea5nAbkUHV+C/JQyzmXXpONLzlaawCY4NzMx2ExFHt5fZNC9zua53dB6bx0JB8peuaUMybzAiYAtsqHBHomfyF6ppfm+xWPVeOIn+PcUPJZevr5IPldof2zJ4Xf+NA39zVlQU89b+mu79ccATkva5IaGB+o37XhLmXrw6Bb9fbeY9ESLd0sPg7N7eYvmVeomdimTKAG7EN7F23VGOMNgu6sGoj3ygbgHM8KyB4CIjfILvnDwpD/1iPqxlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VmisMiBr/1oR/xrOd2zIcHKVwtWSM3nmK0iZ6atx5xM=;
 b=qOYFmyHDZKN0DaJmn8bHJS+ltCYfWAWvkhbuGnxilQQPuon9a/4JbhW8jSHW6BlRU88TfydBqXAM8SofN82TmiCiXVSf68WCcmazqJ62Q5x1QTkm0vWpiwCIILd66gS30Fc+NMDvRW5qEkTebFnj567V80v59ZK/um3fC1NhSfsdogD3zScoWNtiW88T+aWc3dr3tu7jRUgf/LWUai/hDQDtBen40oYxYJqjBFzD+USH9xTswFAuGxoKIriMvQsLpvMgt1lXBvEh20ysWk+LOtNrXiD1r7k62+1tkiJjdZBvJIBo84rryqP1QYljtBkGKSwaDmQ1IXbJ0dyDWtJggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VmisMiBr/1oR/xrOd2zIcHKVwtWSM3nmK0iZ6atx5xM=;
 b=hsEGUpCFOU2wBotmUKfAEmBkOWraQ09cYKXRUYlPQsBivbw1MfltiaPfgWQfJEky319A2G08uGA6ruxMZx8lcfofDiDZLWw7jvrLXm4p3nSrDJmNU1i6YAiA7T20CfdGBjd+AyU44jUjzAN9zOtOB3tNimLqU2MUsBwhN20LE3Y=
Received: from DS7PR12MB6005.namprd12.prod.outlook.com (2603:10b6:8:7c::17) by
 PH8PR12MB6746.namprd12.prod.outlook.com (2603:10b6:510:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 02:50:52 +0000
Received: from DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::4dc0:f34c:9e7e:ccb]) by DS7PR12MB6005.namprd12.prod.outlook.com
 ([fe80::4dc0:f34c:9e7e:ccb%4]) with mapi id 15.20.9115.020; Fri, 19 Sep 2025
 02:50:52 +0000
From: "Liang, Prike" <Prike.Liang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Dan Carpenter
 <dan.carpenter@linaro.org>
CC: "Deucher, Alexander" <Alexander.Deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Sharma, Shashank"
 <Shashank.Sharma@amd.com>, Arvind Yadav <Arvind.Yadav@amd.com>, "Khatri,
 Sunil" <Sunil.Khatri@amd.com>, "Zhang, Jesse(Jie)" <Jesse.Zhang@amd.com>,
 "Paneer Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH next] drm/amdgpu/userq: Fix error codes in
 mes_userq_mqd_create()
Thread-Topic: [PATCH next] drm/amdgpu/userq: Fix error codes in
 mes_userq_mqd_create()
Thread-Index: AQHcKIEoiz56LrqOkEqALz8ACmXyCrSYtDwAgAEWi4A=
Date: Fri, 19 Sep 2025 02:50:52 +0000
Message-ID: <DS7PR12MB6005B4FD8CABEE1A06594C66FB11A@DS7PR12MB6005.namprd12.prod.outlook.com>
References: <aMvVAsrczM9W2S7P@stanley.mountain>
 <111d7bd7-57bb-4873-a62f-876128281572@amd.com>
In-Reply-To: <111d7bd7-57bb-4873-a62f-876128281572@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-19T02:34:25.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB6005:EE_|PH8PR12MB6746:EE_
x-ms-office365-filtering-correlation-id: 9f53a765-8f5a-4e1e-8e2e-08ddf72758e3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MmhjZDRzbjZjQS9abERiemJaazAyOFNWeElLN1hLZUFPa3JXTU9RQWpjWjdh?=
 =?utf-8?B?U05YWDRBNGpJTUJCQzRxQlg0Y2ZJNFNTZE04Q1V4QVREaGpvbjNzbDI5Q2xJ?=
 =?utf-8?B?cHJDeEQzL0VkbUVoQ21odmF6WnJSa0lxVkVyajlTOHMreWFKUTZJMGhBVmZ1?=
 =?utf-8?B?V2VLeW1nOWtiVjN3OHJGcEFlTGo3ci9EY0hLK0haZEdKVlUvaVBvZjJwMS9W?=
 =?utf-8?B?OGJYeWRRUzFxWnNVZFdBV3NGaUhhOU42NG1PdzdheDFicWUzU3hKcTBLZ1FI?=
 =?utf-8?B?T3RUVWtDQjQwOFNBREI1bkd0bXdsbXZqdUdOSU1NelV6ZUVqQ2VPSkpqVjUv?=
 =?utf-8?B?Vjh4amMxRHg3N0hFNlBpMGJhWUM5SjJBZTNBd25aaXlHOXhyVFEvcjhMR3p2?=
 =?utf-8?B?YTZPSWVZanBEVi92ZzQ1RGdzYmlLUzgvRXZMTDhmL1hhemt2OUIxNTVHd2RM?=
 =?utf-8?B?cUdHdWZidUR2b1U1V3N4allVaklYUEpNcGRyR2dYSDBRdU12RWJObjFIWERC?=
 =?utf-8?B?VG5GSUVLSjRxN3MyZXAvd3U0WGppemlUWmx1ckk0aFRXWjBQalc0V2dZWm1S?=
 =?utf-8?B?czRLLzdLQTlOMVgrOGp5akgzek8xN3ArRXJwWE9GOXNnUUVvOEN2K3RjMFM1?=
 =?utf-8?B?aklXM1FQN0pXT1ZwRWZqNmorZFJWYzNETTlidkdjR01nTGgydWlmL3ZNWERt?=
 =?utf-8?B?QWVUQkVZV2c0OVVDVXRXbXZyWk1wOGszNVRYeGNCQmNwS0g2ekM0cnJxc2RR?=
 =?utf-8?B?b0hHWHpnL0Irb2tUZWZYNDBXaEY5dmpFY3RxUFUxK0l3dXBqdGtqMUlFQURU?=
 =?utf-8?B?YXhScEVlR0YwQmNseWxaRGVVblFkQkdoQ0pxTGRJcnR1RlJtNDFQcGtiNkw3?=
 =?utf-8?B?TUxkRHl6UTdhTjI2YWJubHFKbjdlR0k2aHk1dUU5REJiS2RmZk1YOGRWTVN5?=
 =?utf-8?B?Y2w0QU9McFk2TVhuTFVwaVFHNlVaRGtzZVZCOVhQbHRVMU1vaG5DOXM5UXVC?=
 =?utf-8?B?TDBQamhST1JGQlpPb29MUmZxK3pvZGFnNEFudThWb1FNa3FaclR2OVQ2TFZW?=
 =?utf-8?B?TVE3Zk5VMmY1RzNrV25BYjRMUmZIWHJlTkNmd2w0RnozMEYxVERGUUxWbnpJ?=
 =?utf-8?B?U3lROXpQYVpEeVRYdWZFWE5YMkM2STY4b2cvbUtHWmgvWVhaTm1aZ0VTcXo3?=
 =?utf-8?B?UHU1YzhVdjZCdEFlNG9qdEcyTDkxWlpaV2V6bGNpUkN0cmF4L0Q0ZXp2VGIv?=
 =?utf-8?B?WVU5bTdZaG90SmQ1VmJ2Q1VqNlFwUlNRKzd5MldFdDVzZkRINWlPM21RN3Qx?=
 =?utf-8?B?Rkx1TWtOaHpnV3pFekxSbG1NaTFqSFNQWlQ3ZFRJSndnZUlJQndaeng3S0VK?=
 =?utf-8?B?ekEvTnpvVmlqdmdhL2Q4ZW52enE3cU5qbjZ1U1c1Y2xlSUdlcGs3UGZROUx5?=
 =?utf-8?B?N3d5YVo0dWszWmNnOHF0SmZSdDdvMXhxT2VGaWYxMzQ3UEx2QStreDhZbmhJ?=
 =?utf-8?B?UVNVR1NNWm1yWWFyL1JDQytXaFVmaWs4dHpxWjVSUzMyK3I0VVJsWnE1YWFN?=
 =?utf-8?B?OUNkTStXc0pvb0tucEZQd3dxWW5UVkpnQ2R2TW5uZnZkZUpPZW40SlBDNkpq?=
 =?utf-8?B?My9hNm1PTnNvK1g3OHhLS3VlY0tsMm1UZ2U4bEFydi85OVRxbFRjTytPRk8w?=
 =?utf-8?B?NW9idmtZZnNnVnBoazZnaDNUVlJWU3lCd0s0V080ZGxkQnQzT0RYQ29RQ1U3?=
 =?utf-8?B?OWNsOGFWdE5vUFYxV0k2S1k1RGFkcEkrNFF0SkhPdjhPRjdBY1JvZW1IYjdM?=
 =?utf-8?B?bGtKY3I3cDFIZC9HMEJpYkVRaFBpS2E3UmdzTXYwRjNVOW9qZVNvQ0VmRWN6?=
 =?utf-8?B?YWw4VVNYbHVNaW9IQ1hBS2tWN3hPdytLL1pybHNPU1pZTFBHSFoxZFNNT29u?=
 =?utf-8?B?WEYxbWdESEpPbE5BNG95QkVBaWIydDVOQzRXV1crN3d0RG1EdkdVdGs2ZUtx?=
 =?utf-8?Q?Be4AIZYL+URBAhX99gSICuooMURJdw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6005.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QTMvYzh4R28vbUpIVjBwUXFEYmlZQTFHWWVrOHdrYmxwVXptQVA2eERXcFAr?=
 =?utf-8?B?YkhrcHlVWVd3VFhJVklmV3FJM20zRjlpa1loWmkvc241WGljd1NSZ1hldUFD?=
 =?utf-8?B?Unl5MmJYL2dLOEd1cEp1cUVIbG5heFJtMHRwM1VFQmE2dHRyU0VpUFRqSnlx?=
 =?utf-8?B?NWRZTWw0S1F5cXc1bDFvZUhEQzRzdXUvSW9Ec3dZUzhzRTNDR0FkSjN2ZTR5?=
 =?utf-8?B?UlJBWjhlV09CTWpMSUlia2FON3BBeTkydWxWQzVSbkhMM042azJWbkVJd3BO?=
 =?utf-8?B?MEZSWi8zY2s0b2tBVlVTcDV0RWI3a1QzNjhMQXh5cGw4bnVhZm5QelkreEdQ?=
 =?utf-8?B?cndJODVZZ1p1SzdadnBVSG5FZUIrMFFhaHNqemsvR2taaEtsQTNaZWY0Nmc2?=
 =?utf-8?B?bVhPdFBYVnlTR0hnUWwyTnlPTk1tbHplWGNvOEEwZ04wNVBlQURiUEs3QUww?=
 =?utf-8?B?ZGRDU1YvdERnWHVmUW9MUm1xaVlsaW5qVVRZc1YzYmg4WitaS3EreG1GanVj?=
 =?utf-8?B?V3hJbnJLWFhhZXpnZUVtOUVhRXpOam40c2ZhcFZSVFd6TmxmTmZYQy94RW8x?=
 =?utf-8?B?Szk1NkNTN3dCdDNnSHQxeTBENmZqbklZeWI3cURscTM1QWVaZFR2UG5Da3ND?=
 =?utf-8?B?amYxRGpTcUVFeEE2Mm42S3YrU1UwSThqRWNaRGNPYis3TjRYYk8vNnRjQ1Iz?=
 =?utf-8?B?TGVSa0tnNk1aa2pTaFBYa0tPdUYybDdQM3I4TTcxYmJvcVBIbklMMVNIREZB?=
 =?utf-8?B?MlY2bzVXa2dNQ245Y1ZKQzBkdW1ycGZvUVFyZ080ZXY4eFdRM2s4bldZelA2?=
 =?utf-8?B?VEdwZjl4a2wwWGFIUTF3N0RZOWlFQjR1cnNvSW1YaG55TWp5clprOFZFTDFJ?=
 =?utf-8?B?K0hSd3F5UFVjMEJES0RtNzQ2NXBhQVBXd1RabE9MMmtXMzQvL2lnaVFVYkVD?=
 =?utf-8?B?R2dqM0Q3Tis5cDBDelQzU2FwWUZlRE03UVdmRlc1bXRyandCaUFjY0FGYTVr?=
 =?utf-8?B?WXNQcjhSRlhDMmp4aHduZk5kcGIzZ2UwUG83a1Y4VTd2QjBUNzFYL1BERnVU?=
 =?utf-8?B?bzNPN2xyanU3V2tnM0N6a3owRjdYTjg1T2t3Vnk3by82aTZNYkhNZUlsYUhl?=
 =?utf-8?B?OXBNNXBmTDJPa2dBQmVOWFVzNjg0ZE9JQXhQYW5US3E5SkxCQWVpREtFd3ZP?=
 =?utf-8?B?RkhxRGp6UUlOcnZGWkZ4RUdURXZWeEJWdDlJZUtFb1VBbmgvbXpIU3N2b0Rv?=
 =?utf-8?B?S3VPMUtRNmhVRFRsSFhZVm1yc3dxSHBaS09GcHY0Yk5wdmNyOWR5Ylh4UFZt?=
 =?utf-8?B?OHFmV3lzK2p2ZDBMSkRDVnpEU2svQVZvM0tlQ1VMcGpEdk5UbHFBdzBmUXhr?=
 =?utf-8?B?ZEMwVHBXM0pBZGdabnlhRDdqNDVPNXVCMDR2WFFDZXRQU1l4MGl4WlZPcjk3?=
 =?utf-8?B?VmxsNk8yVlZBQmpZVGJuMWlMeW0wNHVkbVRSaC9OR25JZ1lGem03eklHRktq?=
 =?utf-8?B?VmlpTjdyWUVGYTdMRjlHRnNtZkZjZ3U3SUV6VUpqMWRXWkZMZFVrczNJc2dw?=
 =?utf-8?B?OXQ1RzljNUU5U0lQbzlkcnNjNE9obnEwbkw2NkdZS3kzcVQ5ejJISEdKbjll?=
 =?utf-8?B?OFhyYWExZ01hK25Eb09jbG13NFAydFZjRmdHSExVN2FrVFBOZlZuYXc4N2o3?=
 =?utf-8?B?Lyt4OXBxekczNUdEVk9nVWg0L0hvNjJiYXM1OVEyQ1BHTGhlMkdvSS9EaG9X?=
 =?utf-8?B?em13VUViYWVBVE9OT2NFZFZuSStDR0NwSlByMVhkWXdoc2k1Q3pidlZXZG1t?=
 =?utf-8?B?cHFOYXNqRVZSbTRqL00wMXE5UllnN2xFeEdYazU5Q25OZ01NT1JNekxTWWUx?=
 =?utf-8?B?bVRqQkNHLzdoWlp2bjlSZU1VVkwzdW1kdkxvSStRR0tBcHcwMFFUUTVtSlZi?=
 =?utf-8?B?RzZDbWdLaWM2bHprVm5PbEVtMDFUUFFabWF6SjRHWjZBbGN4bS9qVGhmbzZD?=
 =?utf-8?B?c2FLdzBCK1NaUzlyT0RCTDd3c0lSQnJzWEVYaUhpN0pwYnpTVGFjZmtHRlA0?=
 =?utf-8?B?b1RwbFZXRnBaRXlXWkdQYzBwMkR3UUdGL1ljc0tHcXdqUFI5NnpTRHVaNFhk?=
 =?utf-8?Q?hazM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6005.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f53a765-8f5a-4e1e-8e2e-08ddf72758e3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2025 02:50:52.3228 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dwuw1GUya1WlSrfem2/rVwIVTkRT0cxEjsXKiugku/R55mYUqLHOn2mUFWuaIBvQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6746
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

W1B1YmxpY10NCg0KUmVnYXJkcywNCiAgICAgIFByaWtlDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gRnJvbTogS29lbmlnLCBDaHJpc3RpYW4gPENocmlzdGlhbi5Lb2VuaWdAYW1k
LmNvbT4NCj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAxOCwgMjAyNSA1OjU3IFBNDQo+IFRv
OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQGxpbmFyby5vcmc+OyBMaWFuZywgUHJpa2UN
Cj4gPFByaWtlLkxpYW5nQGFtZC5jb20+DQo+IENjOiBEZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhh
bmRlci5EZXVjaGVyQGFtZC5jb20+OyBEYXZpZCBBaXJsaWUNCj4gPGFpcmxpZWRAZ21haWwuY29t
PjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZmd2xsLmNoPjsgU2hhcm1hLCBTaGFzaGFuaw0KPiA8
U2hhc2hhbmsuU2hhcm1hQGFtZC5jb20+OyBBcnZpbmQgWWFkYXYgPEFydmluZC5ZYWRhdkBhbWQu
Y29tPjsgS2hhdHJpLA0KPiBTdW5pbCA8U3VuaWwuS2hhdHJpQGFtZC5jb20+OyBaaGFuZywgSmVz
c2UoSmllKSA8SmVzc2UuWmhhbmdAYW1kLmNvbT47DQo+IFBhbmVlciBTZWx2YW0sIEFydW5wcmF2
aW4gPEFydW5wcmF2aW4uUGFuZWVyU2VsdmFtQGFtZC5jb20+OyBhbWQtDQo+IGdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LQ0K
PiBrZXJuZWxAdmdlci5rZXJuZWwub3JnOyBrZXJuZWwtamFuaXRvcnNAdmdlci5rZXJuZWwub3Jn
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggbmV4dF0gZHJtL2FtZGdwdS91c2VycTogRml4IGVycm9y
IGNvZGVzIGluDQo+IG1lc191c2VycV9tcWRfY3JlYXRlKCkNCj4NCj4NCj4NCj4gT24gMTguMDku
MjUgMTE6NDYsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+ID4gUmV0dXJuIHRoZSBlcnJvciBjb2Rl
IGlmIGFtZGdwdV91c2VycV9pbnB1dF92YV92YWxpZGF0ZSgpIGZhaWxzLg0KPiA+IERvbid0IHJl
dHVybiBzdWNjZXNzLg0KPiA+DQo+ID4gRml4ZXM6IDllNDZiOGJiMDUzOSAoImRybS9hbWRncHU6
IHZhbGlkYXRlIHVzZXJxIGJ1ZmZlciB2aXJ0dWFsDQo+ID4gYWRkcmVzcyBhbmQgc2l6ZSIpDQo+
ID4gU2lnbmVkLW9mZi1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBsaW5hcm8ub3Jn
Pg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9tZXNfdXNlcnF1ZXVl
LmMgfCAxNSArKysrKysrKystLS0tLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9tZXNfdXNlcnF1ZXVlLmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L21lc191c2VycXVldWUuYw0KPiA+IGluZGV4IDJkYjliMmM2MzY5My4uNzc1YjBiZDVk
NmM0IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21lc191c2Vy
cXVldWUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L21lc191c2VycXVl
dWUuYw0KPiA+IEBAIC0yOTgsOCArMjk4LDkgQEAgc3RhdGljIGludCBtZXNfdXNlcnFfbXFkX2Ny
ZWF0ZShzdHJ1Y3QNCj4gYW1kZ3B1X3VzZXJxX21nciAqdXFfbWdyLA0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgZ290byBmcmVlX21xZDsNCj4gPiAgICAgICAgICAgICB9DQo+ID4NCj4gPiAtICAg
ICAgICAgICBpZiAoYW1kZ3B1X3VzZXJxX2lucHV0X3ZhX3ZhbGlkYXRlKHF1ZXVlLT52bSwgY29t
cHV0ZV9tcWQtDQo+ID5lb3BfdmEsDQo+ID4gLSAgICAgICAgICAgICAgIG1heF90KHUzMiwgUEFH
RV9TSVpFLCBBTURHUFVfR1BVX1BBR0VfU0laRSkpKQ0KPiA+ICsgICAgICAgICAgIHIgPSBhbWRn
cHVfdXNlcnFfaW5wdXRfdmFfdmFsaWRhdGUocXVldWUtPnZtLCBjb21wdXRlX21xZC0NCj4gPmVv
cF92YSwNCj4gPiArICAgICAgICAgICAgICAgbWF4X3QodTMyLCBQQUdFX1NJWkUsIEFNREdQVV9H
UFVfUEFHRV9TSVpFKSk7DQo+DQo+IFRoYXQgY29kZSBpcyBub25zZW5zZSB0byBiZWdpbiB3aXRo
LCBBTURHUFVfR1BVX1BBR0VfU0laRSBpcyBhbHdheXMgPD0NCj4gUEFHRV9TSVpFIG9yIG90aGVy
d2lzZSB0aGUgd2hvbGUgZHJpdmVyIHN0YWNrIGRvZXNuJ3Qgd29yay4NCj4NCj4gV2Ugc2hvdWxk
IHByb2JhYmx5IGRyb3AgdGhlIG1heF90KCkgYXMgd2VsbC4NCg0KVGhlIHVzZXJxIEVPUCBidWZm
ZXIgc2l6ZSBpcyBkZXRlcm1pbmVkIGJ5IHRoZSBNZXNhIGRyaXZlciB1c2luZyBkZXZfaW5mby0+
Z2FydF9wYWdlX3NpemUuDQpBY2NvcmRpbmdseSwgd2UgYWxpZ24gdGhlIGV4cGVjdGVkIHVzZXJx
IEVPUCBzaXplIHdpdGggZGV2X2luZm8tPmdhcnRfcGFnZV9zaXplIGFuZCB1c2UNCml0IHRvIHZl
cmlmeSB0aGF0IHRoZSBFT1AgYnVmZmVyIHdoZXRoZXIgaXMgcmVzaWRlbnQgd2l0aGluIGEgdmFs
aWQgbWFwcGluZyByYW5nZS4NCg0KVGhhbmtzLA0KUHJpa2UNCj4gUmVnYXJkcywNCj4gQ2hyaXN0
aWFuLg0KPg0KPiA+ICsgICAgICAgICAgIGlmIChyKQ0KPiA+ICAgICAgICAgICAgICAgICAgICAg
Z290byBmcmVlX21xZDsNCj4gPg0KPiA+ICAgICAgICAgICAgIHVzZXJxX3Byb3BzLT5lb3BfZ3B1
X2FkZHIgPSBjb21wdXRlX21xZC0+ZW9wX3ZhOyBAQCAtMzMwLDgNCj4gKzMzMSw5DQo+ID4gQEAg
c3RhdGljIGludCBtZXNfdXNlcnFfbXFkX2NyZWF0ZShzdHJ1Y3QgYW1kZ3B1X3VzZXJxX21nciAq
dXFfbWdyLA0KPiA+ICAgICAgICAgICAgIHVzZXJxX3Byb3BzLT50bXpfcXVldWUgPQ0KPiA+ICAg
ICAgICAgICAgICAgICAgICAgbXFkX3VzZXItPmZsYWdzICYNCj4gQU1ER1BVX1VTRVJRX0NSRUFU
RV9GTEFHU19RVUVVRV9TRUNVUkU7DQo+ID4NCj4gPiAtICAgICAgICAgICBpZiAoYW1kZ3B1X3Vz
ZXJxX2lucHV0X3ZhX3ZhbGlkYXRlKHF1ZXVlLT52bSwgbXFkX2dmeF92MTEtDQo+ID5zaGFkb3df
dmEsDQo+ID4gLSAgICAgICAgICAgICAgIHNoYWRvd19pbmZvLnNoYWRvd19zaXplKSkNCj4gPiAr
ICAgICAgICAgICByID0gYW1kZ3B1X3VzZXJxX2lucHV0X3ZhX3ZhbGlkYXRlKHF1ZXVlLT52bSwg
bXFkX2dmeF92MTEtDQo+ID5zaGFkb3dfdmEsDQo+ID4gKyAgICAgICAgICAgICAgIHNoYWRvd19p
bmZvLnNoYWRvd19zaXplKTsNCj4gPiArICAgICAgICAgICBpZiAocikNCj4gPiAgICAgICAgICAg
ICAgICAgICAgIGdvdG8gZnJlZV9tcWQ7DQo+ID4NCj4gPiAgICAgICAgICAgICBrZnJlZShtcWRf
Z2Z4X3YxMSk7DQo+ID4gQEAgLTM1MSw4ICszNTMsOSBAQCBzdGF0aWMgaW50IG1lc191c2VycV9t
cWRfY3JlYXRlKHN0cnVjdA0KPiBhbWRncHVfdXNlcnFfbWdyICp1cV9tZ3IsDQo+ID4gICAgICAg
ICAgICAgICAgICAgICBnb3RvIGZyZWVfbXFkOw0KPiA+ICAgICAgICAgICAgIH0NCj4gPg0KPiA+
IC0gICAgICAgICAgIGlmIChhbWRncHVfdXNlcnFfaW5wdXRfdmFfdmFsaWRhdGUocXVldWUtPnZt
LCBtcWRfc2RtYV92MTEtDQo+ID5jc2FfdmEsDQo+ID4gLSAgICAgICAgICAgICAgIHNoYWRvd19p
bmZvLmNzYV9zaXplKSkNCj4gPiArICAgICAgICAgICByID0gYW1kZ3B1X3VzZXJxX2lucHV0X3Zh
X3ZhbGlkYXRlKHF1ZXVlLT52bSwgbXFkX3NkbWFfdjExLQ0KPiA+Y3NhX3ZhLA0KPiA+ICsgICAg
ICAgICAgICAgICBzaGFkb3dfaW5mby5jc2Ffc2l6ZSk7DQo+ID4gKyAgICAgICAgICAgaWYgKHIp
DQo+ID4gICAgICAgICAgICAgICAgICAgICBnb3RvIGZyZWVfbXFkOw0KPiA+DQo+ID4gICAgICAg
ICAgICAgdXNlcnFfcHJvcHMtPmNzYV9hZGRyID0gbXFkX3NkbWFfdjExLT5jc2FfdmE7DQoNCg==

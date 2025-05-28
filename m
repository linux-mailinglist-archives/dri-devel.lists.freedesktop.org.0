Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 682F7AC6A1B
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 15:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C913210E1DE;
	Wed, 28 May 2025 13:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OefniJC/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2082.outbound.protection.outlook.com [40.107.95.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0270A10E1DE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:14:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrzR50oR7sCZNvRXrZfFaAK2cjog7s/jZP7mNE+QJGYs5pUo48i2t41aOU00K7hKrdZqeoxziXqTVAZwI2yShlCwsKEudkDy6tSfKtV83l2Ot89dE15HGp+q/bf6qWVHGc+uljzXExFKgLSyac8bN6ua1MS7o+F/1AGnyaPaUxTwR3KPHVn69DXavR+JFhAS3Lsx/9/Mkfg/VNDAIgmqTv3Ds9neD9fu9MRi9rVyfmGHB//P+0z16UN02KukrfughFy6LPYXNHoZbxx8BBWPt6tmd6D2n+nqa2oszKk4zaOfoca5apCoj2ZAHun2bpwWsbbXay8C1JZOy7+2sOuLWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h69WZ1O7POjCyN/rTGQhn1yLvynAP6+oBEh3/k4V3jA=;
 b=Y0V4DBvZ+vAWNJ6/XCPJJA+4ROCj5wAD/gxY56neRy16WAL5SYExnXqSdZUNTfU5/EcOaMZZn3CyZDVMVBlYeCG8F2eeAITgg2g2Qd4jgYrraXN0nHA25yYQdcNDBuaAj9HUs06dayHTIndarNRac+vdsj2n3iU3hJ8kIlQ1/ojNPSTlnGbR7svgfRJCM+7hdRcZ+XqxY0qnTQO/S5bK2WoIEorop81mbkrUvZOk6YY6hIMqnOa+SB+zesxoH4IRyT8bpxulUmM9TMKS6ehPBwPu3BL6cCBIX0zumzeyUMr1ZqnzGaY1R4WT7BXUdD2oR1fJrIzNcRoQDoEWWMCBwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h69WZ1O7POjCyN/rTGQhn1yLvynAP6+oBEh3/k4V3jA=;
 b=OefniJC/+enx7oL924Glf6PyzEnvjkpGTMEvRyE0Ec5+Nlatf+VeR7WoO4A6vByrlTO+hwGRQtBLyark5jFJAwW064ahFl8M2GLfD5Os7fOnDkVUTSDifeu9WUbsBU6X1BqwhdRT7MUUn4btudj0hqWTxYmEEUzETQteRkoPcJ8=
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by SJ2PR12MB8881.namprd12.prod.outlook.com (2603:10b6:a03:546::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Wed, 28 May
 2025 13:14:03 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8722.027; Wed, 28 May 2025
 13:14:02 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>, "dmitry.osipenko@collabora.com"
 <dmitry.osipenko@collabora.com>, "Pelloux-Prayer, Pierre-Eric"
 <Pierre-eric.Pelloux-prayer@amd.com>
Subject: RE: [PATCH] drm/debugfs: add client-id to the debugfs entry
Thread-Topic: [PATCH] drm/debugfs: add client-id to the debugfs entry
Thread-Index: AQHbz6FUZ0R2uVcH7kCr4/asjYSN5rPn4DuAgAAZ1QCAAAst0A==
Date: Wed, 28 May 2025 13:14:02 +0000
Message-ID: <BL1PR12MB57534C8A364BA7C7E33B92A39367A@BL1PR12MB5753.namprd12.prod.outlook.com>
References: <20250528072248.1490819-1-sunil.khatri@amd.com>
 <96d0a239-415c-4f61-b4c6-1f9b9d948736@amd.com>
 <5f14a8c5-7964-4639-bb62-fba4475eda76@damsy.net>
In-Reply-To: <5f14a8c5-7964-4639-bb62-fba4475eda76@damsy.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=9e889ac9-eb11-419a-b9c5-58c3799e094e;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-28T13:13:06Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Tag=10, 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5753:EE_|SJ2PR12MB8881:EE_
x-ms-office365-filtering-correlation-id: 53bbd16a-ac02-4a3b-76e9-08dd9de9841c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?cE5yYW9jbmh1VzhRdFkveVVZajJGcENCQURkQXh2bTErOVViVWVJcld3eGJW?=
 =?utf-8?B?a1J6MXBkOXBSRjkvWXZmdzltYmxXSTNpMWtVc0FTWmJ0RmRaejc1bzhPd0JB?=
 =?utf-8?B?OUplTXZ3Z3B6UVEzeWduWmRjcVNRZytqcWJ1eFlTeW1KVjV2T0JFQytmQkF2?=
 =?utf-8?B?Ymxna1RTUDg3Z0xwUFpKZG5jYW9VekJFSUR2K3M3b0ZMQW91QThZTE1TbDBW?=
 =?utf-8?B?UEx3Q0xJMUwvcmhWdWptM2lydlJzYXZzZVY1dm9TZ3NiSVpOUDJuQ3VEcUVL?=
 =?utf-8?B?SFhYZDlaR2NsVEV4VllyR1lEemh1eXo4ZUVFTjRNTy92RVlraU5tK1d2ZFNV?=
 =?utf-8?B?UzZrcSt3WnJLRm8rZ3JJekNLTmVRZlMzUFpyV1BTRExleGtnNDFuMWt5UVZq?=
 =?utf-8?B?V1RqWVl3c1U4Sm5mWjRzRFR6NzY0TGFKRjNyWm15TVErTXA0T2pTQXI2MzQw?=
 =?utf-8?B?SFRwSFFoeEd2STlCZzRBUGIrUFp5UkJtc3ZJQXA4bmswdndsL29rR1BkQkR2?=
 =?utf-8?B?Vmp6WFByYW9ZMHZLVHB6M2Q4azYrVnlFcUIwQTlOTTZzZkY3RFZYZVlwMUxy?=
 =?utf-8?B?NENPcGsyZm91V2cvd3RJWnF1QThFN1ZXOGNFZkRISGhJMi9YV0hrS0hubzB2?=
 =?utf-8?B?aExOK3ZUcTl0eWI2YSs2dFYrMVhucnhxZWNlbXhlT0lUN01LUUI3WDJ2M3F5?=
 =?utf-8?B?TjQrY1BIOWtHN1VBLzIxMmQvd0dIZ0NSQjhuWkJERDJGQ25kc1ptRlZFZGhh?=
 =?utf-8?B?VGhFcUhLSE1LWll0eWl2SzBnM2JQN3M0LzF1eDd5MzJkQVpGRzAwY0FxWllr?=
 =?utf-8?B?T3BXTHdwK0JQZlV1a0xFTm5GYmdWNTUyZmZOUXhackxQTlhlS3dPRkZxWFRQ?=
 =?utf-8?B?Y3Z4eGdnSW02RndDVk1LcWtHN1p5dVJNMGVObFBmQXEwNzBadHZGWjJIeUI1?=
 =?utf-8?B?ZDZGL25tb3dkbm00cXR1TmhLVTYvNDd4K3FyMUZDRWQ3aGZ6NDF5WGtLUGV1?=
 =?utf-8?B?QWRmZjJMbmRRTk1lMGhyS0daeHpvY1NGYlNUN1lkZXlzYy9QdEpzWTVHb2tW?=
 =?utf-8?B?UEdVQ3ROV1Q0NkdjTjdMbWRPeGgyQXdWOU41N0VVcG9yM2UvMStQVTB6eG56?=
 =?utf-8?B?bU1LVHlpc2pjVElpNFlhRk5FM0tsaHpzWkdINno3eFNHSGI5MDFZblJ0Tjg3?=
 =?utf-8?B?aTk0cmpTeUJyQU1MMWJFbTJOcFJJVlppZGtxY1FHNjVzMEZHbUo0WWJhSWFn?=
 =?utf-8?B?eTI1OFdURnpOWnRhU2NVUFZHNzF5UnJRUnNEWHVqOE1jaUdRL3UwTnNXcnJC?=
 =?utf-8?B?WXV1QVlGZGpmVlcwakZ5cGgvbTlHS1BDdXdvcmJvSEdVUVdqSUk0ZmN4M2hi?=
 =?utf-8?B?aFlaYXAzY0dTS1hTdTVZNmdudzRXWGFLK2htMml2OTlDM3ViMTRWazE4UnJi?=
 =?utf-8?B?QkkrOG1oS25qT0hpNUFvWFdIbUxxRFNaQzJ4WXliSTlHYmRaWnRKUkdZcWFP?=
 =?utf-8?B?VEtnQmtVNkdjZUNUVU0vVmR2emxRL2RhbWRueWdIdUNzTTg0blFBUG51UGJP?=
 =?utf-8?B?eCtkWlZKaU1CTGg5bEQxV3JKTDJMT1Zncnc5dmx0Q3I1T2RMZ25MR3NxM1dP?=
 =?utf-8?B?Y0dxd0pNMWhTdEFrQTk2WExzTGVHbVdkOStDR294UWdsdTB3V3BaeUUyZ2tN?=
 =?utf-8?B?OEdqd3dOM1BidE41NFRzYmlGRjM4WWdsTlRtQUMvZjVYbFFOaURibGVaU0NM?=
 =?utf-8?B?UmtGVDZMS00zbm1Tdk5kMXgzNzJ5eTBQMHVhcVc2WEp5MHVXMzh3VjVrUEda?=
 =?utf-8?B?WlI5REQxYy9rVzBwdlZhazNXbjRicDkzOVdxUUplY1Zta01qOVFob1NxVjB2?=
 =?utf-8?B?ZHUwTmRON29FdTlTdWZIVnRFUFhnZjVhemd1MmhJQ1Q4WDdGTExiQzRYdUxy?=
 =?utf-8?Q?HNJDe3YZtC4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OUczQTZvSjNDYmpaQmw1bE0wbkE1UzIvZXlnODdXeU41bDFINXlpc1dKc0Zu?=
 =?utf-8?B?QzI0WDladWZ3TkNCdGg2bkQ2dXB3OXN2bTh4MU5xSkpoMUQyR2tCeXQzeC8v?=
 =?utf-8?B?Tk1aT1hJS2EvcEg4RHczOXNIQVJPakNQRzFDb05lMWlTRGlmYUx5bGl5UnJT?=
 =?utf-8?B?dngyVThYSTh2bkpZK1hnN21hN1FzWFdha0JpanJPRmI1UDlDblB0VUFtRS9j?=
 =?utf-8?B?UFBVamlHNTV3L2ZNQms0aDdlRm5SSHFmVHBnK0FVZTQ0ckxXZWF0ZGxqYzlt?=
 =?utf-8?B?QTQ0SEdQRTRhVXJlWDlHcWVMTmNmS2tyeWRZSVFSd29NMDhMVjRsSTZleURj?=
 =?utf-8?B?cWhnK3ZMa09HTEdENS9tc2QwajVPRmNBNTBQVUhJKzJBQjdVcXpuT2ZkbEF5?=
 =?utf-8?B?V0NEQkdkejBmSWJlRFBockNKaUtteGIxV2ZLanlPSHd3V3F3Y2J1OFpaeWxQ?=
 =?utf-8?B?NDAwQ2o5Tm56c2NrRTVzOHJzRHFJWGR2OVdKaVE4UFA3Y3R0dDBpMTRDTFBQ?=
 =?utf-8?B?WWEzV3E1ekxEenFKRytib0Y1Mk5kS3k3OGVIb0JaaThQbmtpcnB1VGptMDNw?=
 =?utf-8?B?RnZFM1ZvQjNpYzJDS1M1eElaOUJHUzQzUlY3TWxsY25abktFeFlwNGNIdmU1?=
 =?utf-8?B?QTVGcXdqU3RoVGpISHI0bkpIeEpaaEdRd3ZtVExvWDBDWkFQTVpUbHEwK0Vn?=
 =?utf-8?B?SFRaa25EVGRaenE5VG56eHkvbUxKZDFGOWdsa0Y5VWt3cmRVbjhxNEdodlBz?=
 =?utf-8?B?WHhtOVZZTXNjdzh3V1dDQVVGNVBmV0VPa3JvcFQ4Vjk5VllxdG91VU02dUNn?=
 =?utf-8?B?dWFIa3ZSWDE0Y2pXdG1Oc0kwdWJ2K1V4ZlhiaXhsQkFPYzN2WUF6N051S1hh?=
 =?utf-8?B?bkFkcWNVLy84ODNMallrRUk4RGpkMG1FS0JSRFJJVmhnTStlSThYMGJLODNC?=
 =?utf-8?B?dUNtSTR5T1ZsVWkvZVFsSDFBY1oxUU9xV1E0MXVZUzVKSkVLSlM4SGNWVy9t?=
 =?utf-8?B?V1BYSks3TWxWcjZKRFdwRzRGUEJBT3VBQzhabVdvKzVUL0Y2enpRQTdvRnNM?=
 =?utf-8?B?WUtXVjlHTVBoRVFQTGw4VGtSalpURkUrZUE1ako0OHRlRUEwbTV4OU1QWWVy?=
 =?utf-8?B?YXBaelQ1aGdpZ0FLZ1V4T3c5UWVsZStSbzFpZ1lQYjRVQ2pwSHJVU2svc2xU?=
 =?utf-8?B?VmxBL3Rna3RCZEV2WjRuSzh1OTBrbVUxeXIyaG1SVklCUXUvTitiaHpESWhK?=
 =?utf-8?B?U3IrMFRBZStOWW5DNTdaWHdKK0NDUlZWSjFMR1ZUZFR1S2UzUDRVMXlNc2FY?=
 =?utf-8?B?N3ZZRUQ3WHVKWW9oVTZiRmlOalpQTUIvT1dHM3RiUlZFd0V6YXI5dFlVemht?=
 =?utf-8?B?N0dXeUtVQzUyWDE1VjVET1BmRnR1Wmd2endNVzJlTFRIa1VqYVcvK01McDdG?=
 =?utf-8?B?UXpzMWtLaFc1VXhpRUNIWFVXQ0xnVGVsdXl1MzF6VE5tTXNGWUxxemtJSzYv?=
 =?utf-8?B?dUNnWnk2NldNYW82dEpraklnMkxheVBwQXZBSmlFZGNXSm9hd2ZQblhRMGQ0?=
 =?utf-8?B?U3QrbmhxNmQ4V1RzdjM5MEF5WGFUVzhtdExnN3l2cXJqYjN2SmNZNFF3ZCth?=
 =?utf-8?B?WFczN1gyOFh5MnA2VHlQTUZrMHBjL1RiMURqbnFhZElmR1pIVXkzODdFSVRS?=
 =?utf-8?B?MDR2c1M3bmJKZFNqcXNNb0hER0UxRURSajVCazRUZjFJVWk4K2JuZHRDWHQ1?=
 =?utf-8?B?WW5YU09BQ1ZobENSZzc0SHFUVVVsbjE2WVd5eUVSd1JzaTcrVTdObGp6MlE4?=
 =?utf-8?B?UWN6T2E3VnJSK0l5SThZSWFDUG1WQkFvT2lyM2hJbDhhRStYd0lRNllpaHpF?=
 =?utf-8?B?TGNZZlRCZVNKd256c3UwSVh5RFYyZmhHTXMvdm1IOTQ0emFudVZ3NERDQTFq?=
 =?utf-8?B?RFdVQkZkVStRZnpDOFhNcUJhSGJCK20weWFNU1FUTHI5dEFhdlcrVy9iWG9L?=
 =?utf-8?B?bXVWd2N5VkZCbUNoZGlGQ0E5d0NiYkh0NWtHay9MSUUrNklkbFkrNWJpQU5B?=
 =?utf-8?B?ZUQwQzZXSGI3V2JzUnM2cHZZS0dUa2FtM3BaOHY4YVlZTUUvdDNqMXdqVTk5?=
 =?utf-8?Q?ZPBk=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53bbd16a-ac02-4a3b-76e9-08dd9de9841c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2025 13:14:02.5375 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nc6bGZ8Wt162x9Y/Mf4Y2a0i1+j9Q8Y4VhHj47x2izaceUQjTf2NKfq8o3ugqge7dpO5Cf2xu71A7PnK0SGtTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8881
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
Cg0KU3VyZSBQaWVycmUNCg0KR28gYWhlYWQgYW5kIGdldCB0aGVtIG1lcmdlZC4gSSBhbSBhbHNv
IHBsYW5uaW5nIHRvIHVzZSB0aGF0IGluZm9ybWF0aW9uIGluIGRlYnVnZnMgaW1wbGVtZW50YXRp
b24gb2Ygc29tZSBwYXJhbWV0ZXJzIG9mIG91ciBkcml2ZXIgc28gSSBkbyBuZWVkIHRob3NlLiBJ
IHdpbGwgZHJvcCBteSBwYXRjaC4NCg0KUmVnYXJkcw0KU3VuaWwgS2hhdHJpDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBQaWVycmUtRXJpYyBQZWxsb3V4LVByYXllciA8cGll
cnJlLWVyaWNAZGFtc3kubmV0Pg0KU2VudDogV2VkbmVzZGF5LCBNYXkgMjgsIDIwMjUgNjowMyBQ
TQ0KVG86IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+OyBLaGF0
cmksIFN1bmlsIDxTdW5pbC5LaGF0cmlAYW1kLmNvbT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpZ2FsaWEuY29tPjsgZG1p
dHJ5Lm9zaXBlbmtvQGNvbGxhYm9yYS5jb207IFBlbGxvdXgtUHJheWVyLCBQaWVycmUtRXJpYyA8
UGllcnJlLWVyaWMuUGVsbG91eC1wcmF5ZXJAYW1kLmNvbT4NClN1YmplY3Q6IFJlOiBbUEFUQ0hd
IGRybS9kZWJ1Z2ZzOiBhZGQgY2xpZW50LWlkIHRvIHRoZSBkZWJ1Z2ZzIGVudHJ5DQoNCkhpLA0K
DQpUaGlzIHBhdGNoIGxvb2tzIHNpbWlsYXIgdG86DQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAyNS1NYXkvNTA3NjUzLmh0bWwNCg0KVGhhbmtzLA0K
UGllcnJlLUVyaWMNCg0KTGUgMjgvMDUvMjAyNSDDoCAxMzowMCwgQ2hyaXN0aWFuIEvDtm5pZyBh
IMOpY3JpdCA6DQo+IEFkZGluZyBzb21lIHBlb3BsZSB3aG8gd29ya2VkIG9uIHRoZSBjbGllbnQg
bmFtZSBhbmQgY2xpZW50IGlkIGZpZWxkcy4NCj4NCj4gT24gNS8yOC8yNSAwOToyMiwgU3VuaWwg
S2hhdHJpIHdyb3RlOg0KPj4gcGlkIGlzIG5vdCBhbHdheXMgdGhlIHJpZ2h0IGNob2ljZSBmb3Ig
ZmQgdG8gdHJhY2sgdGhlIGNhbGxlciBhbmQNCj4+IGhlbmNlIGFkZGluZyBkcm0gY2xpZW50LWlk
IHRvIHRoZSBwcmludCB3aGljaCBpcyB1bmlxdWUgZm9yIGEgZHJtDQo+PiBjbGllbnQgYW5kIGNh
biBiZSB1c2VkIGJ5IGRyaXZlciBpbiBkZWJ1Z2dpbmcNCj4+DQo+PiBPbmUgb2YgdGhlIHVzZSBp
cyB0byBmdXJ0aGVyIGVuaGFuY2UgZGVidWdnaW5nIGZvciBhbWRncHUgZHJpdmVyDQo+PiBiYXNl
ZCBvbiBjbGllbnQtaWQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU3VuaWwgS2hhdHJpIDxzdW5p
bC5raGF0cmlAYW1kLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVn
ZnMuYyB8IDkgKysrKystLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDQgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZGVidWdmcy5jDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmcy5jIGluZGV4IDZiMjE3
ODg2NGM3ZS4uMmQ0M2JkYTgyODg3DQo+PiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZGVidWdmcy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYw0K
Pj4gQEAgLTc3LDE0ICs3NywxNSBAQCBzdGF0aWMgaW50IGRybV9jbGllbnRzX2luZm8oc3RydWN0
IHNlcV9maWxlICptLCB2b2lkICpkYXRhKQ0KPj4gICAgICBrdWlkX3QgdWlkOw0KPj4NCj4+ICAg
ICAgc2VxX3ByaW50ZihtLA0KPj4gLSAgICAgICAgICAgICAgICIlMjBzICU1cyAlM3MgbWFzdGVy
IGEgJTVzICUxMHMgJSpzXG4iLA0KPj4gKyAgICAgICAgICAgICAgICIlMjBzICU1cyAlM3MgbWFz
dGVyIGEgJTVzICUxMHMgJSpzICU1c1xuIiwNCj4+ICAgICAgICAgICAgICAgICAiY29tbWFuZCIs
DQo+PiAgICAgICAgICAgICAgICAgInRnaWQiLA0KPj4gICAgICAgICAgICAgICAgICJkZXYiLA0K
Pj4gICAgICAgICAgICAgICAgICJ1aWQiLA0KPj4gICAgICAgICAgICAgICAgICJtYWdpYyIsDQo+
PiAgICAgICAgICAgICAgICAgRFJNX0NMSUVOVF9OQU1FX01BWF9MRU4sDQo+PiAtICAgICAgICAg
ICAgICAgIm5hbWUiKTsNCj4+ICsgICAgICAgICAgICAgICAibmFtZSIsDQo+PiArICAgICAgICAg
ICAgICAgImNsaWVudC1pZCIpOw0KPg0KPiBJdCBtaWdodCBtYWtlIHNlbnNlIHRvIHByaW50IHRo
ZSBjbGllbnQgaWQgZmlyc3QgYW5kIHRoZW4gdGhlIG5hbWUuDQo+DQo+IEFwYXJ0IGZyb20gdGhh
dCBsb29rcyBzYW5lIHRvIG1lLg0KPg0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+DQo+Pg0K
Pj4gICAgICAvKiBkZXYtPmZpbGVsaXN0IGlzIHNvcnRlZCB5b3VuZ2VzdCBmaXJzdCwgYnV0IHdl
IHdhbnQgdG8gcHJlc2VudA0KPj4gICAgICAgKiBvbGRlc3QgZmlyc3QgKGkuZS4ga2VybmVsLCBz
ZXJ2ZXJzLCBjbGllbnRzKSwgc28gd2FsayBiYWNrd2FyZHNzLg0KPj4gQEAgLTEwMCw3ICsxMDEs
NyBAQCBzdGF0aWMgaW50IGRybV9jbGllbnRzX2luZm8oc3RydWN0IHNlcV9maWxlICptLCB2b2lk
ICpkYXRhKQ0KPj4gICAgICAgICAgICAgIHBpZCA9IHJjdV9kZXJlZmVyZW5jZShwcml2LT5waWQp
Ow0KPj4gICAgICAgICAgICAgIHRhc2sgPSBwaWRfdGFzayhwaWQsIFBJRFRZUEVfVEdJRCk7DQo+
PiAgICAgICAgICAgICAgdWlkID0gdGFzayA/IF9fdGFza19jcmVkKHRhc2spLT5ldWlkIDogR0xP
QkFMX1JPT1RfVUlEOw0KPj4gLSAgICAgICAgICAgIHNlcV9wcmludGYobSwgIiUyMHMgJTVkICUz
ZCAgICVjICAgICVjICU1ZCAlMTB1ICUqc1xuIiwNCj4+ICsgICAgICAgICAgICBzZXFfcHJpbnRm
KG0sICIlMjBzICU1ZCAlM2QgICAlYyAgICAlYyAlNWQgJTEwdSAlKnMgJTVsbHVcbiIsDQo+PiAg
ICAgICAgICAgICAgICAgICAgICAgICB0YXNrID8gdGFzay0+Y29tbSA6ICI8dW5rbm93bj4iLA0K
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgcGlkX3ZucihwaWQpLA0KPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgcHJpdi0+bWlub3ItPmluZGV4LA0KPj4gQEAgLTEwOSw3ICsxMTAsNyBAQCBz
dGF0aWMgaW50IGRybV9jbGllbnRzX2luZm8oc3RydWN0IHNlcV9maWxlICptLCB2b2lkICpkYXRh
KQ0KPj4gICAgICAgICAgICAgICAgICAgICAgICAgZnJvbV9rdWlkX211bmdlZChzZXFfdXNlcl9u
cyhtKSwgdWlkKSwNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgIHByaXYtPm1hZ2ljLA0KPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgRFJNX0NMSUVOVF9OQU1FX01BWF9MRU4sDQo+PiAtICAg
ICAgICAgICAgICAgICAgICAgICBwcml2LT5jbGllbnRfbmFtZSA/IHByaXYtPmNsaWVudF9uYW1l
IDogIjx1bnNldD4iKTsNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHByaXYtPmNsaWVudF9u
YW1lID8gcHJpdi0+Y2xpZW50X25hbWUgOiAiPHVuc2V0PiIsDQo+PiArcHJpdi0+Y2xpZW50X2lk
KTsNCj4+ICAgICAgICAgICAgICByY3VfcmVhZF91bmxvY2soKTsNCj4+ICAgICAgICAgICAgICBt
dXRleF91bmxvY2soJnByaXYtPmNsaWVudF9uYW1lX2xvY2spOw0KPj4gICAgICB9DQo=

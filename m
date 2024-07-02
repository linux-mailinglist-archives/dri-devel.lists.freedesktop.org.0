Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A2A924A2D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB9B10E364;
	Tue,  2 Jul 2024 21:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WRTML3DT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9257710E364;
 Tue,  2 Jul 2024 21:54:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BrtN3hVZAvaOec1tPLtRDZFObb6AOdtHKiSNH9bSaTw2xCfzT7h9bq9sstfvmHqsY5Cmasj8jVsFXfFf7WVEpOb2XaPMrcvUNBVRcBKcKzpxm505uvpyw4GINUGFYvmJx5C0DVkeXCf/NzRRj06rpZZevhZhQj0szmRCnHJI+n2NtdPYWDhgvlxPhFxZZB+MR7jQwrEaPmUKSxojX7U5ye8zkRclX+Lmrkdx5/q5X7e7UKHQCXuj/DH+eENMiLZr3jLMaNrG078smjhuohg1VlY83Ji73gjH0jzqdb4Mcq6jSN+hykeei0rlnurPUQ3wObIqjOdmnjuzm9+w0eMRCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vL4uu0hn+fCGj4QOBOkwCUpTvbEhwB6GJBVkurkXX5E=;
 b=a//oD4AUVHF75R6uSH+R0xzmxCdNj829JW4oKAjLOJDw6S8YVmRWAttgwh0txYAr9qwKvPkxz4sZjbxCQOgbqce+FhitRieE1EIQ6YujDaA4kiegeDVmrIJrK0wgqUBrURzY6aj054v9b3/VvIKYUkvHqQhiSUgY4/0qMopWE9mwd0Wl1pvn/HDtkMJHwIUczRKJ+yIubx3frZI8b4TOto+QZ1nDw3pxEEBNdfkVEGWyaN3u9S2gvmKIceEGgcZJ6UEXfRewK2E3M2eDwreghw6lhOBry3y2wQGRo3FaLUJfqDkJkFDTGNXAfqrO+F/VimKvxUWotJYPdNt7fU1JiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vL4uu0hn+fCGj4QOBOkwCUpTvbEhwB6GJBVkurkXX5E=;
 b=WRTML3DTgQAz+GiGi0evEnxlgTDzhlANNNdme+IVdo+ViNEIo4I62tR+Hz1cO2Nule3JLGDzhlQzWtkjcr6WTxy/hJXdz5N8I13MpAZx0hIFSdD2Zjd20e+N3/3fizF9cZadHcd5rdcYv/HbC9bVaDNOOCTFtr10UKrJnFa9tB4=
Received: from DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) by
 IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 21:54:28 +0000
Received: from DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::6f01:2f45:71e4:653d]) by DS7PR12MB5933.namprd12.prod.outlook.com
 ([fe80::6f01:2f45:71e4:653d%6]) with mapi id 15.20.7719.029; Tue, 2 Jul 2024
 21:54:28 +0000
From: "Bhardwaj, Rajneesh" <Rajneesh.Bhardwaj@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: RE: [PATCH 2/2] drm/ttm: Make ttm shrinkers NUMA aware
Thread-Topic: [PATCH 2/2] drm/ttm: Make ttm shrinkers NUMA aware
Thread-Index: AQHazKWdM93lT5lm4ke3QLRxg2z28bHjv5yAgAABS4CAADVn8A==
Date: Tue, 2 Jul 2024 21:54:28 +0000
Message-ID: <DS7PR12MB59332621FF50996A88C3F84EFEDC2@DS7PR12MB5933.namprd12.prod.outlook.com>
References: <20240702173048.2286044-1-rajneesh.bhardwaj@amd.com>
 <20240702173048.2286044-2-rajneesh.bhardwaj@amd.com>
 <CADnq5_MU-j1sBYn-7dzvEKF73VBc=bcYOYY0AcbPjrJnKB24Zg@mail.gmail.com>
 <efc11b48-ccc1-4bdf-9585-a66edfa6307e@amd.com>
In-Reply-To: <efc11b48-ccc1-4bdf-9585-a66edfa6307e@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ActionId=f3eb626a-9ade-4968-8dab-97088bf43b4a;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=true;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution Only;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2024-07-02T21:35:46Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR12MB5933:EE_|IA1PR12MB6067:EE_
x-ms-office365-filtering-correlation-id: c410027b-86e1-4204-5753-08dc9ae18bfa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?OVhjdExudElKQ2pkZ2pDb1h1K0dYQkpVQWM2eWpZeU1NKzNMMWZuZG1ZWFlm?=
 =?utf-8?B?elczbXd0VC96c0NwOEc1VkMrb1YvaHE5V3N5YUNNUVhZQ09XN21FeGkrM3kr?=
 =?utf-8?B?Y2xWeGl0SXhGeS83M2VpR29oNTAySzhhYXVlYjZPVEFPbGhYK2NTM2lGNS90?=
 =?utf-8?B?dGNuOXpVTGJMZW96MVUyUTRUMWNNc29EOW0zaHp6VVgzL2ZxV0NsWVF5Tkl0?=
 =?utf-8?B?aFV4d1FjK3FxNkpnazRvM2tHUy91WGhaK2lsU0EzYlVUMW53RTd3ZmNreEJR?=
 =?utf-8?B?VVVKMXMwaVowa1orWExYdzZGZmFmb1o4d3g0K1IzTE9ybGNyRHBFN3NQMHdz?=
 =?utf-8?B?S1lSSnN5V1N6cUROUHlLS1gxdWVoWHlHVmQ0R29VMUNHK0liTU5Obis4eGt4?=
 =?utf-8?B?b0E3OWIxdTVqMHhGNStMelFaL2ZPZU5SNVdSZUt1dFVuZXp0MmF2c3B6bWpY?=
 =?utf-8?B?RS9Vd3ZGUmJoeTQxdlpDYlRnb3JCd3dHSi81YXQ0bmxiMzhHOEd2Zkg3cENN?=
 =?utf-8?B?cmJJZEpMVVlmcHdQRUM3L1Y5SXd5cXpvTmZsRjBCemI1U1l2ZlRCRGs1bkRC?=
 =?utf-8?B?eXNkQXUwYThRTzBFczQ5Z1lxUWhMcXFSaUE0Nm9IUldBVCtLeEVieGlicXo5?=
 =?utf-8?B?TGZtTTZQL05OUXVFeSsvSGhxd3IyZUJSMk12aHg2RG94UHRwUVcvam01NWNk?=
 =?utf-8?B?OTBjOHlYOFA1R3RCczh2RElTVkd2R0FkU0JrZGR0VTFsdnlDWGo5MFp2RSs5?=
 =?utf-8?B?RWpZUXJqSGcxRDhEWGpvMGwyQzd3R3ZSQk9VM0JLZVVaZW5TMmJrbWlJK1Nr?=
 =?utf-8?B?NjU3dGVPQVhYU3RwcjVxb2QrcXpPQ1ZSb1VEUWVLK0xGRlR2UGZyY2dTQ1dr?=
 =?utf-8?B?ZDB0VmlmK3N2RnJ4NkwydHNLV2JxMWZRUGhIcHZNbklnbVFtWW9WUmlzUDha?=
 =?utf-8?B?bHAvb0phRUFHWnJpL2N5bjZWS0ZuTXNCckEwL0RWR2laR1lDeTJNeUhCNXVw?=
 =?utf-8?B?a1VNVHByQkUrT25CK1pVY3JiSFl6T1JtZGpKemtGYTB2OUV3ejNJcUcrRlhT?=
 =?utf-8?B?ZXVPdUJPVGcwVU96aEZrWll5bUxORVIzRXlSSWpyWEV4NXVzeEY5RE5xbVZw?=
 =?utf-8?B?OWFzck5xTGd6NXd3SVliaVNkMG84RFVuZTJ1NnVTY3NVSU5IOVBuTTUxZnNi?=
 =?utf-8?B?STZ5Ny9kQmpUeXdmMnNzNTN2ZFp5MzZiVGlBNnBuSW5mUnlJSlluRUVnU1hU?=
 =?utf-8?B?VEg1SUVHZ2x1ZlA3VUx5czhGVU9NdmxLWXUrZGxlRFh4L3RITEhISlFEeVVw?=
 =?utf-8?B?RmRIL0p6ZWhlMUZBL1lZdEtPaVVEQUg0L1pBbUhCMjExWmdDV2lESWpFOWtr?=
 =?utf-8?B?TnNXclUwWmdwcER5Yk1jc0hmUHlaS204cTRodUFocWFjR2syam1ySksrMUNB?=
 =?utf-8?B?MEhtOEV6cmlyVzJiTWpHa2FhRUgvb2JsWmZHUzRnNjNIM1ZCQU5wSWRuZUln?=
 =?utf-8?B?eHhiK1krQjBhYkpiaVpXOXNjZXYyc2dKWEFySHd5S1hqdTFmcDc2ZGhoWTQ4?=
 =?utf-8?B?LzVMeHF2YVV3QmpYRytid0ZtaUd4cVlKMS9nQnpwbmRyUmlsRzFJay9USHFI?=
 =?utf-8?B?a2NmQlJTZXBncHp6RStzNzcveWdzbllXS2ZqS0RBKzdBUVNiank1L2VuSDNa?=
 =?utf-8?B?RlBQYXY1cklGSFYvQnRMZUpsQWkvbUs3VjgwZDF3bWl0dmV2THB1S0tkRFFQ?=
 =?utf-8?B?a0VmY05PeDE0emNWMmtESlJGL2tSb3NDZGNUell5N2lmOU43VisrYXNRNlJL?=
 =?utf-8?B?UE9CYldFZHJYdlZ0Vm5UTUFnR2tDZ2F2SU1BOUR2ZXU0ZHc2L0M3WGQza0cw?=
 =?utf-8?B?MllDeUhaOVJvTmozdUloenZFb0FER25RRDFHYm5jZCtpK0E9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB5933.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2FhczVibzZ5NGx2VEtBT1RhMUs4WFp0Y0IwLysxZzMvai9EWVp3Ym1zMStH?=
 =?utf-8?B?SWUxUGc0aTZIdFYvVzh3d0JsdW5tbVVJVDBRUW85ZFJIbkloTmoxdlVkMkpq?=
 =?utf-8?B?V0NLTml1cFdheWltMmRmM3lCTjdXRW0zUzN1Ujc5WlQzNlltbFRDQ0lBT2hw?=
 =?utf-8?B?enVVZzkvdlMxUU44WEh0VHN2amhRREJobGdJWVl2RXNhNXRYcXh4UmlUQ25Y?=
 =?utf-8?B?a1E2T0hRc2pxL08wbko5S0xzU1BKNFFsNmhicWNNdGFVQzBYeXR2WjBsVmls?=
 =?utf-8?B?N0tJQlV0K3puVWN0REN3WkFRQUNiTGRtRTE3eklKZDdvSjBsNDEwanJFeEt3?=
 =?utf-8?B?ZGR5dmV0anprc0FoQWt3djlIU3Vkc1BPeHU4SzZBc3lWRGhvWmZILzdOOUFn?=
 =?utf-8?B?NE50UXB3cVVKZXlPQzJPdmdMRmpnYVEwY1NSRFU0Y2VjbGN2TDNFT3NERkht?=
 =?utf-8?B?VE0wb21rQjYzVkxENWJPMmtCNC9KTmovZjhHbEpvZlQ4Mm5hZkFQdXEwck44?=
 =?utf-8?B?SGNZdHJWMFk0a045RkhyRG1Bc0dFSENBMytReHAraE8yendCamNlbUE2TytU?=
 =?utf-8?B?VDBxUldXU1Z1cnphc3dEUE9sOVJSOHJiUXYzRVJTN1dOcThaT21NM1ZKWk1u?=
 =?utf-8?B?MzBxY1kzdzZlTWw3N1ZiY1lNRVBvTFNEUjU4NWNrWERMbUVQUXo2S1ByMmps?=
 =?utf-8?B?YmhMUGpxU3gyYVppaUJqV2tKTzdWOTJrbyt4WWpGQTVsbk83Zlp4aXk0VEpl?=
 =?utf-8?B?T0xsVzE0RFBHVjY5MjZnSXVLbnc0dW5EWVVHZUJSSHFMZGlaMmdvak5rRFYy?=
 =?utf-8?B?ZkJzRjkrMVR1VkxtWlhrWDlXeUhzbG91OG94T3kyYnBTZU1mNExMSDB2VmN5?=
 =?utf-8?B?VnA4Z08yelRHL1ZsdnNsYTljTCtlMFRqTE45Skk2UjJUVmFvYUJYRWM2NkRM?=
 =?utf-8?B?M0RJamIrR2JUeDZSN0dPM0dEaHBCSEFjSG1ybVVvZVdnU2hpUkRkRFM2MGJI?=
 =?utf-8?B?U3RqV1BPdXdQQURWQTJheDlxUlJkTjIrQ3AvaDl3UEdhZThGNCtZMm9nOFRW?=
 =?utf-8?B?R1p2OGIzSWtuZGNiVkcrOFRQZ0xqY0FKT0JRUGNjY3dhWlVmamhYaWc0ajNj?=
 =?utf-8?B?SHI5TlJOMXRhQjNpUjlUbFh2OWJ4RUxBUUo5dkRxaFR1cm9Ha3dLWXhHS0sz?=
 =?utf-8?B?ZHBiWXdPVnhwU1AzdlNSbUxkY0pLZnMyT2hjWS96SDNPOHJwQjlLd2RZUmhn?=
 =?utf-8?B?TXd6c25PNjZVcGZ6Yk1uRUdkVFNVY2tVMVVYTFlISE1kQ0FsaW5VTzBmZEhV?=
 =?utf-8?B?aWFHbTFyZVFrOXpuUTdxT3lid01zVThUbWpWcUZvaGhlQTQyL0xXUnFpRTBo?=
 =?utf-8?B?MTVvcmpsRVJBMmsvTzZSbEFIbkd2cTlYUW5YbXNjVllrMUY4REhDR0FMT1lJ?=
 =?utf-8?B?MFJLS1VlZEowVE5SUU5TNmJQbDJpWHZ4UWFKcVlxWnBpREdEZXlhUFcrTkM0?=
 =?utf-8?B?bWRzQnpsOUd0OXliL1dvVnhDc21KMEJieEs1ZnFwdU0yOXhnM0lKc3JBeTZy?=
 =?utf-8?B?K2Z0QVY4Y0FVSVVyWjZBOTMrQ3NDUUNZblM2d0ZBUFB0em9IY1B2WFMwTzNP?=
 =?utf-8?B?aUVjQ3czL2YxV2hRRDFvNVFGY1Nyb0NlakFDR0hHKzh2b2krZjJZK3hwZFA0?=
 =?utf-8?B?RzBCL3M5b0thdGtyeVlzdnl4R1dxMnl5R3hSSVpVVllsRVVJdzY1VFdDQ3FR?=
 =?utf-8?B?YmxJY2pYdHAzbjhvaHZTWXFWaFJ3aFRZV0h0REduWFpTNk5KUElUTE5kVmY2?=
 =?utf-8?B?UUxCVGtia3JLQThOT1FSbzJtTDBTNGNUWUVKdmtNQTdibFo5cyt0Z1d4UXlO?=
 =?utf-8?B?bVUzMm83enJxQ2dkeU8rT1RSMUZCRk9JRXRrcmN2R0IxazZUNkNrdXErYVV0?=
 =?utf-8?B?aXMyVUExSjRVaHB2M3RIUEtYdnErdGxkZTZlc1Z6UlVmK2VuN245eEFESWZw?=
 =?utf-8?B?bUQ0RmxnNU9rSzJBWXR4SFpIN0pyN1NKUnh3bElYWUFXVWRXdG0zd052UUtu?=
 =?utf-8?B?U21QSWRtMjd2TlVDK1RYYThJQWVKWU15K242NXg3NkNTVmtMVUxkU1FxRWV1?=
 =?utf-8?Q?lqXo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB5933.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c410027b-86e1-4204-5753-08dc9ae18bfa
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2024 21:54:28.3084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q+NdTOQ6tHJ2ITAAn9SaUmFKA/1APSWxdI5kbTlbcPsGx7nQv2omczusLYSDu+6X9KjolcShb0ipYE5xDUCsTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067
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
aHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQpTZW50OiBUdWVzZGF5LCBKdWx5IDIsIDIwMjQgMjoy
NSBQTQ0KVG86IEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPjsgQmhhcmR3YWos
IFJham5lZXNoIDxSYWpuZWVzaC5CaGFyZHdhakBhbWQuY29tPjsgTWFsaW5nIGxpc3QgLSBEUkkg
ZGV2ZWxvcGVycyA8ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4NCkNjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgS3VlaGxpbmcsIEZlbGl4IDxGZWxpeC5LdWVobGluZ0Bh
bWQuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0K
U3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGRybS90dG06IE1ha2UgdHRtIHNocmlua2VycyBOVU1B
IGF3YXJlDQoNCg0KDQpBbSAwMi4wNy4yNCB1bSAyMDoyMCBzY2hyaWViIEFsZXggRGV1Y2hlcjoN
Cj4gKyBkcmktZGV2ZWwNCj4NCj4gT24gVHVlLCBKdWwgMiwgMjAyNCBhdCAxOjQw4oCvUE0gUmFq
bmVlc2ggQmhhcmR3YWoNCj4gPHJham5lZXNoLmJoYXJkd2FqQGFtZC5jb20+IHdyb3RlOg0KPj4g
T3RoZXJ3aXNlIHRoZSBuaWQgaXMgYWx3YXlzIHBhc3NlZCBhcyAwIGR1cmluZyBtZW1vcnkgcmVj
bGFpbSBzbyBtYWtlDQo+PiBUVE0gc2hyaW5rZXJzIE5VTUEgYXdhcmUuDQo+Pg0KPj4gU2lnbmVk
LW9mZi1ieTogUmFqbmVlc2ggQmhhcmR3YWogPHJham5lZXNoLmJoYXJkd2FqQGFtZC5jb20+DQo+
PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jIHwgMiArLQ0KPj4gICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jDQo+PiBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX3Bvb2wuYyBpbmRleCBjYzI3ZDVjN2FmZTguLmY5M2FjOTA4OWE2MA0KPj4g
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wb29sLmMNCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYw0KPj4gQEAgLTgxMiw3ICs4MTIsNyBAQCBp
bnQgdHRtX3Bvb2xfbWdyX2luaXQodW5zaWduZWQgbG9uZyBudW1fcGFnZXMpDQo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICZ0dG1fcG9vbF9kZWJ1Z2ZzX3Nocmlua19mb3BzKTsNCj4+
ICAgI2VuZGlmDQo+Pg0KPj4gLSAgICAgICBtbV9zaHJpbmtlciA9IHNocmlua2VyX2FsbG9jKDAs
ICJkcm0tdHRtX3Bvb2wiKTsNCj4+ICsgICAgICAgbW1fc2hyaW5rZXIgPSBzaHJpbmtlcl9hbGxv
YyhTSFJJTktFUl9OVU1BX0FXQVJFLA0KPj4gKyAiZHJtLXR0bV9wb29sIik7DQoNCllvdSBhbHNv
IG5lZWQgdG8gbWFrZSB0dG1fcG9vbF9zaHJpbmsoKSBhY3R1YWxseSB1c2UgdGhlIG5pZC4NCg0K
WWVhaCwgRGlkIHlvdSBtZWFuIHNldHRpbmcgdGhlIG5pZCBvZiB0aGUgc2hyaW5rZXIgY29udHJv
bCBzdHJ1Y3R1cmUgZnJvbSBzb21ldGhpbmcgbGlrZSB0dG1fZ2xvYmFsX2luaXQoKSAtcGFzc2Vz
IE5VTUEgbm9kZSBpZCBkZXZfdG9fbm9kZShkZXYpIHRvIHR0bV9wb29sX21ncl9pbml0IGFuZCB1
c2UgaXQgdG8gc2V0IHRoZSBtbV9zaHJpbmtlci0+c2MubmlkID8NCg0KSnVzdCBzZXR0aW5nIHRo
ZSBmbGFnIHdvbid0IHJlYWxseSBoZWxwIHVzLg0KDQpSZWdhcmRzLA0KQ2hyaXN0aWFuLg0KDQo+
PiAgICAgICAgICBpZiAoIW1tX3Nocmlua2VyKQ0KPj4gICAgICAgICAgICAgICAgICByZXR1cm4g
LUVOT01FTTsNCj4+DQo+PiAtLQ0KPj4gMi4zNC4xDQo+Pg0KDQo=

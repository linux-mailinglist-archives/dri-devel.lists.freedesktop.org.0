Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E9991A227
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 11:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D3F89906;
	Thu, 27 Jun 2024 09:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dDoWJtqV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B06189906;
 Thu, 27 Jun 2024 09:04:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IRepLz4KjZMeRrdwOMJ2aIHYkBf1hLaaVaSXrWpHxaDTH8/L60y+JCFgHPSgUlPgxfMTrQTW+ri9OJEl1TwVaF3ZwnPc/fCa5OnZMvTbOBXF55PvF01GzBsIiqKdM6V3EpDaJzraSTRJtCcpJsRw7VkshSla0DRKkaGuat5j1MK8Rb4dYQI3wGa0pw4ZwQ4lPnR4yY+Sl+N851+IEAy8b2X8PdP54TO53RealTKLeQcTbSflptKFwfDJjICKzrHJo5hkgbP0Y037a8xAdjxvV5xVHKetdOdN2pSWwnFcSOyWBuKnXo//yEMUwEmzVoFOjyy02IfaCEqeGhYNgLfFSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ck47NwpVxWh3pplpnppZIMyDWfJwDp8f/QNwbwFa4lg=;
 b=VG0UGBE5HkoVv6XNj2C3Ol5I+xsDRe5OR/uhc01sqw1UW2Tznlo0fgYSNk9qDU7JY+Ddc/UWCoV0vtc3DY7X+P4amMgnKVhh4lF2bZXN6bPe02RUB4tumUqXp0QoLqnOCHLLqhhNUsogxlP5sAKQ4MpKamZhaCzCB2ml3mqNPDGKTuMemC55s/fu6JEnVjGdC+Pdil7sqxJ8ZGVHvs70yh1OxRGeR7ZKq4fJspvvUZUPi9RtedZ9vw7omddEGzFbPPhTCsbMDuz5HwuWTVXlK571drc9I6DtXyMUOApoG5WDLzAOzSBJazfNw3dPl5f8/EeAUz588QX5SBjvH8ttkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ck47NwpVxWh3pplpnppZIMyDWfJwDp8f/QNwbwFa4lg=;
 b=dDoWJtqVz30XxYk01kUXEIBtK3gy1tAZzui21qCqq7nuVse1DTNbodY2p7d0VUv1h+n1YCQzyh5oELk6Jkqj9h1QrSnwJmwg0+tTAHUTcz5sIXq2bF/a0UlDZTea4LECybA30FdHPlx3NdkIEFBR1EcUuw+qwUMXVRWOCNT65kc=
Received: from CO6PR12MB5489.namprd12.prod.outlook.com (2603:10b6:303:139::18)
 by PH0PR12MB7486.namprd12.prod.outlook.com (2603:10b6:510:1e9::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Thu, 27 Jun
 2024 09:04:27 +0000
Received: from CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282]) by CO6PR12MB5489.namprd12.prod.outlook.com
 ([fe80::5f4:a2a9:3d28:3282%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 09:04:27 +0000
From: "Lin, Wayne" <Wayne.Lin@amd.com>
To: Lyude Paul <lyude@redhat.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "jani.nikula@intel.com" <jani.nikula@intel.com>, "imre.deak@intel.com"
 <imre.deak@intel.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH 2/3] drm/dp_mst: Skip CSN if topology probing is not done
 yet
Thread-Topic: [PATCH 2/3] drm/dp_mst: Skip CSN if topology probing is not done
 yet
Thread-Index: AQHax6XEXOzpmMdGQUyjQvrOMBiDabHaOjoAgAEUSnA=
Date: Thu, 27 Jun 2024 09:04:27 +0000
Message-ID: <CO6PR12MB5489CB4E5CFB71CF8E812BEEFCD72@CO6PR12MB5489.namprd12.prod.outlook.com>
References: <20240626084825.878565-1-Wayne.Lin@amd.com>
 <20240626084825.878565-3-Wayne.Lin@amd.com>
 <7da3ccf156a858c1a7d2691fbedfa7aa2ceccdf7.camel@redhat.com>
In-Reply-To: <7da3ccf156a858c1a7d2691fbedfa7aa2ceccdf7.camel@redhat.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=5d59b469-55c2-47e2-a6cf-6806448f07c8;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-06-27T08:50:05Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR12MB5489:EE_|PH0PR12MB7486:EE_
x-ms-office365-filtering-correlation-id: 8ce8c7e2-e9a6-4808-3cb8-08dc96882609
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?M21PekpnVFBPQmtzaFl4enB0cEdqZVRHTWdKeTB4aUdzNktNaElTdTNneW9R?=
 =?utf-8?B?RkJhaTNtajRhWldOeHdzdHNKL0QxU3lWNUh2cldhWU5iQjFOMUNFWW0vOFdQ?=
 =?utf-8?B?UThxeDVDRU11TUpZMmxTMVRwYk1tYWdLTitkeHM4SWROaWRIZTVzeWFaWXFQ?=
 =?utf-8?B?N2dqRWQ0RDVXQTF1cjBjdnBrVm1EeS95bXZVdWkzQUJJZzJWNStKQ3B3ZnJV?=
 =?utf-8?B?ejVnY1R0a1NzL200Nis3VGc2U21XdzJISndTakUyRGpHdzB1RG5UYnEvSHZl?=
 =?utf-8?B?dmpsVXRZdXZkN0RwdHpEL0RWMkxPdHl1MlFuWFIvbzVkK0VWckFYdDY4dExx?=
 =?utf-8?B?MG5nMzZvVEZpV29CK1J6SldBc0ZFM1JnaUdLQmVrNEhJNkd4N20xWUYyMnJC?=
 =?utf-8?B?cm5SdlhGaGRFV1VUbnBtUWVUSDVVL2dlazFMVExSSDZSbVFjc2hERnFBSUVh?=
 =?utf-8?B?RlpwM1Q0dUtiUmJiUjlNNWhIRTZjcEh5WUNobFlUQmxncHVaZ0xGRFZMVE9v?=
 =?utf-8?B?L2Z3YTRsdGVaMGd4cFhLcXRsWmNrM3hqcDBvN3RDTFZOMnYvL2FhbWMzbmpp?=
 =?utf-8?B?ejFKK1hVaTY0M2dIOGFPWEVSZUNDbno0Sld2VDZ5NW1SUWszYUxjaXg0TkFu?=
 =?utf-8?B?MzF3bVVWWGxlVWJHWEpFZUR4a25vcEJrRGV6NlloMVB0NVZ1RU1PV3BXUjcy?=
 =?utf-8?B?T1Jwbk1NK1BLV0huNnVoMmtDUXkwSjhJc2dPSG1MY2VHcXJhSkJGb0hMTmsv?=
 =?utf-8?B?ZDdOWHZKeFkxWE0xeGNjazlxeUVmSGROY3luYXJ5MWFOWXRkUm5wQ3M3UU44?=
 =?utf-8?B?Q29OaFhIdTlzNDBjYmtCaVZrMzR2RGRuV3Q3ZW5kdi9nMTljeTJsRm12ZS85?=
 =?utf-8?B?Z1ZncHRRTmEyMEtrVmsxbGlnVWwzWkJydVpzUERsTjRkVEhnMURrTFppWkJz?=
 =?utf-8?B?QXA4SUJrVDc1TDR6TW5wa3ljQlNVb2QxOVJuYTBwN3BTOSs4akdadXA1UDlL?=
 =?utf-8?B?Tmt1Y3JhN3RhMjd3NytvSERnM1RGMytKbFdmT1dUUk1qVUxVYTU2dXFBN2JH?=
 =?utf-8?B?VzhLVjZWU2YzYis2dytFc0QyR09FTWQwcFVib0lDNVBTTzcwQjRDNXVFTVFM?=
 =?utf-8?B?ZWgvQzJoVEN1eFV6T1N3Wlp2cTVROWRiTzlDV2dwbHg5Q2x4RndFbnFTQTFv?=
 =?utf-8?B?MDREZWxKc3lRRWQ5YlRmZjZ4c24xcGc0UEFhOU5xRVFPV0xPKzVLSjdLZmMz?=
 =?utf-8?B?TXQzVmt4K3FiZDBtVjRQamJXRDBBUlAxN1cwT2N1WGNRUnFEdzdXUzBwQ3VM?=
 =?utf-8?B?NW5nTGt2anNRYXl3V0o1ZjFUQVpsc1lOMWJ3dUx5Vk5HWEt6L1JUTi9BSlcy?=
 =?utf-8?B?czJsV05NYzV2ZWR5ZWFKMmdTT0pzM1hBRkxtVkF2ZVVBN2R3NW83eG9wdUxn?=
 =?utf-8?B?QWVSZkRGRVljMDNRREk0MkVVdlhkN1VYRXRSNS9kMUZKNk1yVjZ3MkJmenVp?=
 =?utf-8?B?MnpOUUNSalFaTW5TRjd1WDhTUTVRNlNVQ2QyUEhLTlpsSm9YQVd6U3B5NlYy?=
 =?utf-8?B?di9GVkhQUWY5Zk45U2duZ0FyamhJS1VqSG9tSHZIK1ozMnI2cnZRQWRsV3VN?=
 =?utf-8?B?M0JhYTJuOTNrRlFuM0IreHVZaDBOeEVvcGpJZ0lFUFA2ODBGaVIrS3A3RlZa?=
 =?utf-8?B?S1lkRkNnTkN4Sjlqai95L0VRYktYeUpHN0tzL3dNVWtCOEMyREgrSmlGU09T?=
 =?utf-8?B?bFpUZ1JaUjFmVVZDbHB5OElLN01ITzZmakJBRHhaVUNhVFJhV0NXa3FCR2hL?=
 =?utf-8?B?N2xyL0ZSeHVaWWZxSHl5Tm9GYWVKZmpnZW56Q2Z5ZGNwZlBrMFVOVkZ4eGRt?=
 =?utf-8?B?MHhmdTA1RUVCVFVJbjJ4TmxsRE5TLzB6YXdQazUwc0YzRXc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5489.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TU9qcU5qZVlvenpYaVFWcjFNVWhodVZPZVNKRFlsN1ZPbXN0TEJtQkM3aEpZ?=
 =?utf-8?B?SVZwdGdDNE1xa2dndlo4amdxenpIOHVXelJJazBXUUhFM09lbWcxYmVpSjY3?=
 =?utf-8?B?K1hZK0VuZDJ2MTFzOE9SdkdkcEtwcGJHdjduUDdlZjhhS2ZXVjZlbytQQTAr?=
 =?utf-8?B?SmFzUzVMZG80UGloV1JPNnJnNm1wdUIrdFpMc0d6OUlrQUdzMENJTDRoNWtK?=
 =?utf-8?B?NVJhTXlqNm9LdzVrUkQ5WVZPNFFYNnUxU1I2aXRvUEtWMlJMclBzMDM2aXJy?=
 =?utf-8?B?ZUpCSDdvcXZqZVF0OUN3b1plTCs0b1JBMjRUNFFpUlBOM3VLbnJDSlJGenhS?=
 =?utf-8?B?bGVocnJKVyttY2d4Y1dya3MwZXlydi8xd21adkQvTHBpSVJBSW5LcXplcDNr?=
 =?utf-8?B?TmFlRDUvM1daRStxcG1MMG9lalRSdGhnZ3dUN3JVYVhzZVppb0FBYW5xZlky?=
 =?utf-8?B?b3BxbStSQTFob1d6N2RmTXV1TjNhSGx0RzE1T0poT0djcHZNQlpua2FheGE5?=
 =?utf-8?B?ZkdXZGxpMU5ZWTFpY0sreGxLZzJvQlcyTFNMbllsbkpoSXRjZ3JiR1l4R0U4?=
 =?utf-8?B?N2p0UGpuVnozYmRUM0Z5UkpkbU1sdnY2ZlVDd3pIMmpOakNXU1cvQndDSzFu?=
 =?utf-8?B?NDYycFVERlIva2lETU8wOTJ4bUxQc2xHTXRtcUxKZFUxbm9OS3RFZk1ocFNv?=
 =?utf-8?B?OUVkeVd1UmZuejJiT0ZpQWRlaXJjNjdVSXJ0VTFlMTFjWmJPYy8yaWNDblRx?=
 =?utf-8?B?aU00cTZpV1l0N2txU0lZZmJQd0hTQTJnQk40S3FsL0o3c093N0JRRmtRMXhp?=
 =?utf-8?B?RVhMNG5ZL0tHcE5ubnR2TnZWejAyZGY4MnU2TVhldStjR0d4eWc5Qk9jVlZu?=
 =?utf-8?B?eXUzSWNTbC94WDJnMkJuZlRFUk1zaXF2dk1uanNJdHNmTlVLZUpUNHN1MzhY?=
 =?utf-8?B?cDU5THNpRHBMOTYrQnhFQ290V0VVNFh3eXpzalp1UVI3M1JNby9KcFZrWWVr?=
 =?utf-8?B?aC9JQmVEQzRxaTBrVzRGTUgzRjUrTWlIaEh0N1lRVS93M3dzeFZqY2t0R05v?=
 =?utf-8?B?Vjl6Y2QyWXFYeDNENDRuYWFSNEZtbnhvd2xKUjErb0REZENsS3hoVWJ4M3Qv?=
 =?utf-8?B?cW5zZnFObGp6RHZxRUxjSFVORHZNdnI2bWFRMGV3Ui9OZ0JCWEl6RzBNNUdH?=
 =?utf-8?B?N2EzRk1jVUpaVnJ3Z2lteTMxM3M2WlZCR0tEK2hFMHk0YTN4dGR4U1JjZk9r?=
 =?utf-8?B?YjZ2ODYzdEtXZldKeXBHTkQwMDlJaUxRZndHZDJreXFMNURhMjRBdVlLckNx?=
 =?utf-8?B?RDRYSkNJWFRkL0o4dHltaTgyS0VodEVlZUc0U1EyVVZ3RWRDcGZZS1J2VDZr?=
 =?utf-8?B?T05oQXdYVDdWNkE0MExXZm9qTWszRjQxdlNoTkFybVBsSDZTei9Xd3BVUHVt?=
 =?utf-8?B?bWNiMmdrSWRKMEJyZmRnZkNjUmIvS2RlSG9raER3TmFONzE2V1FnUktpbTlh?=
 =?utf-8?B?ZVJpVW1HSWpEUFQyK2dGNHlhUVhmZDFla1pDVkdRcnZDb1hva2JNQlR5RG9a?=
 =?utf-8?B?VkRac1dWRjRVVVFpMU0xWXgrM3pOR1FUM1hiMDF3RGMwQldNSVpxQktuOXlV?=
 =?utf-8?B?ZklNUjNOL1FqZ3ZxRGhXandDNnBNR3dlcXU5bmJqNEtsMm01MjBYbjNLSlVn?=
 =?utf-8?B?Y09GOHluY01ULzRES2F2S29nVjhYeXhhVVc5ci9jTDFRS1VhQ2xYS2hKMDRH?=
 =?utf-8?B?U2grQlVCc25KTWpKclhkY0MwMFBsMFRYRy8rR0ZlcytQTW41ODFGdjhkc214?=
 =?utf-8?B?US84SWM4M3JDVE1DTGx2QWJ5Y2VKcE1uN3k0N29SVmdjUkVleWtxVEVLQlFB?=
 =?utf-8?B?Y2U1cElkSDNTdHhuMjgvSkw3QVR0SERqMnZYVHA5SHNGbHptUGdpRkNmeVZp?=
 =?utf-8?B?bTIvOEQwYS9WK0Rna0RyaEZEa0tleFB5ekwzbnlLRFowZHJDcmpRUDFab25O?=
 =?utf-8?B?SEprYTFaMmMrUDNHeHJRRlk1anVsOUx6R0NDbXNEeVA5VEdYeEd3bWRONmxm?=
 =?utf-8?B?Si9sZTVrSXljclN2V29FZ2hkc2xpVFhwanpFMVRTNktxakVlVCt4MmdETW9l?=
 =?utf-8?Q?tkfw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5489.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ce8c7e2-e9a6-4808-3cb8-08dc96882609
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 09:04:27.7425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zuAD85pqqeS3cyDd+mzvJwg1Tq6+o3BbQ/lwTklinMyY9a/iBSaT+wXAqSnkYLnE/o91VfjiqoxwgCuhk7qIsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7486
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMeXVkZSBQ
YXVsIDxseXVkZUByZWRoYXQuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgSnVuZSAyNywgMjAyNCAx
MjoyMSBBTQ0KPiBUbzogTGluLCBXYXluZSA8V2F5bmUuTGluQGFtZC5jb20+OyBhbWQtZ2Z4QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLQ0KPiBkZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcN
Cj4gQ2M6IGphbmkubmlrdWxhQGludGVsLmNvbTsgaW1yZS5kZWFrQGludGVsLmNvbTsgZGFuaWVs
QGZmd2xsLmNoOyBXZW50bGFuZCwNCj4gSGFycnkgPEhhcnJ5LldlbnRsYW5kQGFtZC5jb20+OyBa
dW8sIEplcnJ5IDxKZXJyeS5adW9AYW1kLmNvbT47DQo+IFdlbnRsYW5kLCBIYXJyeSA8SGFycnku
V2VudGxhbmRAYW1kLmNvbT47IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCAyLzNdIGRybS9kcF9tc3Q6IFNraXAgQ1NOIGlmIHRvcG9sb2d5IHByb2JpbmcgaXMg
bm90DQo+IGRvbmUgeWV0DQo+DQo+IFNvbWUgY29tbWVudHMgZG93biBiZWxvdzoNCj4NCj4gT24g
V2VkLCAyMDI0LTA2LTI2IGF0IDE2OjQ4ICswODAwLCBXYXluZSBMaW4gd3JvdGU6DQo+ID4gW1do
eV0NCj4gPiBEdXJpbmcgcmVzdW1lLCBvYnNlcnZlIHRoYXQgd2UgcmVjZWl2ZSBDU04gZXZlbnQg
YmVmb3JlIHdlIHN0YXJ0DQo+ID4gdG9wb2xvZ3kgcHJvYmluZy4gSGFuZGxpbmcgQ1NOIGF0IHRo
aXMgbW9tZW50IGJhc2VkIG9uIHVuY2VydGFpbg0KPiA+IHRvcG9sb2d5IGlzIHVubmVjZXNzYXJ5
Lg0KPiA+DQo+ID4gW0hvd10NCj4gPiBBZGQgY2hlY2tpbmcgY29uZGl0aW9uIGluIGRybV9kcF9t
c3RfaGFuZGxlX3VwX3JlcSgpIHRvIHNraXAgaGFuZGxpbmcNCj4gPiBDU04gaWYgdGhlIHRvcG9s
b2d5IGlzIHlldCB0byBiZSBwcm9iZWQuDQo+ID4NCj4gPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVA
cmVkaGF0LmNvbT4NCj4gPiBDYzogSGFycnkgV2VudGxhbmQgPGh3ZW50bGFuQGFtZC5jb20+DQo+
ID4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+DQo+ID4gQ2M6IEltcmUg
RGVhayA8aW1yZS5kZWFrQGludGVsLmNvbT4NCj4gPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPg0KPiA+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+ID4gU2lnbmVkLW9m
Zi1ieTogV2F5bmUgTGluIDxXYXluZS5MaW5AYW1kLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVy
cy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMTEgKysrKysrKysrKysN
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gPiBi
L2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0KPiA+IGluZGV4
IDY4ODMxZjRlNTAyYS4uZmMyY2VhZTYxZGIyIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kaXNwbGF5L2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kaXNwbGF5L2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0KPiA+IEBAIC00MDY5LDYgKzQwNjks
NyBAQCBzdGF0aWMgaW50IGRybV9kcF9tc3RfaGFuZGxlX3VwX3JlcShzdHJ1Y3QNCj4gPiBkcm1f
ZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyKQ0KPiA+ICAgICBpZiAodXBfcmVxLT5tc2cucmVxX3R5
cGUgPT0gRFBfQ09OTkVDVElPTl9TVEFUVVNfTk9USUZZKSB7DQo+ID4gICAgICAgICAgICAgY29u
c3Qgc3RydWN0IGRybV9kcF9jb25uZWN0aW9uX3N0YXR1c19ub3RpZnkgKmNvbm5fc3RhdCA9DQo+
ID4gICAgICAgICAgICAgICAgICAgICAmdXBfcmVxLT5tc2cudS5jb25uX3N0YXQ7DQo+ID4gKyAg
ICAgICAgICAgYm9vbCBoYW5kbGVfY3NuOw0KPiA+DQo+ID4gICAgICAgICAgICAgZHJtX2RiZ19r
bXMobWdyLT5kZXYsICJHb3QgQ1NOOiBwbjogJWQgbGRwczolZCBkZHBzOg0KPiA+ICVkIG1jczog
JWQgaXA6ICVkIHBkdDogJWRcbiIsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY29ubl9z
dGF0LT5wb3J0X251bWJlciwNCj4gPiBAQCAtNDA3Nyw2ICs0MDc4LDE2IEBAIHN0YXRpYyBpbnQg
ZHJtX2RwX21zdF9oYW5kbGVfdXBfcmVxKHN0cnVjdA0KPiA+IGRybV9kcF9tc3RfdG9wb2xvZ3lf
bWdyICptZ3IpDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgY29ubl9zdGF0LT5tZXNzYWdl
X2NhcGFiaWxpdHlfc3RhdHVzLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbm5fc3Rh
dC0+aW5wdXRfcG9ydCwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBjb25uX3N0YXQtPnBl
ZXJfZGV2aWNlX3R5cGUpOw0KPiA+ICsNCj4gPiArICAgICAgICAgICBtdXRleF9sb2NrKCZtZ3It
PnByb2JlX2xvY2spOw0KPiA+ICsgICAgICAgICAgIGhhbmRsZV9jc24gPSBtZ3ItPm1zdF9wcmlt
YXJ5LT5saW5rX2FkZHJlc3Nfc2VudDsNCj4gPiArICAgICAgICAgICBtdXRleF91bmxvY2soJm1n
ci0+cHJvYmVfbG9jayk7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgIGlmICghaGFuZGxlX2Nzbikg
ew0KPiA+ICsgICAgICAgICAgICAgICAgICAgZHJtX2RiZ19rbXMobWdyLT5kZXYsICJHb3QgQ1NO
IGJlZm9yZSBmaW5pc2gNCj4gPiB0b3BvbG9neSBwcm9iaW5nLiBTa2lwIGl0LiIpOw0KPiA+ICsg
ICAgICAgICAgICAgICAgICAga2ZyZWUodXBfcmVxKTsNCj4gPiArICAgICAgICAgICAgICAgICAg
IGdvdG8gb3V0Ow0KPiA+ICsgICAgICAgICAgIH0NCj4NCj4gSG0uIEkgdGhpbmsgeW91J3JlIGRl
ZmluaXRlbHkgb24gdGhlIHJpZ2h0IHRyYWNrIGhlcmUgd2l0aCBub3QgaGFuZGxpbmcgQ1NOcw0K
PiBpbW1lZGlhdGVseSBhZnRlciByZXN1bWUuIE15IG9uZSBxdWVzdGlvbiB0aG91Z2ggaXMgd2hl
dGhlciBkcm9wcGluZyB0aGUNCj4gZXZlbnQgZW50aXJlbHkgaGVyZSBpcyBhIGdvb2QgaWRlYT8g
SW4gdGhlb3J5LCB3ZSBjb3VsZCByZWNlaXZlIGEgQ1NOIGF0IGFueQ0KPiB0aW1lIGR1cmluZyB0
aGUgcHJvYmUgLSBpbmNsdWRpbmcgcmVjZWl2aW5nIGEgQ1NOIGZvciBhIGNvbm5lY3RvciB0aGF0
IHdlJ3ZlDQo+IGFscmVhZHkgcHJvYmVkIGluIHRoZSBpbml0aWFsIHBvc3QtcmVzdW1lIHByb2Nl
c3MsIHdoaWNoIGNvdWxkIHJlc3VsdCBpbiB1cw0KPiBtaXNzaW5nIENTTnMgY29taW5nIG91dCBv
ZiByZXN1bWUgYW5kIHN0aWxsIGhhdmluZyBhbiBvdXRkYXRlZCB0b3BvbG9neQ0KPiBsYXlvdXQu
DQo+DQo+IEknbSBub3QgdG90YWxseSBzdXJlIGFib3V0IHRoZSBzb2x1dGlvbiBJJ20gZ29pbmcg
dG8gc3VnZ2VzdCBidXQgaXQgc2VlbXMgbGlrZSBpdA0KPiB3b3VsZCBjZXJ0YWlubHkgYmUgd29y
dGggdHJ5aW5nOiB3aGF0IGlmIHdlIGFkZGVkIGEgZmxhZyB0bw0KPiBkcm1fZHBfbXN0X3RvcG9s
b2d5X21nciBjYWxsZWQgc29tZXRoaW5nIGxpa2UgImNzbl9kdXJpbmdfcmVzdW1lIg0KPiBhbmQg
c2ltcGx5IHNldCBpdCB0byB0cnVlIGluIHJlc3BvbnNlIHRvIGdldHRpbmcgYSBDU04gYmVmb3Jl
IHdlJ3ZlIGZpbmlzaGVkDQo+IHJlcHJvYmluZz8gVGhlbiB3ZSBhdCB0aGUgZW5kIG9mIHRoZSBy
ZXByb2JlLCB3ZSBjYW4gc2ltcGx5IHJlc3RhcnQgdGhlDQo+IHJlcHJvYmluZyBwcm9jZXNzIGlm
IGNzbl9kdXJpbmdfcmVzdW1lIGdldHMgc2V0IC0gd2hpY2ggc2hvdWxkIHN0aWxsIGVuc3VyZQ0K
PiB3ZSdyZSB1cCB0byBkYXRlIHdpdGggcmVhbGl0eS4NCj4NClRoYW5rcyBmb3IgdGhlIHJldmll
dyENCg0KSSB1bmRlcnN0YW5kIHlvdXIgY29uY2Vybi4gTXkgcGF0Y2ggd2lsbCBqdXN0IGNoZWNr
IHdoZXRoZXIgbXN0IG1hbmFnZXIgc3RhcnRzDQp0aGUgcHJvYmluZyBwcm9jZXNzIG9yIG5vdCBi
eSBjb25maXJtaW5nIHdoZXRoZXIgd2Ugc2VudCBMSU5LX0FERFJFU1MgdG8NCnRoZSAxc3QgbXN0
IGJyYW5jaCBhbHJlYWR5LiBJdCB3aWxsIGRyb3AgdGhlIENTTiBldmVudCBvbmx5IHdoZW4gdGhl
IGV2ZW50IGNvbWVzDQplYXJsaWVyIHRoYW4gdGhlIHByb2JpbmcuIFRoZSBDU04gZXZlbnRzIG9j
Y3VyIGR1cmluZyB0b3BvbG9neSBwcm9iaW5nIHNob3VsZA0Kc3RpbGwgaGF2ZSBjaGFuY2UgdG8g
YmUgaGFuZGxlZCBhZnRlciBwcm9iaW5nIHByb2Nlc3MgcmVsZWFzZSB0aGUgbWdyLT5wcm9iZV9s
b2NrDQpJIHRoaW5rLiBEb2VzIHRoaXMgbWFrZSBzZW5zZSB0byB5b3UgcGxlYXNlPyBUaGFua3Mh
DQoNCj4gPiAgICAgfSBlbHNlIGlmICh1cF9yZXEtPm1zZy5yZXFfdHlwZSA9PQ0KPiA+IERQX1JF
U09VUkNFX1NUQVRVU19OT1RJRlkpIHsNCj4gPiAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgZHJt
X2RwX3Jlc291cmNlX3N0YXR1c19ub3RpZnkgKnJlc19zdGF0ID0NCj4gPiAgICAgICAgICAgICAg
ICAgICAgICZ1cF9yZXEtPm1zZy51LnJlc291cmNlX3N0YXQ7DQo+DQo+IC0tDQo+IENoZWVycywN
Cj4gIEx5dWRlIFBhdWwgKHNoZS9oZXIpDQo+ICBTb2Z0d2FyZSBFbmdpbmVlciBhdCBSZWQgSGF0
DQoNCi0tDQpSZWdhcmRzLA0KV2F5bmUgTGluDQoNCg==

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WMuOGwVDlGm3BgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 11:29:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D330D14ADB8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 11:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C4110E4BF;
	Tue, 17 Feb 2026 10:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DsxI1rGr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010003.outbound.protection.outlook.com
 [40.93.198.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2478810E4BF
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 10:29:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOLGQgm/kS9PrVUMbZogjIb1KV7/2J6Dn7eqMQmqNVMcE25HGAAEFrJGtlbtxFHaYv3WfpSk/Dtg10NK7pce5Tu06JGfBK1Yt3TSP3sFfd70dHMEmRiybhPylA8TEuvyb+SVl5pn+PPNohlXfotybe+2ldh2JhoMZXEn/D5NT9H79R10ZJ4L70H3co+Lpog37cb0HLYHBOZNVFnVpX6+GFnh6LEGONkhY7tTsHQuymTB3ERXkO9g0pimBr2+e1oNq3Cd2iX8ktxuxM5NNlKI9vD+34u5RbSOuSKstIfi53ROBkUELEfHlyaoiNqBBNPX+QMO1R8mZinx3xmjQv1tBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRlmNNBg8b0Sfj9TMG5bdcLHCC16NIJDWzCakv2y+2g=;
 b=Kd4xj1XKrOiFo40JMlfKRc6E+SjUXofznI6P6ek0yqyUYKdQ/eQgYw0vBo8ke9n7iy0DsLYuvNjfoM5S81KZFgrEZOQRFtwMmGr4z8lzGWa5UGGjUMbBK9gWbAdVaZXs+naogyBeSbHHSpPBUVZevw+yekgW67Er765jVTFmhrRJq0H1Rlt/FXFShHz1W8skNDlzQNUnZXXKv/EL7sCGi3NZuvrU0xGP0D7/qQ5Drp2PSkseUzTQk4TaovrzVJGwM0jhvX1KypKAVvIqSxZse7woFipuHkPYPME/SkV3Bz0fNm/y3Q5QENmwSGB+HY4C5feOcicDnYp3GqHJ0ttmzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRlmNNBg8b0Sfj9TMG5bdcLHCC16NIJDWzCakv2y+2g=;
 b=DsxI1rGrry3mCs6wlLvkz0dqJHOmrbeXsXlrtC3Kuv25tDhnhAXJ8gDEhqh44Eakk9m2FLfM8LGqwW38wdUdeWDLhxIoCGdMk+v1w5YGkN0o6eRhW38Kpc+CzvT2K1eJdxtzcwi+MPq+dK9SHmUs7wQiHrwm3i8MQ6XhbpeOxlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM3PR12MB9433.namprd12.prod.outlook.com (2603:10b6:0:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 10:29:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.008; Tue, 17 Feb 2026
 10:29:18 +0000
Message-ID: <f1100dad-b9ff-4ba2-987c-4d5cb4c1122c@amd.com>
Date: Tue, 17 Feb 2026 11:29:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 1/2] drm/syncobj: Add DRM_IOCTL_SYNCOBJ_QUERY_ERROR
 to query fence error status
To: Yicong Hui <yiconghui@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, david.hunter.linux@gmail.com,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
References: <20260213120836.81283-1-yiconghui@gmail.com>
 <20260213120836.81283-2-yiconghui@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260213120836.81283-2-yiconghui@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0371.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:fd::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM3PR12MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a390fb-34ea-4fae-5b6b-08de6e0f67ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3Y2d3M0bTRXYTdLdFEyc1YvY1E0bi8zbkJ2VFpFOHZWbHVFMGEyMzhjNHkv?=
 =?utf-8?B?OGUrSk9PeS9lNmFWYVFyb25VSFljQmFubjJPemdaQjhHNGhUTVcrU3BKQm1i?=
 =?utf-8?B?K0theHdmckdTYkd1bUw0angzTUtQQk5tbDZzWHR6MUI2TlpwbGJQMGREakZq?=
 =?utf-8?B?QWNvdGExWitUM0hHZUN3Q1FQOUpnU1VaMnBvT213Um5CWGlTWmdOek5OOHls?=
 =?utf-8?B?a25RbVhiMDMvR2V1TC9IY0ZpVGJKM3VTdGV5ODhLYUxZWU5wcWV6VDZQaEh3?=
 =?utf-8?B?K1RKR0tBdmlXTysyRFJ4ZkwyeGUxbFdjLzVzK3J6ODBiV3N5aW1sYkdWTjVh?=
 =?utf-8?B?di9SWkxkSWpEZFhqczdubUFVTkJYSXQ4WVJwY085WXdsSkczQWdYWVM5M2hE?=
 =?utf-8?B?ZDNjTVIrTzNnTjE3V2hVcjV4MVFDVHhzZFQvMFFMUWcwRzdnaTNxYWdCM0Z5?=
 =?utf-8?B?aDhXVXp4V211VTF0ZVRnZHhLUDVKS3JQR3ZNdGhTRXBlS2g4QmpIV3Znb25M?=
 =?utf-8?B?cS9tMjhzZVd0M2lVbC9pb0FiNlVTOU0zc0REK2cxOUVkTEZORUw2TVRyWTVk?=
 =?utf-8?B?YlVnNS9SR1o4djZuSS9oTnBPY096cTZHVCtMVjA2bnYwWlNCeGV1eEVGOVM4?=
 =?utf-8?B?V1g4ZW5CaElSQXRtMys4akNtZHFZeEhRSFdZMlJnYmVzVkp4TFFpVGwvbHpU?=
 =?utf-8?B?bGxGM0p3OURxdlVzNU91Qlc0dEtwczBmQzd6WUQyN2ZLYW1lRFd5azNDRVdr?=
 =?utf-8?B?bDVJQkgzWSt3SkYxQjMrQ1FzZ3FIYXRjSzNWV3RQM2ZsWTlSNmkyVCtzTDF0?=
 =?utf-8?B?SFVoQkNEZUxpM1JjWVZwUmxlRmsxUC9RdkhEMWdLZVlkTHh0QmZERXJhYXhx?=
 =?utf-8?B?OFVSZHc3TFBNbEg2WnZucWsvbnF1QWFyNFBwSHFvQ1N3dFcwWjJJY2tBbWNV?=
 =?utf-8?B?WFhkR2hSRE9JUlVBdWNrRlQ2RWRidG5JTzBkbkJIc1Y0K2RKdlRkbURwK2NV?=
 =?utf-8?B?QmJBY1QvSzloVTdPaEo4Lzc2SzRIMGxnS29BSURvM2Vuc0FlM0tHMkZFb0FP?=
 =?utf-8?B?a1A0RnFhWTZaQUdGd3MwY1g2dno0YTJGanVkK2xJMS81VnBDUUlKcW5SS2xE?=
 =?utf-8?B?YmVsZ1VJQ2ErU2dHWW5XSGJieVhlZU4xUGU2WEpoSGZUOGQ5YkRjL3I3REF0?=
 =?utf-8?B?R0VyWUtuODlwYjFSVytmb0F0OFVGVnRBUm9ZdEo0M3RhWC81djVzeXRwQU1m?=
 =?utf-8?B?ZWUrTmhFQ3ZJalRoMytpb2d4OXhwdDl5NFRuMmxmUExqUTYvVTNWbmJQMVUr?=
 =?utf-8?B?bWFvUy9CQVpnbFV5bWc1M0ErdmdGMnpyWUMwSjBFMjJEQWpQYVZqVnE1STZ2?=
 =?utf-8?B?LzVwVjkxV0E2MGVuNTMzY09qWmdQVUJoaG00cWxSM0xsZ2Z5NGRSMTUwUVBB?=
 =?utf-8?B?bXI2d2xSaGVhcmRYN3BTSW41bXhxbHIvang0Z0xPZHhNQk9OOGJjSHcrUitB?=
 =?utf-8?B?RDFpM1JZcDdLaHUwVTZFUFRMVG5YVHB1L3ZkZjlhcXJGYnBPdW1xZ2huVWZv?=
 =?utf-8?B?NWtaM3NMODhUREFObTlEWmlmVmMwek1YeXR4U0J0QkxyYmc2MWFmNGh3VXlp?=
 =?utf-8?B?ZlNWK0ljOG8xTDVJR3pNWXo4emloaFUvUUZsengyUGR0S2hicWljQ3g1WXdK?=
 =?utf-8?B?QmRQWUJnWm9qNUdKSmh5UGFIOTJHZDY3V29SZ0lrcExGWlBhVUxNdUhZVzZ6?=
 =?utf-8?B?aEFJSmNrcklEajVZYlZTMkJQQ3FVUHRkY0pMOTl1clk5ZlZySVNxTEllaG9U?=
 =?utf-8?B?UHl2WjQ5MXVoU0NGMkI3aVplSnFyRTRUaEdHL3RlNXJpNm1oZFF4cHRLY2NI?=
 =?utf-8?B?MVByWkNZTVRxRXF6UnFkUHVuamlRbFR4TWxPZS81cFoySzgxMkt4S3pCN1ZQ?=
 =?utf-8?B?TjB0MExuVXZNL0NmQjVvSGZUOFFSMVErc0o2RTZScU9aWk1SNmIrTmwvaUN3?=
 =?utf-8?B?bk56N1BheTFUYWhRUTZxQ25sd3lPQlJ2eS9BTDFoR1NCdm1oNSt4a2VybmVI?=
 =?utf-8?B?T2hqaVRVaGFmdTRVdDIrYXJsczZ6WVBhVHlkMXZYcEJTcklVUkprdS9KNW5a?=
 =?utf-8?Q?gSCQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFFJK3piUTF0VUc3OG5xcDl6WGxhRTRLTGFHZmFVanQyNkkxbnZLZmFEQUl3?=
 =?utf-8?B?RHFidllrWkxmNlQvanVBNnpXMHJUWG1OajZkclo3RXAzdUw2d0ltR2U0OSs1?=
 =?utf-8?B?dGhZYisvM0V6SmZQc2I4cFBSV2tsU2lXWkovUGdibm5WU0F0SGVNVU1sTmlU?=
 =?utf-8?B?T21SYjU3clFkWWF5d3B0RWZmYUp5K25QOEhESVdQeEhTMmNDMzFFRnhldXNL?=
 =?utf-8?B?S1FQUXJKNE5qWnhNNFZ5T0FKRVd2YzVyS1BEdFUyNzRxS2lTTDR2TFc5UWgz?=
 =?utf-8?B?ZGRjc0dvRGRGd0VEMytkTW1jYnR2R2dYWFJhMFhKSVdnOU1XcisySmlZL3Jh?=
 =?utf-8?B?VE1nY0Z6aVhLREVTV3dCT1ZVYmptZldKU3M0cXU4eE44RUJMcVJOVGVjSEVr?=
 =?utf-8?B?Y3VEZlM5dThPaFFCQjV1cHMyQUp2OTVNRy9SZ0Y4dzdxRTRZQVQyekI0b00x?=
 =?utf-8?B?Q0wrVnBVNEZhOXVLMjJJK29Vb1ZtdFVlbGUrVW05anVBdVpOZjR4VW8wT2JI?=
 =?utf-8?B?Q2ZrSERSMksvMlYvWVhtK0cvSGRmZjNDdXVtQUEyVkJIejFuOWEvblJVb2pl?=
 =?utf-8?B?ZU9kT3BoU3BxbVhOYXVJT084eFhsS25yUTlRUHAxSFpLS05Sc2NSaG5USHRy?=
 =?utf-8?B?ekY4ODV1Sk1nU2NON3NYRjdtanZqU3Z2eGNQZ2dXNWZuWUx4ZDdXWncrYzhi?=
 =?utf-8?B?L2tkdVA0cGJHUGd6bjdoYktXYUppNnBieFJGdExDcVMrSG81c0Y1ckxMZkkx?=
 =?utf-8?B?Z2JCOVAvbTRueThCOHc0cDVKZ3FqME1XZFlsT2pqTTV0eHNPWUZ2VWp5ZktU?=
 =?utf-8?B?VUNONUg5UzJtUGZHaWZUWEFmL2d3RGx2bzNqZFNkeG8rdWFvbFlqZkZDSVBm?=
 =?utf-8?B?VCtrRWthNEsyQ09iS1JrNWhScVJsSFZjbHpLYStqcWRqUXFhNWJxYlRVL2ZC?=
 =?utf-8?B?ZXRxb1hkdWhiQndjdkNCeEc5SGI0TjZScWx0Rk9wRTgrY3FqQUNXTVE1T2lL?=
 =?utf-8?B?a0dBUFJBcTcxVXV2OS96WHhwd3dNaDZ6NFhuSkgza3NDOFZPc0crVE56VXZJ?=
 =?utf-8?B?VFdObVpEc1FmVG5jd0F0M1BjVVlOcGRxdU9KSUZZclZFTzBnTmIrUG5MUmVH?=
 =?utf-8?B?dnZ2bHEvSXNYNFg3VlhnNW1BalR3ejhEaXRDSkNmUGdpb1drRC9uQkRDZDlK?=
 =?utf-8?B?WWpVc3hyRXNtbUU0SWt4d2xobnRFQXlWN1FIR3hPM0o3SGl2UHIzcWx0SzFI?=
 =?utf-8?B?VHJnQzh3WHJEZi8xWjJRSUYyL2VZWFU5dndiZ3c4b3VYbkswWFo5SkljS2cz?=
 =?utf-8?B?TjlUVGNBUjBNTmUyWHhUMGxtRVM0RE92MEJ4L3NpZHUzemZwdmRhOE16Q1JG?=
 =?utf-8?B?anVWZEMrOHZVSUNuODl6Z2FaWUw3TzAwaFFydDB2RUVnMXpQcnNJWFRFYVFt?=
 =?utf-8?B?dGxyWktMVzRMTDBFVXRFSnFhS25udWxSaXJBemRpckRnUW9iSlRaaXY0MDRZ?=
 =?utf-8?B?UkVWdnNlZVVXUHNUQ1ZjNXc3NFhyOGUzN052dFVHRHhRRExiWVBTTXZZZHFY?=
 =?utf-8?B?SU1Ddlp2MHpUTUJydE1ZSHFiNWpsdG5DMnJSV1NCT3hMWHVYTUxDSUpEOGtC?=
 =?utf-8?B?WUtxVDVES3o0SU0wMlRpUFNPY1BLck1MT0hkZTlsbUs3OHBzS09aYVNhU2ZR?=
 =?utf-8?B?RFllb3JMOGk3MTk0akpEdkdWOUdaUjFaNC9GempFc1drNEtEeGQ1UnZPS0NM?=
 =?utf-8?B?ZjJVT09DbFdSb1ZJeU5YZzJKejhvU1hjbXpiUWZObkttWHdHVVFvWmkzbzUx?=
 =?utf-8?B?WlhHY1g1cStzVlcwOGlFby9BZkNxSTVuRWI4eTR5NW5DemhNd2o1VG5RMm5C?=
 =?utf-8?B?ZWpsWmtlSnIwMm5oMWp0OXMwSGJ6MUlDR0RRdWxrYlRpTTRZRXQxNlhzejhN?=
 =?utf-8?B?SkFCM2JFcXNuNy9hRkZCcWh1bzVXcWhVMU9icDF2aTR1YlZZamF6TEdnaHF4?=
 =?utf-8?B?dHNpa2NadUp6V3MzVnFOYjdIcWZ3U21tZUowcGpMdUlWdE9vQ2hjTkcvN1JY?=
 =?utf-8?B?dkZTNHEwOGNPNUtUaXM5OUxDYkhNNzd0Unp4R2paeUhUZWhsSCtxRmYwWDZD?=
 =?utf-8?B?dVMzUlo3UzYxbG5QVEpHSHFiVkQwYittL0VKcjNRSVJTTmY1SkpFYnBHUmdn?=
 =?utf-8?B?ODhYaDNBbkpwL1pxMEF6b3pqOHo0UnpsWFd2V0JkazJCSSsvWHV5OWQ2bEw5?=
 =?utf-8?B?dFh4SVArclJlOWVHUDRHN3liRkhIeERiMEQrU1Jwd0ZIV1lNeFQxU0RJUGhk?=
 =?utf-8?Q?M1N1Ky9wbderq+zaiV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a390fb-34ea-4fae-5b6b-08de6e0f67ef
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 10:29:18.2246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jun6/I/IkfEWIavb1p0Hpqb7jPRLC0CuLvVUS9u3kUGnHJp1heEp4Qsovwp+ssxz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9433
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yiconghui@gmail.com,m:linux-kernel@vger.kernel.org,m:skhan@linuxfoundation.org,m:david.hunter.linux@gmail.com,m:michel.daenzer@mailbox.org,m:davidhunterlinux@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,linuxfoundation.org,gmail.com,mailbox.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: D330D14ADB8
X-Rspamd-Action: no action

On 2/13/26 13:08, Yicong Hui wrote:
> Add DRM_IOCTL_SYNCOBJ_QUERY_ERROR to allow userspace to query the error
> status of a fence held by a timeline/binary syncobj.

Not bad for a first try, but quite a bunch of general comments.

First of all to get that merged you need to point out a Mesa merge request where this interface is actually used in userspace, so that we can look at the full solution.

> Signed-off-by: Yicong Hui <yiconghui@gmail.com>
> ---
>  drivers/gpu/drm/drm_internal.h |  2 ++
>  drivers/gpu/drm/drm_ioctl.c    |  2 ++
>  drivers/gpu/drm/drm_syncobj.c  | 22 ++++++++++++++++++++++
>  include/uapi/drm/drm.h         | 13 +++++++++++++
>  4 files changed, 39 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
> index f893b1e3a596..d4d722983544 100644
> --- a/drivers/gpu/drm/drm_internal.h
> +++ b/drivers/gpu/drm/drm_internal.h
> @@ -285,6 +285,8 @@ int drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>  				      struct drm_file *file_private);
>  int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  			    struct drm_file *file_private);
> +int drm_syncobj_query_error_ioctl(struct drm_device *dev, void *data,
> +			    struct drm_file *file_private);
>  
>  /* drm_framebuffer.c */
>  void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index ff193155129e..61b114a6a65f 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -732,6 +732,8 @@ static const struct drm_ioctl_desc drm_ioctls[] = {
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_LIST_LESSEES, drm_mode_list_lessees_ioctl, DRM_MASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_GET_LEASE, drm_mode_get_lease_ioctl, DRM_MASTER),
>  	DRM_IOCTL_DEF(DRM_IOCTL_MODE_REVOKE_LEASE, drm_mode_revoke_lease_ioctl, DRM_MASTER),
> +	DRM_IOCTL_DEF(DRM_IOCTL_SYNCOBJ_QUERY_ERROR, drm_syncobj_query_error_ioctl,
> +		      DRM_RENDER_ALLOW),

My educated guess is that userspace doesn't want to call this IOCTL separately because of performance reasons.

Instead add some additional flag to DRM_SYNCOBJ_WAIT_FLAGS_* so that the IOCTL aborts the wait and returns an error as soon as it sees any fence with an error.

Another DRM_SYNCOBJ_QUERY_FLAGS_* is potentially also useful to query the error on a number of drm_syncobjs at the same time.

But in general since this is not a HW feature the userspace developers need to voice their requirements and explain how they want to have that implemented.

So adding Michel on CC, I've briefly discussed that topic with him on XDC last year.

Thanks,
Christian.

>  };
>  
>  #define DRM_CORE_IOCTL_COUNT	ARRAY_SIZE(drm_ioctls)
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index 2d4ab745fdad..2152cd029070 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1717,3 +1717,25 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  
>  	return ret;
>  }
> +
> +int drm_syncobj_query_error_ioctl(struct drm_device *dev, void *data,
> +			    struct drm_file *file_private)
> +{
> +	struct drm_syncobj_error *args = data;
> +	struct dma_fence *fence;
> +	int ret;
> +
> +	if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
> +		return -EOPNOTSUPP;
> +
> +	ret = drm_syncobj_find_fence(file_private, args->handle, args->point, 0, &fence);
> +
> +	if (ret)
> +		return ret;
> +
> +	args->error = fence->error;
> +
> +	dma_fence_put(fence);
> +
> +	return 0;
> +}
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 27cc159c1d27..087c0f2120ec 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -1051,6 +1051,11 @@ struct drm_syncobj_timeline_array {
>  	__u32 flags;
>  };
>  
> +struct drm_syncobj_error {
> +	__u32 handle;
> +	__s32 error;
> +	__u64 point;
> +};
>  
>  /* Query current scanout sequence number */
>  struct drm_crtc_get_sequence {
> @@ -1363,6 +1368,14 @@ extern "C" {
>   */
>  #define DRM_IOCTL_GEM_CHANGE_HANDLE    DRM_IOWR(0xD2, struct drm_gem_change_handle)
>  
> +/**
> + * DRM_IOCTL_SYNCOBJ_QUERY_ERROR - Query the error code from a failed drm_syncobj
> + *
> + * This ioctl provides userspace a way to query the error code of a binary and
> + * timeline drm_syncobj in the case that the submission fails.
> + */
> +#define DRM_IOCTL_SYNCOBJ_QUERY_ERROR	DRM_IOWR(0xD3, struct drm_syncobj_error)
> +
>  /*
>   * Device specific ioctls should only be in their respective headers
>   * The device specific ioctl range is from 0x40 to 0x9f.


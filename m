Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DABBB998BFC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 17:43:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D28610E963;
	Thu, 10 Oct 2024 15:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="IqdY4YPX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010066.outbound.protection.outlook.com [52.101.69.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FBD410E0B5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 15:43:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kUVeNmYoZ6IufJdoyc+Pz7aZgCdFDsWgUZOQ5lf0RsLkFVSFhsz1UltSJOrzpFS9YAK1pIJAVmkr/tmsx1bGk9MJk0uzBUOnX8XBiBmOooSYboCNgveFBc2R5f5ooMp+CVG/2d1eLz6hddYpD1n2GOu1ExPG7l9NodH2w8TOW9Qd+1C8FvXhdpQtqo9KsH1QerSRBxeBBD7/tyJSUN2Do0/BE2aGh2iCk4YW6hmFvCf8VQ7aufAR3qQyzgCkWNAUWSJsqEtP7f0CAf+GLRrVlMjN4UC2+tw7R/CHEUqKgqDBl+w2Vjrz4zxXXUXxZbwn2gOQ/OjuyIKWoeTnZTlrAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lkJ3yT3khb9cmV759E9G8LoNHwccnKEQB5tsWz1n9o4=;
 b=IR4LxPeHj2mVFWKK6GAM+Lu4Q/wQkM+xmDSFqtHIVLCKxGgcHJdZS2esEihgiZc0BncMrMSYz8CSzeXBjOMSupBzoXuOmVLA5Zja6G0Ej5ZnRjQEd6+nom12KNjEuJrxrB1Q9kbPBgvEGGYdsSV36EvIHlrcVKfwM7O65d8ipEzu50rz7f9BNstT1AtkzgvN4Jg/L67ne3lj0r1Fj8l/ZGkPFz/BHkNzL5TFSEFulrE4xu7GWWQYF8f58nzCgDr68uFcx/DJjTpbssGk+fGCwZ7ISoCCTNIJNjcaR7P8xole+htagyzBexlDAVxIDeyepPNq9kfO75+pfcDrewQTyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lkJ3yT3khb9cmV759E9G8LoNHwccnKEQB5tsWz1n9o4=;
 b=IqdY4YPXx1jFIGVOviQbP0+6Gr7nc22R8PjGHBoMjN8Fy9wnamC8zeUZ5qsLqB8+s27yIrhHORU3CHDaqbcZ9KN+baCZXUh1LqpfzLol+tZBzRvrOFbPz+Y30/P+VDL6ruT66rdjTISYhbSatqt4sfRYoH06DyRtzGe3N7FxV3RN6ItK025OB+k1LkjICff8MtV2h36DDuY2PpICeNKXNSAa7Tbja1lC8AqQBu0nvqUe5eXCFnlz9jOVjOVw6OTR2099ZRb+i5mR6iRNorrLZ/Vgnm4+7T6aAT3Mu52mW1VOzo/bL1CjAIlk2JfIiV0w+MuKanH+Gf7cmJJpmtSV+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB8984.eurprd04.prod.outlook.com (2603:10a6:10:2e3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 15:43:32 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8048.013; Thu, 10 Oct 2024
 15:43:32 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 10 Oct 2024 11:42:40 -0400
Subject: [PATCH v2 3/5] dt-bindings: nvmem: convert zii,rave-sp-eeprom.txt
 to yaml format
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-zii_yaml-v2-3-0ab730607422@nxp.com>
References: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
In-Reply-To: <20241010-zii_yaml-v2-0-0ab730607422@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728574994; l=3578;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ob1E7NL3APs+jPRTzbWg/SPQjt1E1mSWENnsoizXz90=;
 b=M2lfPlb5yR7wGVgk3E4IAg460TIiqBA0F4Ebkr4/q4uMrgfRJ7j6Dv4z8nd3KiRz2aOTI1JZE
 usbFtGUzg2BBC+7oqJ3eRUWWQXKYy7F74lnGXXbTwt2gs47VFFxJVqP
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ2PR07CA0022.namprd07.prod.outlook.com
 (2603:10b6:a03:505::24) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB8984:EE_
X-MS-Office365-Filtering-Correlation-Id: 0306761d-59ce-4190-a61d-08dce9424b77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|52116014|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akhGbm5sVllGRi91aEluVzZPL3QxeEUxdXQzczcxbEY0Q1dxVnRoUjVvOGtW?=
 =?utf-8?B?c3kvbEdTaEtnbWx4Qmk0RCtNQUxWVkFzNkhYbWhpbmpoNVVDM0pyVHBuTXFt?=
 =?utf-8?B?dzNBYlBhQy9HZWVWRk1OWjE4empoYS9DNWtzZm1ZMzFtMldRSlNLTU1OMGhi?=
 =?utf-8?B?dUZjNGQyWEZXam5EaVd4cWZZRXpFczRUY1RYNXo0RWQ3WXhXamQ1aHVKY3dQ?=
 =?utf-8?B?bHVaeTBYM1YraURxczZMUUZKK2UzY29tcDFSeit6TTU2bXBWQjdDSEUxT01H?=
 =?utf-8?B?eE16ZnQyeStKYXpXSC96QTIzMzJMMWQzMW5QZUg0NXNVbmhiRVc2VUVIUS9w?=
 =?utf-8?B?MENHR2VJYXk4OE1aeXVNcU92cTA3SzBWL2IwcEI4cEh3bmlnYWkzRDlITVZS?=
 =?utf-8?B?SUlSSHU1RHVNN1FkRUErT3FQTWdWck15Uk1iSCtYSzNsUzNwWEgrVDFBdkxQ?=
 =?utf-8?B?TTgxZ2lUL3dtaTd4NkRWMlRaazEyaWszMlRobzZzRHZxOWhLeDlVY05Rc3RT?=
 =?utf-8?B?cGg3SkR1d1E2UFdidkpaaUorcGV3dVdzU2FGZldUcjRTOGNZK3NkU2FpU2hO?=
 =?utf-8?B?KzZVZzVlK3YwZFVZbFRNeDJObVBmMk42MVdBdTQ3RGcvZkplY3MyZVFZMkFj?=
 =?utf-8?B?bVpTdDh1UVdpVngwcE41YXd0QndrYmc4NDFOdU1uRXRlZDUvelhEWDZVRU9q?=
 =?utf-8?B?S2Z4L3FQTE4zKzNGcC81NzAvMzJ0eHY2andZY25IMmNmVE1QZ2ZzR3FKVzgz?=
 =?utf-8?B?VnI3TG1raWlvclRqNEQ5RXBmeGo2QjdYM3prN1BJM1IrelZNNExLVEEvV1BD?=
 =?utf-8?B?ZUVyc1ZuSS9jZ1owb05WQnFTU1NjaHB6MitwK3pEQXQ2VUNvSVRXay9zdjBI?=
 =?utf-8?B?VFhDVWhSREVxUGVSN2FWWU5ySDF6NVliemNBNGE1N1pZYjREN3NCRFNWanFn?=
 =?utf-8?B?VVdTQVFyYVVDZ2N0Smk5OFp0b1lWVUc4TnNpc3dUbXlnWlgwNkVicTExemt6?=
 =?utf-8?B?eXphWG5TeWdYTHptajAyRHpjRzB3NTRHR1BvTUhsczNRa3FKemozc3ZoTGhw?=
 =?utf-8?B?bCsrRnZDbkZkVkpoRjBZU0lnUlBpQWQzdFE3RUZVbHEyckRIczNKRHhjWG1V?=
 =?utf-8?B?cnlnTGpnMUlPZmdlM2FlU24wdmwwMFQxdWtDVGh4czNsM2ZoNjFIcmxqaUtS?=
 =?utf-8?B?TGZNWFk0U3FXLzhPbWkvNnpmNzhUYUhVYmptSjJDTTUvR2RHbXdTeE9lcXM3?=
 =?utf-8?B?QktqZlJqSDg2SmFtdk1kZC84NmVtLytPMksyUWo0N2EzaVJEcytybmdqaXZD?=
 =?utf-8?B?WHRsNmMydHZkdFVyWTRNK1AwMVR3TWQvVFhDTzRhZkVjaTYzZ0QyUWxXMFVx?=
 =?utf-8?B?dzNjY0dXZmd3em5nckJ1aVozZzV2RXJDS3hybVkraWYxSkI5Mkw5bTJFcmc3?=
 =?utf-8?B?ZGRYM1FXamJFdlNQbC8rd1laZW5VNUpvcldoM0s4KzZZL0FPZnQzbEZWeVd2?=
 =?utf-8?B?ZTNLWXc2UTgxV0I3cG55NUVrUGlidXhLWjZRZTlVZ05UUERFK2lHN253a1kv?=
 =?utf-8?B?bnloUEtwS2VtVFIzWU1UcXUrMkczMVF2R2tPcTFGRDl5ZzN2emdxM2tXb1Br?=
 =?utf-8?B?Qk03SEV2Ujh3UVB6TmMyVzdqbmRFcytrdnpvbjN0bEdoRk5ML2pLV3lHaTJh?=
 =?utf-8?B?QUovNEtyUGFEZzlVYzJsMDY4T01NTGI1MWQ3bWVscy8xZXdEWER0SytJT0tX?=
 =?utf-8?Q?MRhthUrF8e1BjUFe5o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmVnT3dTbW1NdVZOME84NG5VRVp2bkhpcEppbzUzOEVjT0pML0tLOTRhZTNU?=
 =?utf-8?B?aTF6d2VLanlNUnpQV0tBcTF5amhVc08yVmVTRVNReXVDaFFnVVBlK1BISXdk?=
 =?utf-8?B?L01oaTZrTEl0U2ZqVm1tV3JuNUZTVGlUcGRmY3JlcUx0cWdGRDdCM0thcFl6?=
 =?utf-8?B?MWxUUDViV0JVMyt5ZFlDelFlKytiSXJ3cmVNRnhYaFliY00xQkw4TlBZTm5T?=
 =?utf-8?B?QWU4RzR2cmh2SVFETHFNS3pXckFyNTBEOEpjYkRreWs2S0gzYXNvdHhCZG9m?=
 =?utf-8?B?T0NsSktlM01JWUc5cTRQclNleDhkaThMeFhvZlRINm1QZ3dWcXhKbElLWVJS?=
 =?utf-8?B?SEtvSkNaemMzZjFSc2FtcmhWTGpUWmhMMXdqZU1OSmdkU3ZtVTJ2RVkyM3h1?=
 =?utf-8?B?Wm04RUwwdEIyNjQwZDZ2ekZ3eWgzOFViSzQzcVVuRFFjTUVncjE1aU5QZ01M?=
 =?utf-8?B?ZGVBRTh6L1Nvb1QzOHdrdWRKN0JjVERvRVlDUGgrQlQ4VTRvNDBuV0poSXhw?=
 =?utf-8?B?ektHK3Z2LytpQXB3ZW1SN3c0R3kxbVRwelNJN3ZGazlMYk5UOUZzcHFISzgy?=
 =?utf-8?B?RHBCRlhpSEdNSElUVXZ4YUl1ZW95Q0tYTkNtRDFjWUVHQzRsQWllcFhvbEZU?=
 =?utf-8?B?Y0FKcjc5ai9hemdyNkkvaE92VkRVNHlJTlh4NVVGTXFYMkhOSVMvUU1Mendj?=
 =?utf-8?B?MktlaTdzT3UvV1ZBM21nV3ZNMWI3L3owOW0rNDY2SHFLZ2dHazdzWTNtSHNH?=
 =?utf-8?B?cVo5Y3hERlRiTmlIZWJoNk1iT2Y4N251WFhyNDhFN1ZpZU9ITVU5ZmpxTktw?=
 =?utf-8?B?bUgrVlpYQnpmZzV0RUx3NjNDVFRMTVplZEMxOU1DN0RwVmx3QVk4Wjc3VjA5?=
 =?utf-8?B?ZllxZnlqMzM4Rk1wcElXR1YyYzRJR2hFdTVOUTg0SStoUnZNNDhLSXF3aHJV?=
 =?utf-8?B?eVdjdUt3LzFwK0dsbGVya1JFNjJWUHkvaXRYTnoxQ0kzMTc5RzRNVHVkYzRP?=
 =?utf-8?B?bXVudVJaK0xhMXZmUE5rYUIrM3RQTWExRk5DZ25hVjFBQWFpSWVKbStVTGhy?=
 =?utf-8?B?Q2R0bklGUlkwYjAwZUFQZzBMV0RPTU93Q3FiV3pNSjNSS1VlM2ZsK0RNdE10?=
 =?utf-8?B?dUtQcm5kUWxyeklTdVZkeVg4L1NjZ0pVU3dvaTBncjYzcHJpaTFseVJSTnlD?=
 =?utf-8?B?ZmlBSjZhaGRkK3VBaC9PQUxRVERkYmw1NUoxSnMwajRSY3lMMDdNMFhTdGJN?=
 =?utf-8?B?VnBiQXVnT0xQa1BJTlNGYlFCd1VEZHNLT2JvL3FvY0YxWGJKTWNUUVFTMFNx?=
 =?utf-8?B?Vk02OE9UQWFkY1FLdWhMMlpWSEEvZUxHRmdmSDd6ZXhVZ1NnUXY0dEFwUWtR?=
 =?utf-8?B?Q3p4Sm9tZFF0cVM1bk8ySCtGNFR6TWlBSzNBSWJ1NUpyZ0pERnQ0RmxMb0pR?=
 =?utf-8?B?V2I5ODVHSTJzWTZrYVNPV3BLZ1hiVi9FWFZNNW1OcTJ4RmtwbnlVQlZQVUE0?=
 =?utf-8?B?bHJ6YW9mZG4wWnRBYWJtZVpGUURhNFp0THdESDhDUVVteWpxZlUvZEpvdkdD?=
 =?utf-8?B?SDEwVHNDdDd2M0tRUWl4NGxobnhsMCtISnlTb3hqVGlRU2UxaUVVMUpIdDQx?=
 =?utf-8?B?UjJVcHNNWDUwamRoM0MwS1hVMjBFVC9zZE5wa3NlK3lPRk5lcjd3QVJBck5r?=
 =?utf-8?B?VngyeG10Wm55QTY3Q2I4UUJTOUJYdHFXb242RU5ocWhNQk1GY3pHdGlKeXRl?=
 =?utf-8?B?VDBiNFJuUmlROTNWZm5XVlVrVGpkQ2JYVjJpN0F1ekR2cGR3QktRNW9vb3BQ?=
 =?utf-8?B?L3JFUGVhYk9INTFrUjdCVVp5Um5qdmRxdnhlZXZXekZobjhBNGgvYWdWdGt1?=
 =?utf-8?B?a0N0SzFndCtLYzJxYWVTM2ptbStEUCtldlNLcWNmWGRhNnM3VkFhYUNyTlIy?=
 =?utf-8?B?QXhJNkpIUmhBRGhLeEptK0o3M1Ftd3UrdjNIdW11ZklYSTJMV2w0WFFNanht?=
 =?utf-8?B?Q3duRDQ1TFFGMTJGeEZvZGNGWFJlckNEUlVueElqUTUwcmVpSmtJL01WNWtF?=
 =?utf-8?B?MVc1WFIvcHhmUmlZMk5IdXc1SE1pUnNvczk0dHZaVVdiVWRpa1UzQkpHZmlS?=
 =?utf-8?Q?D1rY=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0306761d-59ce-4190-a61d-08dce9424b77
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 15:43:32.4103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VCl7bm3Od/Z0b7676nzt0LyImvpJWV8WT7iE4DMfih80k0YYndBNuiuWywBeLRE1opWrQbfD3pmUmGjMMs6KHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8984
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

Convert device tree binding doc zii,rave-sp-eeprom.txt to yaml format.
Additional changes:
- Add ref to nvme.yaml.
- Add reg property.
- Remove mfd at example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/nvmem/zii,rave-sp-eeprom.txt          | 40 ----------------
 .../bindings/nvmem/zii,rave-sp-eeprom.yaml         | 54 ++++++++++++++++++++++
 2 files changed, 54 insertions(+), 40 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
deleted file mode 100644
index 0df79d9e07ec2..0000000000000
--- a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-Zodiac Inflight Innovations RAVE EEPROM Bindings
-
-RAVE SP EEPROM device is a "MFD cell" device exposing physical EEPROM
-attached to RAVE Supervisory Processor. It is expected that its Device
-Tree node is specified as a child of the node corresponding to the
-parent RAVE SP device (as documented in
-Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
-
-Required properties:
-
-- compatible: Should be "zii,rave-sp-eeprom"
-
-Optional properties:
-
-- zii,eeprom-name: Unique EEPROM identifier describing its function in the
-  system. Will be used as created NVMEM deivce's name.
-
-Data cells:
-
-Data cells are child nodes of eerpom node, bindings for which are
-documented in Documentation/devicetree/bindings/nvmem/nvmem.txt
-
-Example:
-
-	rave-sp {
-		compatible = "zii,rave-sp-rdu1";
-		current-speed = <38400>;
-
-		eeprom@a4 {
-			compatible = "zii,rave-sp-eeprom";
-			reg = <0xa4 0x4000>;
-			#address-cells = <1>;
-			#size-cells = <1>;
-			zii,eeprom-name = "main-eeprom";
-
-			wdt_timeout: wdt-timeout@81 {
-				reg = <0x81 2>;
-			};
-		};
-	}
diff --git a/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml
new file mode 100644
index 0000000000000..d073c51c2b9a9
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/zii,rave-sp-eeprom.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/zii,rave-sp-eeprom.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zodiac Inflight Innovations RAVE EEPROM
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  RAVE SP EEPROM device is a "MFD cell" device exposing physical EEPROM
+  attached to RAVE Supervisory Processor. It is expected that its Device
+  Tree node is specified as a child of the node corresponding to the
+  parent RAVE SP device (as documented in
+  Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml)
+
+properties:
+  compatible:
+    const: zii,rave-sp-eeprom
+
+  reg:
+    maxItems: 1
+
+  zii,eeprom-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      Unique EEPROM identifier describing its function in the
+      system. Will be used as created NVMEM deivce's name.
+
+required:
+  - compatible
+
+allOf:
+  - $ref: nvmem.yaml#
+  - $ref: nvmem-deprecated-cells.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    eeprom@a4 {
+        compatible = "zii,rave-sp-eeprom";
+        reg = <0xa4 0x4000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        zii,eeprom-name = "main-eeprom";
+
+        wdt-timeout@81 {
+            reg = <0x81 2>;
+        };
+    };
+

-- 
2.34.1


Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14B10957B03
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 03:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1527410E490;
	Tue, 20 Aug 2024 01:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="RuBqWoho";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2079.outbound.protection.outlook.com [40.107.255.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A58710E490
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 01:33:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RsiYPRJnXN0pmJ1GYYdxul2eh9a1B6vG6GeN6DSztrABGxK6H/P/A4l+RDUo9ytJF9AwBYDzowqCGnYXH+mc6S2BCkpS5GGkrG9cDXKqsTRvx3fNPp4pJU3+V8OPWv3XLvZ6IwGasqtUEeh9GKPNAj1jeJp5CEcyQ/2yrrSrQ4pUAI2dV+q4JPRNg/2YQ5wMfqO0U/rzAbXCn53qu/f58xTRuABxZLaNNXwVPkBH2quEFZKk6o1fp888/UIO/pQOqD9gJlb4OOI8Nz21c248Kbm06ojido5tNuyxZdKRYOPssa93F61+McyMobzGZxVTTYC8LKLReiF+Lc2H8nmzOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mm8VpeQx+ms/S3NOXz+earTIxkO6wyahrLeWeNRaWCA=;
 b=iJXkqh5Plc/Bin0vttVc7Uaazbgd1D28x/QLKh3bSbL3xgrXIx8JzsK9TPcjOTdIYSiq6ehIjq8DhlLgXEj6ktU2DK4dzWHELzxnJDmeT4jFcmNAeVeRkpWKPFMezL8Y/4PpHva+ZaZNk59g9ZV3ENQ/oZtLX/63uD7LH0gM7bMlzJvvTknO0etSfHfPXb1uo6xPVT3/k8WDcCdJ1S7uVHGWhNl1eYJR0O90tEc0gF24+mUlurwhLcKw+TjaMIF1vS0G+/BnYAYz8y11JSkKfjakcyyKBaeDV2Hx+5cAyiWeaGJ3bE5q9UCANEhw3HAaSlC+uT26zJHQoyx5gzJ7vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mm8VpeQx+ms/S3NOXz+earTIxkO6wyahrLeWeNRaWCA=;
 b=RuBqWohoE7/tQNCbGpiZTyuYuLE4vC0ui/3TUN7Rkx+LfPT8bd4J+m1NxuHLMS/SCXlVI+Hm4P0jKS/VIiMtRu9FdTCN0QrwgyssY0uLCWYhoD+lnZCe599K7/Nu0V9Mg9yWqylYHZ1+yY2iuCgl0bqUgaMRw5xA//NMrq1y85d9gbYVoqO17IXPO+gTYv7SXLYgXfWkwht4lZtPCF0GrZFuK7AFnJlAraf9f/xOvk8B8wrYbhIcprypGLXkM/dYrIbhx//O1dchuzDty7idpwN1RBxOmJrieuH8ovOeuL59dSu2wXEXaRDN270SRzEuZ8J+tubEoIiLXEcBxQS1LQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by PUZPR06MB6267.apcprd06.prod.outlook.com (2603:1096:301:115::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 01:33:48 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 01:33:48 +0000
Message-ID: <e5569c9c-c38e-4011-b77e-31a4df065cb7@vivo.com>
Date: Tue, 20 Aug 2024 09:33:44 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] fix vmap_udmabuf error page set
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
References: <20240813090518.3252469-1-link@vivo.com>
 <20240813090518.3252469-4-link@vivo.com>
 <IA0PR11MB7185465DDE79BC8DD84B8BE1F8822@IA0PR11MB7185.namprd11.prod.outlook.com>
From: Huan Yang <link@vivo.com>
In-Reply-To: <IA0PR11MB7185465DDE79BC8DD84B8BE1F8822@IA0PR11MB7185.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To PUZPR06MB5676.apcprd06.prod.outlook.com
 (2603:1096:301:f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|PUZPR06MB6267:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa9ddd2-86d0-4603-5698-08dcc0b82373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3hwdUNuenR2Ti9jSnBsb0RuZnlQQzZJY1ZocHpGeHV2TkwwRCtDbkRlMFVq?=
 =?utf-8?B?NmRJQVNMTlFxRFJCMUVBcjUxTWhmZVRxSjVUdUQ5WGxMVllNWjBVclhNRVQr?=
 =?utf-8?B?S29iQkhwamNObk1zaytLQm1qeE03N2ZCcFkrNm1kOWJMVXV4SGhncFQvUEVp?=
 =?utf-8?B?K0daWTUxa1dUMlp1V1FPb3YwS0lMbFRaZ2M4WVZIaXl6ZTZRMGhWU05NZG9x?=
 =?utf-8?B?QTViZHJyaEVES0E0YjIvQnVYeUlHTnJiQmU0dHlwRm43NU1kaGlsY2RwZkRF?=
 =?utf-8?B?MVhSZ0RrS2twSkUwbjVHRUxnTGNRUFFFNjFoMmxXUW1IOVpHUnd2L0srcnho?=
 =?utf-8?B?a2FoMnU4MVVGSmtOUURLazRGV3hqUE5Zbk42TFdBVUNKYjJmZk5neGxNaStu?=
 =?utf-8?B?RlI0eUVKM01wemxxdmRCUUpucDdzOVRXTmhudnZ1RXBSN1plZ2VYOGxnUlJr?=
 =?utf-8?B?enYva2lHZjljRUtlWlBTVzZMSUFHMlh6aHpxa2FzbGVSNytkWmRmbVBHWlFJ?=
 =?utf-8?B?TWlCWFpDR3FVRDQ1ZytuMmRaN2lVMEdVcXNPcEpPdkVha0Uzbm5WeVdxZy84?=
 =?utf-8?B?TjFGcnhVaFZ4NUJES0JWaWJGU3Yzc1FkdlhRZFBhU3JIb1htYW1pMlduTVNJ?=
 =?utf-8?B?NTdmUjlSZjFBUkNMQnd2amZudXpYWFNSeVJKTnpkYVhRZlk0N0VIcXc2NkpP?=
 =?utf-8?B?cGFXQ3Uxb1dHamFjT1VRK1BBUEE0blRBeXY3N053ZEdTeHRQUWZubElGUWor?=
 =?utf-8?B?cE5RK2JGdUdhYXlERVlIK2lKcDBYcC9EME1QQVJ0UzVNK2FSSUtHMGkremNh?=
 =?utf-8?B?dzQ2NGhiMWR4aExEWUJ5bTlQVXZML2krU3k2U2tRaXF3aVNpV0xLWW14RGJQ?=
 =?utf-8?B?NTJyNmgxSXl1TXAvZDFPc0U2V3V6RGdyY1JpT0pYYjlENHI5dFhvZFRLeTR3?=
 =?utf-8?B?bHpaZXlIZjk5eXRRVkE3VHRQbHpVOTVrdVAxSExJZnE2L3cxZjE1TklNL0dD?=
 =?utf-8?B?V1YwVlVBTDA3V0xhbW9wZkwvUFBTcUkyM2hvMWhXUzl1WXMrWjZ4cHdzWDRl?=
 =?utf-8?B?dVJjLzJtS3VKd1M3LzRJaWEzSFM0c3JwWkl5WjZIM1A5YVhvWk9La1dpWXQz?=
 =?utf-8?B?R3VwaEFFelVzazFlU3lFZzh4Si9jUVVyeGs0ZE1weWhxRDB5WnZCanNrcStM?=
 =?utf-8?B?T1FxQlR5SituU3FWNGtLOFpoeXhVSlQzTE9SRUxFaXZwS2pGK1dGd3MvZm5m?=
 =?utf-8?B?YVVKMmY3byszZWlCL3RtMkhjN3A0SDNIM0h6clJIcWNCalJKWXp5U0c3Q0kr?=
 =?utf-8?B?bDI4dW1YZGg4eDQ1cDBVb3NZcWdaZWw2THp4MDBNUUN6YUt5bWZJV1BOb1Z6?=
 =?utf-8?B?dGJ6ZlNjWll1ZitTTjJoUlBqc1c4SGszdEQ5N1hNQTVtaW5ENkFycndOSWFJ?=
 =?utf-8?B?Y0svMHQ4QzAyR3VFZHdIdzVON2Eyay9uN2FSMFVZNThFd2poRjRIQUhyM21E?=
 =?utf-8?B?bUtYb0UyT0p2cDc1bTRTM1ZMOFVaZ2dlM09jcGJFZmxxZTAvaU9uNEhxbnlh?=
 =?utf-8?B?MnVHbEYzRnMrMm5zb3dvby9admNSY05Hbmc2elVxajJsbVRnU3plNmJiSGZq?=
 =?utf-8?B?SDlzUWJRY1piU1lFaU5rYlBDYmFNUTVyV0c4T3ZFMVo3b1JpQWp5S3M0eWsy?=
 =?utf-8?B?TkJYUVFBNExyTXJUVmdpY1Zud2l3M1dnTUV4SmFCREYrSFZvSGZqbmhvTy9U?=
 =?utf-8?B?TXB3Q29BdGxBdk5VWkU5SmFmY3dnblphTFRWK1pHVGFLNm1JanFneU9ZTDc2?=
 =?utf-8?B?V2Ftc3NOc095MGVKZThIV0RvT2Jaa3hXYzFEeTdjSVZjRzV6MkNCZUs1MEdF?=
 =?utf-8?B?TkVacmtlNUg3UFBkVTYxWkNGT1ROVUFuc01GTXA4N0pPNnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PUZPR06MB5676.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUU5ZFI0blBBZzFFYzNsOURXUE5FRGFiaDhYWVNDUklEanlFM0NoL0RDaHU5?=
 =?utf-8?B?TkIwVW9RbXRadTZZNWp3TlV3TndiU0lNbFFWWjQwQzZyN1p6R3V4QVdLOC9M?=
 =?utf-8?B?Y0ZNOFIyOHJ6UTBlNFgySC9aR0g0WkpRVTdodjBWTFFDYWorVzJndzVOK1Q4?=
 =?utf-8?B?VzRFUjJMSkU3TjFDQWYraWFQbkFuVHhnamZ3T2J5T2pnRnRLYXFjakpEVWJk?=
 =?utf-8?B?MVE2cmZrSEFhckVkaG1LbklMdXh3M1UxK3ovRmFnNjRadzk1QlZCSFR6ZnBB?=
 =?utf-8?B?KzBpdUw2d3lxY3g5YzF0b2tkclFEYm1QWS9MOVIwUmpHblRQRDJseGNKTGNp?=
 =?utf-8?B?ajExWDc1ejE2STZMeHdTdjVTS09vQmhldlBOV3JIbUhWYWVvSFFveDlZbERC?=
 =?utf-8?B?SnloRDhkdTY3SXJjdERnMUc0eithQlUva2RmVWhyK1VDekwrQkpBYkowOU5B?=
 =?utf-8?B?cGIvVFVTVzdtbEYxRGkrRFcvRjJhczlHL0dBbXdGMlZaeHVBdVhIMVBNUXlX?=
 =?utf-8?B?SGRqME1maVEvaTNWdzRINk5lRDNBT2xhNU1ndlVSd204NGJiZllOUU41RkJ0?=
 =?utf-8?B?QXI3U0x0akMwTGNJcS9tajR0TU9sS2JnRDV0cUFobDJLZXRFaXRTQjFsNHJ3?=
 =?utf-8?B?bXh6dEdoNXpkM092a1dXQ2tXeUJXS0F6TjlBVXJ6d0g5czI5bEZXK01mRUdh?=
 =?utf-8?B?MGhDSUhnMmt6YTc2cFNwV3IvNnBqU2N1eG1RZ29BVWIzb2FsQVhmb2N6VFI5?=
 =?utf-8?B?S2dXd0RlUVBaSVJhcDR5NWVyaUI2eDNGNGx4aVhlUVFuNGFoaU5CUFF5d1JI?=
 =?utf-8?B?amk4YjUvemNmdTI3TS9kNVNNNE1RNlMvUDJBUlJvMWNPLzN6aDlhRjdTdE83?=
 =?utf-8?B?YzVOanNuSXA3M0N3cGU2SmpIanZGWnVtVDB3VVFOelhLTXZTelpJZHVNM09a?=
 =?utf-8?B?WFZFcS9pU2tYTDl1TG4yWVhGSEh5T3paRXlTZmE5TlZVYUZKc0dIbWVGcExP?=
 =?utf-8?B?bncrVmZNSTRUTnFROWc1T21zeTRXOE0wTFd6SmovMGU1WU9MVHdHVm5kc3Yy?=
 =?utf-8?B?WDhXZDBjbWhLSTFsNitpZzJmZHFBSEg4RmdJN1Rxa080RmtxUVNVYzU0RGQv?=
 =?utf-8?B?b0owTTdOOE1UYVhZdnU0bFVMSzNiMzdlcDdPR2xBeExuRHpQTHRSbkc1bEx2?=
 =?utf-8?B?dmQ1SXB4a1Vld2xDM2pPSDJ1MnJKTHFOM1pQZTUvOEVaM1IvNEJRUjd3VGxR?=
 =?utf-8?B?N1hvRjJCWUpKOXJkSFNpN0NsaDcrK3hMbW43UFRVVG84UVpsYlNrQ0lBU2FK?=
 =?utf-8?B?MGNIRWR1aFFtanNpUVdkMHNaWGFacFFXeC9jZlFmY2tDTE5pRlgwVTlHSm9O?=
 =?utf-8?B?bStZWjUzWmNvQzEzdW80ZlZyTGwzTDFOUUo1MlB5VWdLaWJWTFltNk9TMzNo?=
 =?utf-8?B?d28xekJiRHNTdmJMWmxPZm9Pc1ZkQzJEMEFuL2x5RS9RbmNudnJLc1k5bDNZ?=
 =?utf-8?B?cDdXSGZKYkRhaFBEc1JjZWFTYWt4eThTZndkTUE3Uk0rTG1GditQSmlqakRp?=
 =?utf-8?B?cFlMM1V6YlhkT3U5bGYxUko3eWsvd1ZPNzQwMmRPM2NMdW1HTDRxazVxU2F4?=
 =?utf-8?B?VWRGb2RTOTRFVC9FM3BybFZtR1cxcXJudUN1NllRZnIxNDhBalFCZ0R3OGVN?=
 =?utf-8?B?SVNjU1lxdkJFUy84aTE5dHUyWHJubW5HeEpMZ2VYMlhNamFyeC9SdERUeCtS?=
 =?utf-8?B?cG1SRGNMSkU3RGY3Z09jZFYwejJ0RjVHbHNReHVjUG1DQUgyTkZrVis2MlpP?=
 =?utf-8?B?Y0k0V05ITEdGeWJqdm1LMHRKTFB4WXVoZUVBL2lOTmd0RG9UbWFYU3dFajRr?=
 =?utf-8?B?cEIyR2k1bDJhV2xzZm80K0oxU1lDeFFiUllvbDdSOXpYWlNkaW1qSEFweUNO?=
 =?utf-8?B?RGozZnBkWHhnMUZaYlhPd1dEQWZGUTRMRm5iWCtMREU0VXdZNmpielcxa0Nz?=
 =?utf-8?B?eUtnQjY3cld0MjRrK25yaC8zVG1FbEhXVVN2RXBYYlh1dFZIcDdHZExjdXA3?=
 =?utf-8?B?Y1FPZ09WOFFaRmxZWnU5NkhrTmwrbUV1dDlyR3hUNngrY0J0TTI0cnllaUhh?=
 =?utf-8?Q?7llqPFlOXUKK9NJZ42df0AvlC?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa9ddd2-86d0-4603-5698-08dcc0b82373
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 01:33:48.2739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3NBmsHaXAthaGrzK/nPJCDtl2EYtAuEHDzyGmSPUmQjOSiMgNo3FerPrZO+R2zpmRk25SKnPwPM+z/kkA4JBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6267
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


在 2024/8/17 8:54, Kasireddy, Vivek 写道:
> Hi Huan,
>
>> Subject: [PATCH v3 3/5] fix vmap_udmabuf error page set
> Please prepend a "udmabuf:" to the subject line and improve the wording.
OK, sorry for this mistake.
>
>> Currently vmap_udmabuf set page's array by each folio.
>> But, ubuf->folios is only contain's the folio's head page.
>>
>> That mean we repeatedly mapped the folio head page to the vmalloc area.
>>
>> Due to udmabuf can use hugetlb, if HVO enabled, tail page may not exist,
>> so, we can't use page array to map, instead, use pfn array.
>>
>> Signed-off-by: Huan Yang <link@vivo.com>
>> Suggested-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>> ---
>>   drivers/dma-buf/udmabuf.c | 22 +++++++++++++++-------
>>   1 file changed, 15 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
>> index 3ec72d47bb1c..4ec54c60d76c 100644
>> --- a/drivers/dma-buf/udmabuf.c
>> +++ b/drivers/dma-buf/udmabuf.c
>> @@ -67,21 +67,29 @@ static int mmap_udmabuf(struct dma_buf *buf,
>> struct vm_area_struct *vma)
>>   static int vmap_udmabuf(struct dma_buf *buf, struct iosys_map *map)
>>   {
>>   	struct udmabuf *ubuf = buf->priv;
>> -	struct page **pages;
>> +	unsigned long *pfns;
> I wish there was a way to easily test the vmap scenario but its great that

It need a driver set in kernel. maybe write a debug code in udmabuf?(not 
sure)

> you are able to eliminate the usage of "struct page" completely from
> udmabuf driver, with this patch.
>
>>   	void *vaddr;
>>   	pgoff_t pg;
>>
>>   	dma_resv_assert_held(buf->resv);
>>
>> -	pages = kvmalloc_array(ubuf->pagecount, sizeof(*pages),
>> GFP_KERNEL);
>> -	if (!pages)
>> +	/**
>> +	 * HVO may free tail pages, so just use pfn to map each folio
>> +	 * into vmalloc area.
>> +	 */
>> +	pfns = kvmalloc_array(ubuf->pagecount, sizeof(*pfns), GFP_KERNEL);
>> +	if (!pfns)
>>   		return -ENOMEM;
>>
>> -	for (pg = 0; pg < ubuf->pagecount; pg++)
>> -		pages[pg] = &ubuf->folios[pg]->page;
>> +	for (pg = 0; pg < ubuf->pagecount; pg++) {
>> +		unsigned long pfn = folio_pfn(ubuf->folios[pg]);
>>
>> -	vaddr = vm_map_ram(pages, ubuf->pagecount, -1);
>> -	kvfree(pages);
>> +		pfn += ubuf->offsets[pg] >> PAGE_SHIFT;
>> +		pfns[pg] = pfn;
>> +	}
>> +
>> +	vaddr = vmap_pfn(pfns, ubuf->pagecount, PAGE_KERNEL);
> Looks like this would require a "select VMAP_PFN" in Kconfig.

Yes, I miss this.

Thank you too much.

>
> Thanks,
> Vivek
>
>> +	kvfree(pfns);
>>   	if (!vaddr)
>>   		return -EINVAL;
>>
>> --
>> 2.45.2

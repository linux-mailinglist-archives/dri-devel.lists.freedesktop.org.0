Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C039EC2C2
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 04:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48A310E1FB;
	Wed, 11 Dec 2024 03:05:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="arPk7mif";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2071.outbound.protection.outlook.com [40.107.103.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C77910E1FB
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 03:05:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtQJFQG70Z4gZdt0Z8eI7XeFLJSlDxVObfIcfd49PK4at+o8dMYvWUOkFW0raiN/590reAbs08ZUmTI++vqDFPk27d9TK0mxP/P8EegPJ9TddF8A2spnLcZ5g26DrD8Bu5WekqZDsUemSd1+DufPQwS213gb5u7CpelDnUbVLOvxjIQZZQVVY0ld4HJ4wLOr2PrMwK8yhlgDmreLbw/pNCwZryh9qoEj978EngJrEx0k0CyRvHpyfuDF8/9qrXRuzQ6z3fexInS63o+GohkS8RrMxtDdONVQkRsRWCNQF4PNyGdwplyT1EDsLXpsYi49cSAOnEI+SIlWTJzeCPtuQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49O67RjYN008j3nT+bo7EiTy/I2vOFY9KSuq6DtrJ4Y=;
 b=FO58ZcGkLUIh58fiUt3ZG9OLvKNfVrZomxGs/U9mcQL+0n/g5uY9Cx/rOjLVevgI56PjpC8kSt8FRsYFE6z0VNxunkiE+l5Nk7RBwzO/gQNUDbLVFDB8Iu5ZmaffC5wscejIDaCwN4l9hMe71pvDpYIkLPyTucNitJavg1wL0P5qbYNsx6eDCzFkjHUoJW3tbcoFZVh1IwZXr53OxQHZ6ee4SeYeyfxkZD0L5Gt0AS+Z+VdUChsu/L/RKWciVTdUm3ane/vY1iI5g1/Sv0Za3V/UfmvtIiJ3m0Pi9h215VeaaIVwmDvOOr/+jjV4GD6KSFKLgziEG10AS6fE94ws0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49O67RjYN008j3nT+bo7EiTy/I2vOFY9KSuq6DtrJ4Y=;
 b=arPk7mifvFE79J+ETa8wrzPiX0+i5i6lyOpJQ+NHgPD2hajglTIlbd43R4jP3i08L+ude5IVm6LCgVzxo1/ancYDW02Qj9WoCY0/W1LeldDYiUj9v1814SJmUj/PZKKUSNAIlZxLTT3qEHXlMAy3uUmVZ+zntQpqOYJkJXGsOhcKbDMuhxu/g21Ns9XTBEbQBUIq9OBWEMLe4HVjPLLnvshI7P4vh1JaTMZGSFFY42YbQZ3r6nEVesIpeXKj3qEr3PmZ0Hq+FazI1mI1JmZ7afhpR4KhL9wy/VAZ83kPSj4mmUmbIK3WoFj60s2Q/Uqhq23lFLTxB84oSJ7f6Jlz5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7314.eurprd04.prod.outlook.com (2603:10a6:20b:1df::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 03:05:18 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 03:05:18 +0000
Message-ID: <30924a9e-7d01-46f6-9e47-405c08acdde3@nxp.com>
Date: Wed, 11 Dec 2024 11:05:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/19] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller processing units
To: Rob Herring <robh@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 tglx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, francesco@dolcini.it,
 frank.li@nxp.com, dmitry.baryshkov@linaro.org, u.kleine-koenig@baylibre.com
References: <20241209033923.3009629-1-victor.liu@nxp.com>
 <20241209033923.3009629-2-victor.liu@nxp.com>
 <20241210221508.GA550635-robh@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20241210221508.GA550635-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM8PR04MB7314:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb85225-fe51-4e93-5df9-08dd1990a41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnIwc0liM3ZPWmNveVNWanBMcXNKU3ZDZ1RUak9GQVoyMlFYN1dJM0pXb1dT?=
 =?utf-8?B?NFZNUFVqeURpYkNLanZUODkxcUZNbjV1UzFxcGxJSlVTa3lVNGFmL1hRYXlU?=
 =?utf-8?B?NFc1T29tQkxjeFFoOXhWU3BsZ3A3a0plRy9USUpKenlCdEpOS3JicUdYLzdJ?=
 =?utf-8?B?YkV0QjNEaTNlQnlXeEhPYWZ1UzVmTlN3cTk5bStCZmFsSzVPZXlQVjNzYlUv?=
 =?utf-8?B?N21pY3hXeVd4dmhtTjJFVUJ5cXdnRUpiUVA3M0VEaEFyNXJNWkJyNTI5dFMw?=
 =?utf-8?B?bkFCOHBjUldkTForWVNnUTREQ3REd1RkU2tXOG9QcEt2UEgvRUNuN1RwTTFQ?=
 =?utf-8?B?VmM1ck54N0NYU0IvTDlZVjlBc0FLaWtJZ0I0ZkJyZjlqcUNGZDA0S1A0Y3hM?=
 =?utf-8?B?dVBqUEdaaTN5clZBb2JMRGs4SWJvRjlDbkFHWEJkSUg5ZnFwQXNwMGVGZ2lX?=
 =?utf-8?B?RDF1MWh2SlVnY2RBOUVpUnp5TDUrUVRpdzZVcnNkd3pFc2ZqaXJvSzlFQmdY?=
 =?utf-8?B?NHRtRUxOVUVzZ1diMWhzK3lNRVVwTmJYeHBIdGZqQmFrYWovc0NOcS8vVmdJ?=
 =?utf-8?B?cnNMSkFwdnAzS09nSVRBL0NkckVjd3hvZk1neHZXdWlPUlRPQVRyOGtuUjV6?=
 =?utf-8?B?TFBOWHlIVVRQYTdrclgvckxMM205eXk5OGVlOUdQRUo4K1luYy91SEpLU3FG?=
 =?utf-8?B?K2JXMVVIVnVjVUJXd2lEL0N6OTJXSDd1WUU1bFI1TEg5TmhnZ1N4ZzdoSml1?=
 =?utf-8?B?T09YdEthcXpBODJ5cmZjV2hqQ2dUR0VPSFFzTU0xdHFBcVMrdUtUU09BZWg1?=
 =?utf-8?B?VUZJdVNIM29DTElWTWRFc0paTXR6dTNtWnlZamJsa3c4WUhmRTI4dTdhbnZp?=
 =?utf-8?B?bkRORmxtMWlDNDNwTkt4Y3FoV0hyeWltblEweU14Q1NBRmlnTnl2OWc0SUdE?=
 =?utf-8?B?d1RBN1Y5OXV6SzloZWw0emd4SGszTjl6cm9OTDI4Wkw1OVgyWnN1MTFjRlVs?=
 =?utf-8?B?d1JwUWJ1RDBITTZRRDdjQ3UzNDcrUHA2MlEwSUptL2xTTGZqNjZIUm1SSmRC?=
 =?utf-8?B?bFp5NXUyTmFUdW1Ic2pONjF6OVdoQTdvajJwbGYwL0EzVnNZRmExK1hDMUlv?=
 =?utf-8?B?d2E5RE52UFpTa1hUZ1ErNDdldXA5TXVUWk4wSy9DemhqdEUyN1V6SjVFUmN4?=
 =?utf-8?B?d2NNNDJsbzV2cUpONGZYaTNmL09RK3pKREtkMm9wd0NkcWp3TFlxUkdxZkw3?=
 =?utf-8?B?eER6YmlzaUd6RVFYNTg3dUhHRk9aaU5Vd1lmbUF1V2M2NXp6VVNkMTlZVGFL?=
 =?utf-8?B?TUl6THBVc2NEMEtFcmUyazBKbFlNUjd5VTJoUFpvVmVMKzE5Mk1TakZzVlUz?=
 =?utf-8?B?Si80ZTRkeWg0UVFQL05RalVKdmNmdTFPVVZXYzZpM1crVCtrY052cDgwMlZs?=
 =?utf-8?B?NkVlR0hzVUZoNTF3SG9SLzNJWXRXWGFubGdkeTV4YldQUFppWkdadFNkaUxT?=
 =?utf-8?B?QXNVN2tCUVRwU0JRT24rNVhDb2tFWEZrTmxHQ21qK1BrT2xJNzZndjBDN083?=
 =?utf-8?B?VzV4RmcwNUxYdklXT1l5V2k2bmRzL1AwVzFUbHY1YjJMZEttOEJVek9HRVA0?=
 =?utf-8?B?Y3E2ZjViWllSalhZL3dsSTJiSHRmdWMzODhhMkJIcGZjU2hpZ3dEVFd4UnZv?=
 =?utf-8?B?bzAxYjZzSGRBbjh0bTFUN2lPbDQ3RVpOdjQxeHpGaWJiVDQ1TmNYL0xlTFdR?=
 =?utf-8?Q?9kzvAQxe5jhUpgLYng=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?USsrY0FGVTZJblJpNk9CQldhYXNBUENXckdvWjVaNkdic0I1TStFOVJxdzd3?=
 =?utf-8?B?Zkd5RzBYVzBEVUhmQUNDSGk0M05ENHBIWlpnanRGSTN6QWpUTXpFT0hIdDJT?=
 =?utf-8?B?RGFPWUdWdGNhTW9JQWMrRXp3RTlFTmwwcENlNVA4amo1ejgxY09RU3dmdzV2?=
 =?utf-8?B?UTA3cDduelNGMHJnTVlYcWZCZGh2N3gzYVpBMlVTZEVIYXJQUzgvVGg4YVJC?=
 =?utf-8?B?SlN5dnIzOTQzM1BSNUdpWEZKc0pXemdDSy9kYUdVUEVHdWU4d1FCaWxZbmgz?=
 =?utf-8?B?Y3Vta3dMUGJocERXRytabERXYkJEdW5sNmZocU9Ia1l1MkVaWFl6WnI0TFVk?=
 =?utf-8?B?Qm1xNmkrOEZEeGozbHZncW5sVGJjQUZtWUlINHZob0VsRGw1UXpBTzlhQURr?=
 =?utf-8?B?b3g5a3JSY0c1ejNzcmRBbzFTUDAyZCtiUUpkRmJXM3l3UVM1SG1YT3kyQWxE?=
 =?utf-8?B?WHZ6TTJya2o2SzNueHpsN0RGYk5GYk04SlRpTjdCcWdFaVpqNkhraHhtUnBz?=
 =?utf-8?B?cUxYTlpzVitFcFRES3M4bnJUc2tPS1owd3RKZmdQZlpka0ZqemJWUUcwdEdN?=
 =?utf-8?B?RCt2UVIrd0N1eW9CTW5JU0FFQU1YSWdNZm0rT0Q2dFhEaWVnTHJDUUlUVnIw?=
 =?utf-8?B?M0V3STN4YUFXV0ZSY2s5Tk4yejZYNEczODhTbmRQRjNhUmM3eVRZUm9Ic3dH?=
 =?utf-8?B?Qy91QUNxRjRlaDdEMU5hV0JNdVlWQVFpQ3dNOTZRVFE0UGtMZEpWdmNvTVlu?=
 =?utf-8?B?aTB2ajZMK2VXMlErNnJXSmVOTzczQTdaZVlsMlNKUDBrMFNhMytDc3BnQ1J2?=
 =?utf-8?B?cjRqVlMxdU1VUkNhOVZIZWQ2U2s1dW8xQ2IxR05OaVZwM0QwOW1XN01oazdN?=
 =?utf-8?B?bUZHZ1J5QXdmSmpiY29USy8zRWJab2V1TzhLYnYrZjRpbVZsMEUzWnVUL2Ev?=
 =?utf-8?B?M3RoK1B5ZW05N0xwTGpSUGhsQkxKdFlXMzVIZW9SdGhQT2Z1bksxKzQvbC9r?=
 =?utf-8?B?YVYvd3lXMG1YL3pid1pCdDlYb2MrNy9TZDhVNVZpOE9BOUpmbjhVRkNoRVUr?=
 =?utf-8?B?aUhaNGI3anhEd0pDVG1hVWt0Qmg0d1AvcXdvL21NVldRSWJtU3I5aW1JRm8z?=
 =?utf-8?B?Rnd6MFNCWFpFdVVRZ1Q3dFJPUTdhNUI0cE85SktHMlZpdHJpUlVBSGdKZzNB?=
 =?utf-8?B?M1R3QkdLemoyZUF0dkp3Ri9qUDRrT2lxazcxL2VEVnp3aXgxZlFlQ00wVjhn?=
 =?utf-8?B?YkpBSzFPTlRURk5HR2I0ZzhvUG83VllFV25Zd1lUNldXc2lsUnduRWkwN1dj?=
 =?utf-8?B?YllXeGdXQ1dyOFFpYjBCN3NlWVFRQWxoRkE1S0pxTFpQaTY3cWFJbDN1UFJJ?=
 =?utf-8?B?MWpBTlp3YUdCYnJwMEt2eDZac05TSFNsaVlQaTRJNjl4RFBxZlUvb2ZuZzFV?=
 =?utf-8?B?U2RUcWtkS3czaXlRY1FqWmliUGVZbis1dVo4cWt1S2IrNTgyMTJWVkdHdHR4?=
 =?utf-8?B?QWg0VUF6R1RXbmtRdVgxY3NZREc1dllBSXlhS0ltWjFhWFQ3RWdLcE9YK21F?=
 =?utf-8?B?TExWS3N5TFNKMkNZNmEzVGhadHVLaVJMVnVkRW1LV3RhUVFDaldkejVVZFdz?=
 =?utf-8?B?OTVJOUZSWmNDZUxSc0VlME9admMrVTZDenBmU1FRYVRmTVZreVhwOVduUW1Y?=
 =?utf-8?B?S1BBWlhrOUpoYUVpcmJmdzlpQUx6QXZzWU1HczFVRHJkZWRDb1l5b1U4bVJq?=
 =?utf-8?B?dzQxSHY0NE9UMHBIemUrWVFZckl3d2laekJtTHBES2VvL2xFNEZqbnk2OXRJ?=
 =?utf-8?B?MDBrQzhWSm1TTWVUamMrVGVzdUNzVzZNbGZvREpCT3BMSE0wSlg0N1lCK2FF?=
 =?utf-8?B?Mk5iQjBFRWVxb0kzM1ZpTHpoQzllUWJlTE8rcVJURlNCOGdWNGRHWmg4YWRt?=
 =?utf-8?B?NHJuRzVqMmx2Njl3NGgxbGZ1NmlRK200d0tucCswTTBxUm9YU0hYa3hySlFF?=
 =?utf-8?B?ZWs4WjJwN3hZeDlJRFJOYkh2WjdQZk5lMXdFMkJQM0lUL0hqNXpNdkhmcVNk?=
 =?utf-8?B?bGY4eWU1aFlIRTdXYlNHaVJ2NkxRYTBrSjZKMmcxWHFmU3k4eC9YdGdROUc0?=
 =?utf-8?Q?jTflMBwRuYmI4JPhselp4r3z8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb85225-fe51-4e93-5df9-08dd1990a41f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 03:05:18.0794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0h3WJJbKZqeK1wPrh5PGpUgHit4Oal4yFRJOQfdehXTC8hplLwdysahC78TtuWWJ6S6WyN88XiyeYCPzET0yHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7314
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

On 12/11/2024, Rob Herring wrote:
> On Mon, Dec 09, 2024 at 11:39:05AM +0800, Liu Ying wrote:
>> Freescale i.MX8qxp Display Controller is implemented as construction set of
>> building blocks with unified concept and standardized interfaces.  Document
>> all existing processing units.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v6:
>> * No change.
>>
>> v5:
>> * Document aliases for processing units which have multiple instances in
>>   the Display Controller.  Drop Rob's previous R-b tag. (Maxime)
>>
>> v4:
>> * Collect Rob's R-b tag.
>>
>> v3:
>> * Combine fsl,imx8qxp-dc-fetchunit-common.yaml,
>>   fsl,imx8qxp-dc-fetchlayer.yaml and fsl,imx8qxp-dc-fetchwarp.yaml
>>   into 1 schema doc fsl,imx8qxp-dc-fetchunit.yaml. (Rob)
>> * Document all processing units. (Rob)
>>
>> v2:
>> * Drop fsl,dc-*-id DT properties. (Krzysztof)
>> * Add port property to fsl,imx8qxp-dc-tcon.yaml. (Krzysztof)
>> * Fix register range sizes in examples.
>>
>>  .../display/imx/fsl,imx8qxp-dc-blitblend.yaml |  46 ++++++
>>  .../display/imx/fsl,imx8qxp-dc-clut.yaml      |  49 ++++++
>>  .../imx/fsl,imx8qxp-dc-constframe.yaml        |  49 ++++++
>>  .../display/imx/fsl,imx8qxp-dc-dither.yaml    |  49 ++++++
>>  .../display/imx/fsl,imx8qxp-dc-extdst.yaml    |  77 +++++++++
>>  .../display/imx/fsl,imx8qxp-dc-fetchunit.yaml | 147 ++++++++++++++++++
>>  .../display/imx/fsl,imx8qxp-dc-filter.yaml    |  47 ++++++
>>  .../display/imx/fsl,imx8qxp-dc-framegen.yaml  |  68 ++++++++
>>  .../display/imx/fsl,imx8qxp-dc-gammacor.yaml  |  38 +++++
>>  .../imx/fsl,imx8qxp-dc-layerblend.yaml        |  45 ++++++
>>  .../display/imx/fsl,imx8qxp-dc-matrix.yaml    |  48 ++++++
>>  .../display/imx/fsl,imx8qxp-dc-rop.yaml       |  48 ++++++
>>  .../display/imx/fsl,imx8qxp-dc-safety.yaml    |  34 ++++
>>  .../imx/fsl,imx8qxp-dc-scaling-engine.yaml    |  89 +++++++++++
>>  .../display/imx/fsl,imx8qxp-dc-signature.yaml |  58 +++++++
>>  .../display/imx/fsl,imx8qxp-dc-store.yaml     | 100 ++++++++++++
>>  .../display/imx/fsl,imx8qxp-dc-tcon.yaml      |  50 ++++++
>>  17 files changed, 1042 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-clut.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-constframe.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-dither.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-extdst.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-fetchunit.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-filter.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-framegen.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-gammacor.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-layerblend.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-matrix.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-rop.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-safety.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-scaling-engine.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-signature.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-store.yaml
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-tcon.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
>> new file mode 100644
>> index 000000000000..7f800e72c3f3
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-blitblend.yaml
>> @@ -0,0 +1,46 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-blitblend.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale i.MX8qxp Display Controller Blit Blend Unit
>> +
>> +description: |
>> +  Combines two input frames to a single output frame, all frames having the
>> +  same dimension.
>> +
>> +  Each Blit Blend Unit device should have an alias in the aliases node, in the
>> +  form of dc<x>-blitblend<y>, where <x> is an integer specifying the Display
>> +  Controller instance and <y> is an integer specifying the Blit Blend Unit
>> +  device instance.
> 
> That's really an abuse of aliases. If you need to describe connections 
> between components, use the graph binding like everyone else does for 
> display path components.

I need to describe components' instance numbers which imply the connections
between components but not vice versa. If I use the graph binding, I cannot
get the instance numbers(0 or 1) of the two display engines(documented by
fsl,imx8qxp-dc-display-engine.yaml). If you have no objections, I may add the
instance numbers to compatible strings, like brcm,bcm2835-pixelvalve0.yaml.
What do you think?

> 
> Rob

-- 
Regards,
Liu Ying

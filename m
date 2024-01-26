Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A5483DBA8
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 15:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8EB10ECE7;
	Fri, 26 Jan 2024 14:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C744C10ECE7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Jan 2024 14:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706278996; x=1737814996;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1/BnJRsX/1elYaMb7wTHT0zOi8CFwgptJT4WJz9pXwE=;
 b=dXeRsRFQDsBZyLH5O/MT5JNko8wKY7g1eJj1wvtLA4I5lKqVfAuF7la0
 Jarl3VEe0HRaN6cDBqhD3OOyUCd7eSFZ8NM3gq7MRxBZzJ4ZvGNJWF5we
 +UiSq91aXIY89c/MYn3GymH+CBNU8Werk9wgEXTQqCT9/8m4N/bdNc1/Y
 O052Qiu4REuT8ZQMuviy9Qenb214q2krMu0p08q9/VZEsLK4ka6OTGGMk
 ToJ0FGH7oyB1ER8wDtlFqvhT94KMGbempsb5ToytG7uoJSZxVs386ObxP
 NDT6c584k73rKWNedf+a6jfOCxXIN7PfZPFOfHU/ucBxrGHk8pHXTuZyp g==;
X-CSE-ConnectionGUID: 8sfnxV1mT+O2iKYZH7Y4HQ==
X-CSE-MsgGUID: WqZ+8E3UTDiNGAw/Skq3JQ==
X-IronPort-AV: E=Sophos;i="6.05,216,1701154800"; d="scan'208";a="16634588"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Jan 2024 07:23:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 07:22:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 07:22:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UbfkSNxu/zE9IF3AeHQpEkg14HZt79pfC9ESUox4+5LA6wDRNEcBQ5LmTbf958ngJOwe8OVLWep1RvXexJCxzeAoVgC95cL89cKjEYRaVHE0uEas8kqNUFPaq/zctkGXF6KcrVQeOsFh+HLvKQ/PZgdqkpB0HUojsIcJfpLWj5KS9odTdb9hQ/0UURdGOdQ/wBkaeN8CfQ0FTYczUL44Ze5zTlYwlicqpfUI+uiY8cI9oSXyqy580VTDZRXGE6tg0OyszcRlHGH4Ki+pp3KGBsa0UaaGR8c/N57vNqPPT2vBHRAZy4NVFOsbobJJW8bDPSDJtx3OIKtWWT41HBj66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tOFV6tiSB9u+ZkCLFW9JBApssCZqvXAFKd7F9phRM7w=;
 b=gZRaRpFwFko0dHhr504N1xQ9PH4XRWSkJ4zpSKvWLJNCDNaBTajZTQZ+rxTRekqFq6NHGbMYTyhEoBQmOHdF3x/ogvfZRfhpx5iu5LdKuko75pE1m/8zMXjgiRCfEg8dw9CgpezcHvAOPoe6rDmgDDX2jV3oPSASf3+MMITcjm122GXSvFbG/lGxUS4YTyM82shiM56/5OP8Jl7A/gsmWB3ksQu80NPdiDmqvP3ovGgf0IvCYGXNEVxFxpN6gZj2Hrn/AlNxUzR58Lm5fKFV9BAyCy7XCrKvfIaQFnl+LeioCxbbpJL93S5BP2JYTQ1ZaoKpI7AxeAD1PP12h4344A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOFV6tiSB9u+ZkCLFW9JBApssCZqvXAFKd7F9phRM7w=;
 b=ZmdHQ54IbmH3AXzx3LQ0YP/DMVnbLLJsgtIm6Dkvg9YavXymPM5a5/RIuwBo+fFYaXezx4JoG6DNccLe6e2KVF7r0xpH+jtxb/bIDS9sDP2a6CIbQxmnBASAY113X6wfSyDfIIoy6Ym6UrUtpLp15y32C9bzwBCbnxze0G5h9/grczCSrYagWgQfno6NuTBv023hzQ7L579Z6iAloRWIZr6FOaaYJHIZOU2rdtZeRr6yX0Xnp4pH2lrP7Lvx/9eoAFSaZLAkmj/iB236XRIRxGINtfw6zGW8kmI24TUDHBIN0SY94c8ll17NPtKIbjtHhorL2CpfkDI8j7FQTyee2A==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by PH0PR11MB4949.namprd11.prod.outlook.com (2603:10b6:510:31::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27; Fri, 26 Jan
 2024 14:22:44 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7228.028; Fri, 26 Jan 2024
 14:22:42 +0000
From: <Dharma.B@microchip.com>
To: <Conor.Dooley@microchip.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Thread-Topic: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Thread-Index: AQHaSfB9G+vm5oXSwEmW6mjsJvC8kbDftWKAgADHFQCAAI7AgIAEKeOAgABefoCAAuIIAIAAvjkAgADtGQCAABv2gIAAKg+A
Date: Fri, 26 Jan 2024 14:22:42 +0000
Message-ID: <51da296d-a8a9-417a-8875-3b5e866a89a3@microchip.com>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118092612.117491-4-dharma.b@microchip.com>
 <20240118-recent-glorified-fd35d72e006e@spud>
 <c33868c8-dc42-4800-885c-5e5f24c2044e@microchip.com>
 <20240119-character-mardi-43571d7fe7d5@wendy>
 <da60f9f3-f955-4a87-a020-5710185953c0@microchip.com>
 <20240122-stark-duress-2f59294dcf27@spud>
 <4906b7e2-0ddb-4d3c-a48b-e16278f2d649@microchip.com>
 <20240124-lend-emerald-1028fe65cc39@spud>
 <c3c30bf2-e7c2-4861-bfdf-519a7afde476@microchip.com>
 <20240125-proved-passage-7fa128f828db@wendy>
In-Reply-To: <20240125-proved-passage-7fa128f828db@wendy>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|PH0PR11MB4949:EE_
x-ms-office365-filtering-correlation-id: 8649439e-13b7-4f75-fbc4-08dc1e7a4230
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uabJoKcXS8FtbYzPFRQ4aplJlolork/Sl+lTLoK008VnR7ePsRrEASZgAMhkX/YZju0Db6b3e+Hai+01LB5xHDGUDmgW79SMPZxuJYi8pvigy60DJyO1MuXWPOrB7D2PWlz955fZJN9Yuiu6YDv9UEQ1d0YNfBsW48Ius5EAgUup5hosUoJkUDyh7qWpp1kGgU36gbWtcd0tbehIwT80uXlFcYwfKJ40VqMSX4zy8YYG99M0j5wf6d+9j9Z0aEVJpIgvBm8I5E5Wvs7wiotmj0MzcjPReJsBDGAoepFAv3PMD+7eM6bT4ZTWrY/Wj8jrKEc0ex5Ts4YXP9UhwEjosWHfYy9fnumR0eXmnF6D3c/EoUOdUefdBDkj7CJKWdW1euD6NzkksmByle5i1T0SfGZnEEm9UQD6MFqnWozo/jJggay/t73S9IabiTiZO3hherAoxyTsBPTS328YsrUnwuP8jm/Bw9voRDrBUBGvp5Jp2isSbwO3lAGSf1uVt7R8gJQME54u/KaFfC8PAk7mxofGYXM4eT7pRqMhIIEh0gLci0OcYm9ILA8qvUcVOIGlY+lB5HATaFVuubBfx5FADZv2/euOj3mHQE3oiE+9rkq9aoajM6fa5Xkv2pGM9Y8QNQZIVwTZSc6bH/qTpBMHXw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(136003)(39860400002)(376002)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(83380400001)(6512007)(2616005)(107886003)(38100700002)(122000001)(4326008)(5660300002)(8676002)(8936002)(7416002)(2906002)(478600001)(6862004)(966005)(6486002)(6506007)(41300700001)(71200400001)(53546011)(66446008)(66476007)(54906003)(64756008)(66556008)(76116006)(37006003)(316002)(6636002)(66946007)(91956017)(38070700009)(31696002)(86362001)(36756003)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?sM2PE+T7q4pySDiHknZfd2jcw9zuHix/ZgHFHDX0xXG65GFLNBl3ItOyHE?=
 =?iso-8859-1?Q?ue9GqsjGo68Mjr7qSS3sFtu4XIJlTY7tzepN0dfxcoK3VF5nwqm0uDcgXW?=
 =?iso-8859-1?Q?54tMQUUEw1lPyLLXWv7khJv+4QCIws5AvOU3BZZNgxIWPH1f4EzpCTBOc0?=
 =?iso-8859-1?Q?D0tBbVgnWIzkNi4+vzhs6x5XVLV0kD2HsF0GIvpYdU2jhtHJryHexJbjD5?=
 =?iso-8859-1?Q?ryP+MHM3PuUITws2ojkzIr73Ah1FuxU1uVb57aI8OD2Ss1Pmf441JbF2EI?=
 =?iso-8859-1?Q?UuF3ZJIthEC4aAgZdME3k6Qo1uZ/63sg/Vw4OTGMvlhC/Y85rsFEAXhyBh?=
 =?iso-8859-1?Q?8MrivPwVFJpcfTACuAdbm4YxRhPxXOf9c/4mBNHO5jjtv1ISxxNQwY4NPF?=
 =?iso-8859-1?Q?a++FApWVpCpQcAybIJvtjmhRdkKctqbOLPxGfdWG7syNPRHf6z3/AKo54g?=
 =?iso-8859-1?Q?I/zaTbWsXe3LubVIySy00glpaxxON5kL/rJz9OlzAhZRLNNiAvxE3fYTGD?=
 =?iso-8859-1?Q?mBihEDI/fKc2Tbej/5TN7IUnfXBEseuZwOPMiWkBtPXbvD48FdrW87keab?=
 =?iso-8859-1?Q?cgkB3xiJYxSf7/T/7V4mJ5YbP7i94YZ1EMVMBbAyk2owv0Nmony7QrkG2Q?=
 =?iso-8859-1?Q?fPQ8Fz+4PmWC4JJnOITDjLbg5k8Sh10cAXaFDatrNoxLSc+pPfYoPH4fVd?=
 =?iso-8859-1?Q?vFQbV8r8pFb3ExfctWVEgCb0tur4hP4Ox0ocM9zVXTjLnKKjhcQZTDRD72?=
 =?iso-8859-1?Q?fefLK1L9EjAWqTDUYBEUdJVazOhbCC/AcBxnjhE1d7zZA4tYdCGri9DYij?=
 =?iso-8859-1?Q?cggJ5e8bIHoemHdrnBeWgGKp1OeLYVp+M6wvuWUtoSuXOFKCFxs3LSM8dX?=
 =?iso-8859-1?Q?+VhZfUrOOtflcFHJwB3bGGhFq93ZEN9ExFSHJxqin+giA6EI5wj20mNZk5?=
 =?iso-8859-1?Q?GQyqjtA78Gg2IZdbW/mH7/7ZFsCbWzeI4Qkg50rgAySn1tLWNTmbyYvW2i?=
 =?iso-8859-1?Q?CorPuZ6xbBnVz8/nzW5fRV1ls8XxL9Im09xDlxdCiGSFw7JX9hcLQ5iAe2?=
 =?iso-8859-1?Q?r7E4ly/IxyTVXemTLd/aKcuYYY1O8yh/9xwUF6AjoyPa0PdH1LSdrsx0iG?=
 =?iso-8859-1?Q?vTtrF/OU3YYCDRUBvqM2I7dvIC1TakiZivoo2x4vti+64Ymw5V+N+KAhq7?=
 =?iso-8859-1?Q?kEU/w2pYJOgtiBn1NXC+J4twnPSr0iK3RrAqIYGfaytEWQqtxLiCq9PEQ7?=
 =?iso-8859-1?Q?apyvSy4gB5OioW73XaeKDGbfqmHN8OuTXluSfzQ07aBIuZQnWCn3BKSfjP?=
 =?iso-8859-1?Q?OnRDdg5YEJq3V0MAGC9IPip56WUCC0RWWnJI4GvsoFb5ljVhncWrwfS8yR?=
 =?iso-8859-1?Q?sqf6UbASupIVyo5D2fDb+ANpwluM+ig7qr2g4kNv/tQjUjXY7ITeZKaV80?=
 =?iso-8859-1?Q?toz9RWSYtCILu6u4y3qNEYLMDjKCKKiyRL2/nAcwpoEDba6nrrOpLFr67t?=
 =?iso-8859-1?Q?JIkcIGvH7eErwIBP3EgpwRapdaWIoJ0nFFbzQ+IAtE4kTvSnLCPHg9daeA?=
 =?iso-8859-1?Q?Aj4WMrO8IKkl5Azl8EvSkISvkHSPq6bDDbcVqgndxjrMoBLP6/ODzXoHhT?=
 =?iso-8859-1?Q?OCMlu2tbNDJgUJMvwgMK9uoziDSQ6aYAcxvNvfTUUigRqusoe7oKRz+Y+M?=
 =?iso-8859-1?Q?bL4eK7WNmevp0QcNxf4pb4XwJDjOt4H0NIxqvuJl?=
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <05AAE253C650464985AA72B3E4957186@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8649439e-13b7-4f75-fbc4-08dc1e7a4230
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2024 14:22:42.4853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eIpYgw6oObuibjwdzSEV5vNMHhK4mf0o/W1n+f6aafvGZ7zpOC533i0xUbSVapN0mY7LVs/mF6AXeGPBI4Q43A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4949
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
Cc: alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 Linux4Microchip@microchip.com, dri-devel@lists.freedesktop.org,
 Nicolas.Ferre@microchip.com, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, claudiu.beznea@tuxon.dev, airlied@gmail.com,
 sam@ravnborg.org, lee@kernel.org, u.kleine-koenig@pengutronix.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, tzimmermann@suse.de,
 mripard@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org,
 daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Conor,=0A=
=0A=
On 25/01/24 1:57 pm, Conor Dooley - M52691 wrote:=0A=
> =0A=
>>> If the lvds pll is an input to the hlcdc, you need to add it here.=0A=
>>>   From your description earlier it does sound like it is an input to=0A=
>>> the hlcdc, but now you are claiming that it is not.=0A=
>>=0A=
>> The LVDS PLL serves as an input to both the LCDC and LVDSC=0A=
> =0A=
> Then it should be an input to both the LCDC and LVDSC in the devicetree.=
=0A=
=0A=
For the LVDSC to operate, the presence of the LVDS PLL is crucial. However,=
 in the case of the LCDC, LVDS PLL is not essential for its operation unles=
s LVDS interface is used and when it is used lvds driver will take care of =
preparing and enabling the LVDS PLL.=0A=
=0A=
Consequently, it seems that there might not be any significant actions we c=
an take within the LCD driver regarding the LVDS PLL.=0A=
=0A=
If there are no intentions to utilize it within the driver, is it necessary=
 to explicitly designate it as an input in the device tree?=0A=
=0A=
If yes, I will update the bindings with optional LVDS PLL clock.=0A=
=0A=
clock-names:=0A=
  items:=0A=
    - const: periph_clk=0A=
    - const: sys_clk=0A=
    - const: slow_clk=0A=
    - const: lvds_pll  # Optional clock=0A=
=0A=
=0A=
> =0A=
>> with the=0A=
>> LVDS_PLL multiplied by 7 for the Pixel clock to the LVDS PHY, and=0A=
> =0A=
> Are you sure? The diagram doesn't show a multiplier, the 7x comment=0A=
> there seems to be showing relations?=0A=
=0A=
Sorry, =0A=
LVDS PLL =3D (PCK * 7) goes to LVDSC PHY=0A=
PCK =3D (LVDS PLL / 7) goes to LCDC=0A=
=0A=
> =0A=
>> LVDS_PLL divided by 7 for the Pixel clock to the LCDC.=0A=
> =0A=
>> I am inclined to believe that appropriately configuring and enabling it=
=0A=
>> in the LVDS driver would be the appropriate course of action.=0A=
> =0A=
> We're talking about bindings here, not drivers, but I would imagine that=
=0A=
> if two peripherals are using the same clock then both of them should be=
=0A=
> getting a reference to and enabling that clock so that the clock=0A=
> framework can correctly track the users.=0A=
> =0A=
>>> I don't know your hardware, so I have no idea which of the two is=0A=
>>> correct, but it sounds like the former. Without digging into how this=
=0A=
>>> works my assumption about the hardware here looks like is that the lvds=
=0A=
>>> controller is a clock provider,=0A=
>>=0A=
>> It's a PLL clock from PMC.=0A=
>>=0A=
>>> and that the lvds controller's clock is=0A=
>>> an optional input for the hlcdc.=0A=
>>=0A=
>> Again it's a PLL clock from PMC.=0A=
>>=0A=
>> Please refer Section 39.3=0A=
>> https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/Product=
Documents/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf=0A=
> =0A=
> It is not the same exact clock as you pointed out above though, so the=0A=
> by 7 divider should be modelled.=0A=
=0A=
Modelled in mfd binding? If possible, could you please provide an example f=
or better clarity? Thank you.=0A=
=0A=
> =0A=
>>> Can you please explain what provides the lvds pll clock and show an=0A=
>>> example of how you think the devictree would look with "the lvds pll in=
=0A=
>>> the lvds dt node"?=0A=
>>=0A=
>> Sure, Please see the below example=0A=
>>=0A=
>> The typical lvds node will look like=0A=
>>=0A=
>>                   lvds_controller: lvds-controller@f8060000 {=0A=
>>                           compatible =3D "microchip,sam9x7-lvds";=0A=
>>                           reg =3D <0xf8060000 0x100>;=0A=
>>                           interrupts =3D <56 IRQ_TYPE_LEVEL_HIGH 0>;=0A=
>>                           clocks =3D <&pmc PMC_TYPE_PERIPHERAL 56>, <&pm=
c=0A=
>> PMC_TYPE_CORE PMC_LVDSPLL>;=0A=
>>                           clock-names =3D "pclk", "lvds_pll_clk";=0A=
>>                           status =3D "disabled";=0A=
>>                   };=0A=
> =0A=
> In isolation, this looks fine.=0A=
> =0A=
> Cheers,=0A=
> Conor.=0A=
-- =0A=
With Best Regards,=0A=
Dharma B.=0A=
=0A=

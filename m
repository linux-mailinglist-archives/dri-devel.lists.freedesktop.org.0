Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4BB9EAFD0
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D4A10E898;
	Tue, 10 Dec 2024 11:26:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=prevas.dk header.i=@prevas.dk header.b="JmeIoc+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2068.outbound.protection.outlook.com [40.107.249.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43BBD10E6B0;
 Mon,  9 Dec 2024 10:00:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YUbou6e+sK+S2Yj2BgQe5wbPxIGCuI8n4jokB0CW4uxJspO810SKC3nNvIEX4Zx6bntq6Zuj27KeMr7G4JH1HUy9regRxdP/ECdl1dGltKn5kUEBe3EUlxYudXHXcP/mNX4ZNS1dLNfGwjduIEli3W+aLXK/Hcf9RDoWHZ6RjApXKlmhA/ClzcIP3fkcFlY2+7CFpTDcQm4jcahJq87gsEkeaF6G7MuCJevVzC3m6tdHYQrFtEYfcUlajmQZCRiowYv8taGSZFv2kppt9gPEWt6aZpgi6xgvMHdw1B8ZkRzQd3hiqUfTcqJedsIdFoVdKjAYiqdjdLIL11gfyyDDdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gKZ6DyLGscSAuAthfhVQuNWggzDufR5tnqxVrg3vmU8=;
 b=NhMmy46po16F1eGYOvb3O6i5QDwLjVcf0RiVrvuDx0avPiA0gWjczh8F/+5uHK1k/mPTZHLgFQEL6OWoluBAyNwhAzQ73TQJwAUvijst79DP51YiJ0YzUK9BysxyrZhktDht78IEzs137I4WsSpCkISRYa16F3wcIOEXhfR7hElIGlUZgWuBZe7+RbTEoWC0kL5dRNAhCRrDqvzcOX7b0EOjcIRc74olzd87DyOHS++og61HpuCeYHhQam+e+28fy8WdOefjB6zpWvGRRw5AcEHZxhL0MMMIncotKt19Y9/mZHKCBnukoUztHyizt5w0h7Kvi5y/rKoRZdNa4DwgOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gKZ6DyLGscSAuAthfhVQuNWggzDufR5tnqxVrg3vmU8=;
 b=JmeIoc+NiYCpj9lzPr7YzocWoOxlF8dVKSPacSd+t9z54gFX5bcdX+m1hyYGQ9v5nosNiZKa/jS91CCNNVt9kwA+SUpcZnbm7uVWWdteDeyAYHYcpO9+VgXMpBeiPMCvu7p1mbgLjv0IO14+eO8VrXN+2cSUmtTeDTHv4Vm5TwI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:41::17)
 by GVXPR10MB8863.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1de::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.12; Mon, 9 Dec
 2024 09:59:48 +0000
Received: from DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4]) by DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7e2c:5309:f792:ded4%5]) with mapi id 15.20.8251.011; Mon, 9 Dec 2024
 09:59:47 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Vincent Mailhol <vincent.mailhol@gmail.com>,  David Laight
 <David.Laight@aculab.com>,  "w@1wt.eu" <w@1wt.eu>,  Luc Van Oostenryck
 <luc.vanoostenryck@gmail.com>,  Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,  Bill Wendling
 <morbo@google.com>,  Justin Stitt <justinstitt@google.com>,  Yury Norov
 <yury.norov@gmail.com>,  Kees Cook <kees@kernel.org>,  "Gustavo A. R.
 Silva" <gustavoars@kernel.org>,  Jani Nikula
 <jani.nikula@linux.intel.com>,  Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,  Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,  David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,  Suzuki K Poulose
 <suzuki.poulose@arm.com>,  Mike Leach <mike.leach@linaro.org>,  James
 Clark <james.clark@linaro.org>,  Alexander Shishkin
 <alexander.shishkin@linux.intel.com>,  Rikard Falkeborn
 <rikard.falkeborn@gmail.com>,  "linux-sparse@vger.kernel.org"
 <linux-sparse@vger.kernel.org>,  "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>,  "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>,  "linux-hardening@vger.kernel.org"
 <linux-hardening@vger.kernel.org>,  "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>,  "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>,  "coresight@lists.linaro.org"
 <coresight@lists.linaro.org>,  "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,  "uecker@tugraz.at"
 <uecker@tugraz.at>
Subject: Re: [PATCH 02/10] compiler.h: add is_const() as a replacement of
 __is_constexpr()
In-Reply-To: <CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com>
 (Linus Torvalds's message of "Sat, 7 Dec 2024 10:19:34 -0800")
References: <20241203-is_constexpr-refactor-v1-0-4e4cbaecc216@wanadoo.fr>
 <20241203-is_constexpr-refactor-v1-2-4e4cbaecc216@wanadoo.fr>
 <1d807c7471b9434aa8807e6e86c964ec@AcuMS.aculab.com>
 <CAMZ6RqLJLP+4d8f5gLfBdFeDVgqy23O+Eo8HRgKCthqBjSHaaw@mail.gmail.com>
 <9ef03cebb4dd406885d8fdf79aaef043@AcuMS.aculab.com>
 <CAHk-=wjmeU6ahyuwAymqkSpxX-gCNa3Qc70UXjgnxNiC8eiyOw@mail.gmail.com>
 <CAMZ6Rq+SzTA25XcMZnMnOJcrrq1VZpeT1xceinarqbXgDDo8VA@mail.gmail.com>
 <CAHk-=wiP8111QZZJNbcDNsYQ_JC-xvwRKr0qV9UdKn3HKK+-4Q@mail.gmail.com>
 <d23fe8a5dbe84bfeb18097fdef7aa4c4@AcuMS.aculab.com>
 <CAHk-=win8afdcergvJ6f2=rRrff8giGUW62qmYs9Ae6aw=wcnA@mail.gmail.com>
 <0f5c07b827c3468c8fa3928a93a98bfa@AcuMS.aculab.com>
 <e806dd51b1ac4e289131297fbf30fc37@AcuMS.aculab.com>
 <CAMZ6RqLOR3aCRW_js2agV+VFiHdazb4S2+NdT5G4=WbDKNB8bA@mail.gmail.com>
 <b1ff4a65594a4d39b2e9b8b44770214e@AcuMS.aculab.com>
 <CAMZ6RqJFReLJTd-O8s02oQNeB0SPQh3C-Mg+Nif5vMB9gFtQww@mail.gmail.com>
 <CAHk-=wjpN4GWtnsWQ8XJvf=gBQ3UvBk512xK1S35=nGXA6yTiw@mail.gmail.com>
Date: Mon, 09 Dec 2024 10:59:44 +0100
Message-ID: <87ldwpgorz.fsf@prevas.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Content-Type: text/plain
X-ClientProxiedBy: MM0P280CA0066.SWEP280.PROD.OUTLOOK.COM (2603:10a6:190:8::9)
 To DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:41::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR10MB2475:EE_|GVXPR10MB8863:EE_
X-MS-Office365-Filtering-Correlation-Id: ea4590a2-863d-4110-87b1-08dd183836b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|52116014|376014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4B0ZrxED3OiHZsTFT9kC1l86G7YgQtZuDxnhH3SHqIIkVL03UDIURSkm+NNM?=
 =?us-ascii?Q?U0RgsT8nvJ+7ajYSlvk5GFiaanv5I4p8bicbc95VliPxLEJplS3/2zgw6GJl?=
 =?us-ascii?Q?hHMjSzgP7Jf6LB3gvQMeP05sIotkqeOI2MrqehGnwE0KnQXfjGHBydrIVdHA?=
 =?us-ascii?Q?US2YhKqSPWIR27X9uQHAguBq8/pcClCYuq5KFpgkfWyhGrbmUW+CtV1BWZru?=
 =?us-ascii?Q?lzJjwy/rDpOq4iYFqTHB/VxwH8lZkq10wUyUOo9Q6QZZZhqmDdvS9Q221iSY?=
 =?us-ascii?Q?+kEWg8aq5gUUbd5fCzdVCdxCMrirdrJWM/jCh+/te5cTGRdt+ibTMYh0Cbs4?=
 =?us-ascii?Q?MnlXevhVniSIPjC29PBM846Ue7Y2qdrFeBnpXFC0e8aijzZ28IaPKbVtbRa2?=
 =?us-ascii?Q?g4ijCttNOTqu/NiYt7S9huvQUGWV7dVJx6HUmAGUOBfE65g4/AngFaoCnEny?=
 =?us-ascii?Q?J8J4Aj7oNgWhE9PDZQYeMuI3SnoDpLCfcGit7GB0nCozGkBoMdHbuy6eQqao?=
 =?us-ascii?Q?L9h2LunAfgYFGsYS8mA0sdPyrOhFzMtnv5evz7Bl0Ftt6ie1Gut2fDJKXmWM?=
 =?us-ascii?Q?H0y8P9+3uEhoevDPWQmVWl7nJBjvB29LwQfS/d5qrOhbxeMyOAZQQkRBMHn3?=
 =?us-ascii?Q?D1otU9/ParlT0/SIlycFw4Lq5UYJ5hWJ9Mr5bN5/xak0YffQxUaBp+y9VwDR?=
 =?us-ascii?Q?Atl4h1DJrBPfYVWBLQ2inGW6J2whZzB4qaCqqSnjbzleX+ME9IkA2IWZrbZH?=
 =?us-ascii?Q?RoYshuxL4Ol7ReLOKWLczJRWIayHanuBYJO6MEl1Q4ipAfIfo2/K9KC1lEhD?=
 =?us-ascii?Q?TDfnU9NY6p0atFfoRxY63aRycLw6YvYQxUiaIt+k4+sZDlzaaX+CDUz5H8f0?=
 =?us-ascii?Q?yMg2Z3j58E30X9iWagczOmiDPjqNYoFi5L4YLby7s14PmrT1PBAevHERDJ9k?=
 =?us-ascii?Q?d4nXK9/YgSXUIO1NI+kKcDmcKp7bdOh3DjrkmMuwIrc4rK3zVDTnWiYgCybN?=
 =?us-ascii?Q?HiizSJlUPCvDnRQ21aZbuL2xZ96MuqhmplrlLVTik5+z6pZJpl0ZiiVIQKUh?=
 =?us-ascii?Q?2YtcC/n5HJA//zvx9VDXxMvezhV50sJOHh2dqMVpifCr3wXNgTMHnB1igOVB?=
 =?us-ascii?Q?LqSVI0MEGtMkzoDeeEPHHKNsp9sPogv3wkQdeYLwzdVIZCAkXHEDBUYGlimO?=
 =?us-ascii?Q?b/Yu9KldxrU4R/K5+DXwhvtXCkyUB2As9lW3pX4fzy31lKgKJ53x+9of9BnW?=
 =?us-ascii?Q?A9juIdm/Aifv5TlLSAdlcawpjphaolFNTJOaM/lXBp6EXTszgJc5v/jmR2KT?=
 =?us-ascii?Q?uDlbtTyQ2Q1oIOjmO0JSb3I4Nh3ULzFSyr8CtMsnkxhI7udqiofXwW+E94zk?=
 =?us-ascii?Q?50EuZFlRnHty5I7gwQHe5VeIm9FgBUNC0oLn87HB3vFEsVDbXg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(52116014)(376014)(366016)(1800799024)(38350700014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IKHc/f15B2xAJZtBJJOOMaNPOtnBNo8MVKYk+1LOo03j7A121MwxPeNtfnIE?=
 =?us-ascii?Q?DGWKjrilryPWn3POYUMa24MiElNyfk+kFiB/5mN2lSuBCC1gYbPlHPXsmPAw?=
 =?us-ascii?Q?6b2qjD4DU0djhWygfIxMFJazrjGnS5Qrw5ijTx3XDVT0WEhRMaRsw9myj7mi?=
 =?us-ascii?Q?EZY/fRBHigL4WXvwOmyTdzAMs2EUTezhFdqmCPvHxe8UVD4khLrxIFiyeUJ1?=
 =?us-ascii?Q?5KSz9thjGsA/Zbw6DciOeGCSdFG5cJdIBoeMo/q8j7xLeybSGjQa778BtO9i?=
 =?us-ascii?Q?sO+KkWxyqiE9s1OrJ7evONsyGk06nU9Ual1v4Ite0FRSR+1r2GJMlGyC/eje?=
 =?us-ascii?Q?o2VtByIPoRP+6vyLhA+HIK9sMCDzV6HI/XO6QS+fwTGbgi7dudILKMeuli/x?=
 =?us-ascii?Q?D/8Cm1xKHyOWaNoJIF1yxfVvrwilHa4aF/RGK2XgJ+34TRV+WSxXsvyN55Lm?=
 =?us-ascii?Q?IHdCsFKTC++/p9DG3qLYF9zac0GkzzFBzsGOiWuExVvjpaXrQyS1GIacst4W?=
 =?us-ascii?Q?d3NEzNOHNgFI5+dQ8OjjuLaiDfH/KVhoeDSCmnxe4UeLi/44NPvOdsQCohmO?=
 =?us-ascii?Q?nnt4qjNF32jqVWJeWzbHguJPmeCmFUMTEIXnsLHZf3lbfchrebEu57PZQ20Y?=
 =?us-ascii?Q?fATdNtaQzvb9sanLMc+x0F0w+xDoCzUsTVOSeNTkk9EKJYrDCg5w+GJGNy61?=
 =?us-ascii?Q?L1NKlHEE0m7KIKRXAEo9bu8zHKUdyiQNm6gi9cLfGyIk6KaTsTtDfaT4JRK4?=
 =?us-ascii?Q?JU3JpiZY88nm0EHqIBIQw5UNzp46RbDo0J5gVrSmPSIXv7Tl6KHtQfAq2xA0?=
 =?us-ascii?Q?4GSQ/tJtx6gtXZxuy5Jj+5OK9wQkVQ7qU74Y0mW1MJDQ/Z+IPMrPpD16gog1?=
 =?us-ascii?Q?o6Pi7x2tKL0ejdzSAMUsWheW5DeTY0d5OB+QzRlgVrGuHYpxEcoXCEQEW3Ky?=
 =?us-ascii?Q?T5x3FxLvUvOqPWUcgIR8T9UXkVw3hkKrs9d7i+/2muTWxT403JX6WiXP3DBt?=
 =?us-ascii?Q?+7W68ibymWlNyG12hAlNSUjoikRSFg6qUg1ZtAO/4kNrYT97UVozVNCVMVjj?=
 =?us-ascii?Q?rDXSRdA3IwRisV44val9pB/2LSgYWIM5/nN1EYxbS9RXgF392bRjVp+y7AN8?=
 =?us-ascii?Q?MrXvXyDUUf0TG/p3BrMG+Omy0wA6f1EQX/90wa+7qdoWQ/0S/IoqdUc/u9aM?=
 =?us-ascii?Q?buktPtIjZqxOn0iLO+Z3VGzFhwzHAsot12eEFd2CuMuigc8dVzeLkZS3UKCd?=
 =?us-ascii?Q?DVH1Fjm6IDnh44E6WSAOMaQjHRmewOH3mwV+w6fzCUzCScBU7V3U/teNfTdv?=
 =?us-ascii?Q?rnoP+Ds8bCemevOsDlHHJnP/EvXhqQ6344alJK7Dn3trAxcgueYKfhuH4ZzF?=
 =?us-ascii?Q?1fsY9PZdYboIOhKj39Jk2Q/BqoSUaqOP8hCSPakquraeM52BeHe7iProW/F4?=
 =?us-ascii?Q?SiV+zbgJSffH1hl1ee6B/tj4YT3VFCOafcKWUBTi5//5tmmyGSIa70Tt59lA?=
 =?us-ascii?Q?/c6WFa5G8sj7CL6aohz1MCH6AkmpQ4ghTDTxYe2fTnjl2fFIE/+lxZI7WC+j?=
 =?us-ascii?Q?jTT/DhvY7Kcgafy+Hk3s1HSEjkdF7gv54dO4QVIk2vzDRTt41U8t2QsOpQYL?=
 =?us-ascii?Q?bA=3D=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: ea4590a2-863d-4110-87b1-08dd183836b6
X-MS-Exchange-CrossTenant-AuthSource: DB7PR10MB2475.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 09:59:47.8517 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YW4gvq7Lmc552Yrwl1NChpyOiYc0/58yyyNk1GNo7S5rdHRqd+2DnGiDF1w8ptFhsGgzYD2NIrrCgTy/NcsPNsU5Si+L2VunuBCKtSish8w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8863
X-Mailman-Approved-At: Tue, 10 Dec 2024 11:26:10 +0000
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

On Sat, Dec 07 2024, Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sat, 7 Dec 2024 at 04:24, Vincent Mailhol <vincent.mailhol@gmail.com> wrote:
>>
>> > No good - expands everything twice.
>>
>> And? __is_const_zero() does not evaluate its arguments, so no side effect:
>
> No, the problem is literally the expansion.
>
> Double expansion of these fundamental helpers gets exponential,
> because they are used in various nested ways in other fundamental
> helpers.
>
> That's why we then spent so much effort on trying to clean up the
> min/max macros, because a single line of code would expand to
> literally tens of megabytes of horrific expansions.
>
> And the problem with these things is that you can't make them inline
> functions, so they have to be macros, and then you build up other
> macros using them (like that "clamp()" macro), and it really gets
> horrendous and affects the build time.
>
> And yes, it is very sad. Particularly since a compiler would have a
> really easy time with some nice helper builtins.
>
> Of course, often the compiler *does* have helper builtins, but we
> can't use them, because they aren't *quite* the right thing.

One thing I've been thinking about when all this comes up is: What if
the compilers gave us (and the same for _min):

  __builtin_max(T, e1, e2, ...)
  __builtin_max(e1, e2, ...)

with T being a type, e1... expressions, the latter being the former with
T being the result of usual promotion on the types of the expressions,
and the former having these semantics:

(1) If all the expressions are ICE, so is the whole thing.

(2) It's a compile-time error if the values of the expressions are not
    guaranteed to fit in T (that also applies in case (1)), but this
    should not be thrown by the front-end but only after optimizations
    have had a chance.

(3) Obviously: Every expression is evaluated exactly once and the result
    is the maximum of those, of type T.

For (2), I'd expect trivial value-range analysis to allow something like

  int x;

  ...
  if (x < 0)
    bail;
  size_t y = max(x, sizeof(foo));

Of course, specifying exactly which optimizations one can rely on having
been applied is impossible, but it's the same with our current
BUILD_BUG_ON() - many of them would trigger at -O0.

Then we could just have _one_ simple #define max __builtin_max , which
would work at file-scope, automatically have max3 etc. (because I'd
imagine it would not be much harder for the compiler to just provide the
variadic version if it has code to compute the max of two already), and
none of the preprocessor issues would apply.

Dear Santa: Pretty please?

Rasmus

Footnotes:

This is of course very kernel-centric. A compiler developer
doing this would probably have to think about "what if floating point
types are in the mix". I wouldn't mind if that was just disallowed, but
I can see how that might be a bit odd. I don't think it's hard to amend
the rules to that case - rule 2 could probably be used as-is, and (3)
could say "if any expr are NaN, so is the whole thing" (and if one cares
which NaN, just the first among the expressions); inf values don't need
special treatment wrt. min/max.

With my math hat on, I'd want the zero-expressions variant
__builtin_max(int) to evaluate to INT_MIN ('cause that's the neutral
element for the binary max of two ints) and similarly for other types,
but it's probably better to just require at least two expressions.

Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7982475A819
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:45:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CBE10E573;
	Thu, 20 Jul 2023 07:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2113.outbound.protection.outlook.com [40.107.21.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E66310E573
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 07:44:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbN4kPaZqV7EWVFfg7/EBnSfbbyAXp4SXh1QQNsjhqFnrTQqey4lAynR4PTpWJ05W1Hf7+NbB60KCxCbc3/ux/jj+FLsbE82OXaFxopfN9tzQVMBUAKb/XLOdA3amviaxZwzK5dJyrVJoy54AAzULGw364yebezGdioXuOYMp5Pm78BokCz+ooWDL5VLNRK6jELYmyPBo3uNM92UpKYoOr3XuBZf/s2SMfzmlOOtI9+TuxeTUOygW4gkCe0gMeSEZAHjm2kmKQFQq9gO6CiR1heYo6+sB4kk/ee/NCEvrXJ7fPLRYUo1tCwfwAbfd/HNNZFH/l7DiFwYrhKXEqlLNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qj1WLWOoIign0MMWZa7g9TsjqyyZ54ny6suhE0Vw5J8=;
 b=dnIxsuCNc7e5bNTN7Ro/53EtEiA13HOFal67BnrOBDNOfqLa6C37dTmvAK+wXOE8aw7cExIFMqThWB0fYaGyOg21UM9R154tQGUt2mCRkHWyi86/DYjQRk+ZjG6ZC2ZBXCQjimg0+4Wrd6JQIX5KMYBxi/5Api+2DEiYM1uO46aCGiEHLWzbauQUoxBmeC1fNIuWeviRlvirMo73TO/eNlk5/8ZV1jAVuyH7D54niZi2oXGBMk4Ow9wyEZSpdl7QzZwndmJ6bGxv6Dn3GFHyCfrPbp9TG70sr4g4qTDxglDNPipmQXjwCc+gGicFB343SCgE08MIRq4vOrh37nh6/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qj1WLWOoIign0MMWZa7g9TsjqyyZ54ny6suhE0Vw5J8=;
 b=CtTyQi95lWnJCfr3KEUCfIiHfQ9SFveJEJGzHnQQzdeznmw7qFt+waQ7ilPkaSE45Y3k9kyUTCZ2ZAyJILhF9mo6sJlavfBKlzU7VcMF+epY0awPovlt4mjGE4OQKE+XK8NgppayGXd4WJRHZzqlfWwQmp10cYJBCXcVkNrxWPA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by GV2PR10MB6646.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:b6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 07:44:53 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::95ae:6cb:e93:cce0%6]) with mapi id 15.20.6609.025; Thu, 20 Jul 2023
 07:44:53 +0000
Message-ID: <6e3fc800-e4e7-cf27-7f04-ffc2ad273b8a@kontron.de>
Date: Thu, 20 Jul 2023 09:44:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4] drm: adv7511: Fix low refresh rate register for
 ADV7533/5
Content-Language: en-US, de-DE
To: Alexandru Ardelean <alex@shruggie.ro>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20190716131005.761-1-bogdan.togorean@analog.com>
 <20230719060143.63649-1-alex@shruggie.ro>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230719060143.63649-1-alex@shruggie.ro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::11) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|GV2PR10MB6646:EE_
X-MS-Office365-Filtering-Correlation-Id: f62242f2-d38b-4e3a-aadf-08db88f5347c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /XF/Sqj4bK12pQDoPv6adbRMaKIXohcUBgZIkuZyn4Zmg//ZnTivjKvNjZ848RyQ6+tHG3+NvE3p3t96xCdPDTJEdZby2I8FPDK+cBAqTF6jEOlUhnqBgRPho/AK6dfb5YbB7NTkfJbvnM3oXuvJqhFvyEfDhuyTx2BRDx1Qx6eyHTlWsLky1LoWmgZwqLiCmpquOOToPjYt4dXKQw6g0a3FdydamO9K8C1cLp9zsEZ6qaXmdXZ04ji2kTu16mfz4UEESev1hBJhwWxxGyhqECztyBN0FfzQf+4fO4dy7UuhcuKF6etQS3i4wf8IM+20lp9nH0T3tru9JB/JJLd8HjNVrYE3OLNO7LVHIhb89XyJ9012HpWKtBksyA6WtjojLx/i49sv0ndCLqTPpRKQh0vjLynyiDzlu1HKU8TrNC+TsdEQ2WE4ej5wst9vS9htEoDfyVaFvgYshLIX7uA5wqaz/Jz57vA7PSnhY3RR9FLZuFQEPVcJszRanzryO2KUB+eUXdcLuDstZL7bL7QN+n7qAmlXJGSVZJvdori2xwWMwC6z+IPhX5rvatEnNG7buFjARXtaM7+XFmqRn6L2AJZTW4qkHNd1cW+xT+OfxY2/Y80pRmOEkEacIPVLpYSHgaN44Mu8SagazlN4I3Y5UhZ43FdspvXt2s5cYRZHcLk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199021)(41300700001)(53546011)(6506007)(186003)(26005)(478600001)(31686004)(316002)(4326008)(66556008)(66476007)(66946007)(44832011)(8936002)(8676002)(7416002)(5660300002)(6666004)(6512007)(6486002)(2616005)(4744005)(2906002)(38100700002)(36756003)(31696002)(86362001)(16453003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmRpc1U4dkptZm53dVIybmJRYTZNRUR4VklzSFRLWjlNM2lxNEFlbUdhZHFN?=
 =?utf-8?B?ZnFLSzZMdTN2NzhVaUhiZzRHWDdsZTJMN0VXRGoxNHd5aWNvMW1ic2lJL08v?=
 =?utf-8?B?OU02VTZOUnprS05yY1YzVUpVUlFzeDVSTEcvejFzNkRZZW1pbFNZVTdQRzBx?=
 =?utf-8?B?cWs1SFZESXhSSWN4ZFl5UVJUWkE2QldQZy9MZkV2OGpvdEZOQXBOUUJSSm9G?=
 =?utf-8?B?YnJGaWJ6QjBwck9DME9JaWU3YnVqSDFxSDFaTkp3M0YvQ0xmUVYzUFFscGJr?=
 =?utf-8?B?eThHTXdHbGE1V1NLbk9wMStDN2MxcEYzbGFoZy9LUDhqNG1ja0tXbUwzUHVY?=
 =?utf-8?B?VmJwKy8xNWVMOEhPRkhtMjdUQTFpU0huUnlyaGdXRWhkY0ZuU2lpcXB5MFc1?=
 =?utf-8?B?Q0NzUkc2MlliVmd0SmhtcmRHSnMwZDI3Z3E5TzkzcDIzTXZsZStZRXM1TXZO?=
 =?utf-8?B?eDRDYThPWWZaLys0dS9NTUoydklYVnhXbk9RVGlYMDZzNVFhY2FvZUVXbDg1?=
 =?utf-8?B?SzZsYjk5UlBwODNmRnJJTWZRMlRJSGJkTEx5MG1IQnI3NmpCN1o3eGw1STF1?=
 =?utf-8?B?Tk0vYXZTc3NDbFpmUzBnZlU5anVUN2FXSUFJaWMxSGVDZThWR2hodWpiS0JM?=
 =?utf-8?B?cUUrY0dIVEJDclo4bjNiSVNJcUVlWUk5dnFBQ0Jlc3YyNXNlZzlYQmlJRkFJ?=
 =?utf-8?B?S3RFNWwwZnp0YUNVNU9LT041SjY0VFdvNUpSdU5ITXJMRDZ4Sjk2dW9lWmQy?=
 =?utf-8?B?T3kxeUZiZHRxWXZwcFBtSjJsYUl0d3dDUXV3U0JBWnFiUm1jOWwzaEEwY1hm?=
 =?utf-8?B?QlcrRUJaYytJa3NVQjVENGs2bmNNZWYzc284M2Y5UmpqbFdGKzdYdUd6enlR?=
 =?utf-8?B?MGFjYndpT0dPOUcxeWNHdzk0M05OKzgwY0VrTjVLZ2RUc1FxQjlqNE90QkVU?=
 =?utf-8?B?QUlYSmtVWExaQ0c3bHY0OHFwZFEyQmFNNXJLVUhFTFAySWhTbnBTMG5zZm15?=
 =?utf-8?B?Y00xcHBWbno2RWRRV3NncVhiR1BaS2JnYU5PQ1oxRGExVS9Kc2IvaUZJRVZF?=
 =?utf-8?B?MUpSRUxYOUNoVk5SME1PWU9sSjJyZTFEcGd5UnpUMms0Vit0V1Z5TlNzcGM0?=
 =?utf-8?B?alk3dVVXTi9OUXgveThkZkFBazd2NGduUG1nSzlCc3Z1eXdBNXVqS2wxNUpP?=
 =?utf-8?B?TXB0UlJrL203YTlNeGpiSDBCRC91TkI0RlJzUUhpdzIzbTRJQUFkY1lCL21G?=
 =?utf-8?B?bW9pWkRTb3N0bWpaWU9oQThZbUtXUTNhQ2VVVWhzeHVVRjZMcENxMXF1Vy9D?=
 =?utf-8?B?QXdJU3lDNTRra1ltdjRybzZ4RWcrYlI2Y0RqdFl0Z1NGb2d5N056THd6L29i?=
 =?utf-8?B?RXU0dDFJT0NaY1FSKzY0L0hxSkJuYyt4VVZoM1VsV21vcEM3VGtaYmJMM2Ns?=
 =?utf-8?B?UHcyWDBFRGF3U1lvdUYxV0d1OVJLZWtoM2xVenJjcHNDY0JVVVhWWFg5NzBt?=
 =?utf-8?B?WVRMZTB5RUdkTkxZSUk5ZVlubjBzbHo1Si9uYW9kWlBacmlhMHloVEQzSXlp?=
 =?utf-8?B?OHhVUUlBSnZGTmNLNXJXYll1Ri80TnAvcDJpZlYzdUQ0TFc4d2hYWXBKREpr?=
 =?utf-8?B?cTJ0STY3Z2xWUmlFMHRVd0Qxaml6N1VTVWlXcklLb1dpaXhERVRpWW1jMVEz?=
 =?utf-8?B?VnNxVFlDMjhENlNHN2lkZElYa1pQMnhUS21TdnEyS3R5aVB6UTM5NE5idTNo?=
 =?utf-8?B?VmlGcWtsNVlIRjQ1ZW9pWVE5RmpjeFJDM2JIWnZoVTJ1VkFidWliYjJ4MXFk?=
 =?utf-8?B?eU9ialU3WUxmaVJ3YThVbUlPYWdNQXUrVnMyY0J3bXVmUzZTa01vQ3B2cE9V?=
 =?utf-8?B?M0oxWWVYUWhscHA0ZDlUaFl3eEw5MEpjZERzL3dsNndsblFhOVBKbFU3SFNv?=
 =?utf-8?B?dHV1RUFUak12Z2I3SnF6Z2lMZXJJTGtUNUFKdk1Xek9HSm5DS1R2QjBMd0NT?=
 =?utf-8?B?RVRoMThjbEFqaVNkR3NNQzFjN1l3MVQwRXU2V2VyR2Jwd0U0OW9iRnhMRVkr?=
 =?utf-8?B?cWRQR3BRcnp2bHVpNGxvczNYMWVvbkhNd3NkNVJra0tCNzlWazl4c0d1Sjgw?=
 =?utf-8?B?S2FhT3VoNDVDYmF0ODRIK3VlMFlIeXRHSlhFbWRMSm8vaHdtOURJb1Q3T0dF?=
 =?utf-8?B?TlE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f62242f2-d38b-4e3a-aadf-08db88f5347c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 07:44:53.3316 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKw5JTCdm3Bjol2uA0DkWyvPaksTSkiSeje8TDTXmBGI+mMzUCI6+bhPzB0adAjEb3eJb4v33FqwT8dy+661K7WeMR2M25/osrAo4SfqNTg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6646
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
Cc: neil.armstrong@linaro.org, rfoss@kernel.org, jonas@kwiboo.se,
 nuno.sa@analog.com, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 bogdan.togorean@analog.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19.07.23 08:01, Alexandru Ardelean wrote:
> From: Bogdan Togorean <bogdan.togorean@analog.com>
> 
> For ADV7533 and ADV7535 low refresh rate is selected using
> bits [3:2] of 0x4a main register.
> So depending on ADV model write 0xfb or 0x4a register.
> 
> Fixes: 2437e7cd88e8 ("drm/bridge: adv7533: Initial support for ADV7533")
> Reviewed-by: Robert Foss <rfoss@kernel.org>
> Reviewed-by: Nuno Sa <nuno.sa@analog.com>
> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>

Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>

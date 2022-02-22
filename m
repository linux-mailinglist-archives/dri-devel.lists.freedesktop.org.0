Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 233244BF9E4
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC63F10E7D6;
	Tue, 22 Feb 2022 13:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.102])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3F94F10E7D6
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:53:55 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:39724.521596506
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 0E3FF1001AE;
 Tue, 22 Feb 2022 21:53:48 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-b7fbf7d79-9vctg with ESMTP id
 437f38b646a245689e764bf8741df661 for maxime@cerno.tech; 
 Tue, 22 Feb 2022 21:53:53 CST
X-Transaction-ID: 437f38b646a245689e764bf8741df661
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <400476ec-4b81-6a3d-651a-dbfa8eb5717e@189.cn>
Date: Tue, 22 Feb 2022 21:53:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v10 3/4] drm/lsdc: add drm driver for loongson display
 controller
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220220145554.117854-1-15330273260@189.cn>
 <20220220145554.117854-4-15330273260@189.cn>
 <20220222082747.66otrkc4zwvhem7w@houat>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <20220222082747.66otrkc4zwvhem7w@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Qing Zhang <zhangqing@loongson.cn>, David Airlie <airlied@linux.ie>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, kernel test robot <lkp@intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>, devicetree@vger.kernel.org,
 suijingfeng <suijingfeng@loongson.cn>, Roland Scheidegger <sroland@vmware.com>,
 Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022/2/22 16:27, Maxime Ripard wrote:
> Hi,
>
> On Sun, Feb 20, 2022 at 10:55:53PM +0800, Sui Jingfeng wrote:
>> +/* lsdc_get_display_timings_from_dtb - Get display timings from the device tree
>> + *
>> + * @np: point to the device node contain the display timings
>> + * @pptim: point to where the pointer of struct display_timings is store to
>> + */
>> +static void lsdc_get_display_timings_from_dtb(struct device_node *np,
>> +					      struct display_timings **pptim)
>> +{
>> +	struct display_timings *timings;
>> +
>> +	if (!np)
>> +		return;
>> +
>> +	timings = of_get_display_timings(np);
>> +	if (timings)
>> +		*pptim = timings;
>> +}
> This is not documented in your binding.
>
>> +static int lsdc_get_connector_type(struct drm_device *ddev,
>> +				   struct device_node *output,
>> +				   unsigned int index)
>> +{
>> +	const char *name;
>> +	int ret;
>> +
>> +	ret = of_property_read_string(output, "connector", &name);
>> +	if (ret < 0)
>> +		return DRM_MODE_CONNECTOR_Unknown;
>> +
>> +	if (strncmp(name, "vga-connector", 13) == 0) {
>> +		ret = DRM_MODE_CONNECTOR_VGA;
>> +		drm_info(ddev, "connector%d is VGA\n", index);
>> +	} else if (strncmp(name, "dvi-connector", 13) == 0) {
>> +		bool analog, digital;
>> +
>> +		analog = of_property_read_bool(output, "analog");
>> +		digital = of_property_read_bool(output, "digital");
>> +
>> +		if (analog && !digital)
>> +			ret = DRM_MODE_CONNECTOR_DVIA;
>> +		else if (analog && digital)
>> +			ret = DRM_MODE_CONNECTOR_DVII;
>> +		else
>> +			ret = DRM_MODE_CONNECTOR_DVID;
>> +
>> +		drm_info(ddev, "connector%d is DVI\n", index);
>> +	} else if (strncmp(name, "virtual-connector", 17) == 0) {
>> +		ret = DRM_MODE_CONNECTOR_VIRTUAL;
>> +		drm_info(ddev, "connector%d is virtual\n", index);
>> +	} else if (strncmp(name, "dpi-connector", 13) == 0) {
>> +		ret = DRM_MODE_CONNECTOR_DPI;
>> +		drm_info(ddev, "connector%d is DPI\n", index);
>> +	} else if (strncmp(name, "hdmi-connector", 14) == 0) {
>> +		int res;
>> +		const char *hdmi_type;
>> +
>> +		ret = DRM_MODE_CONNECTOR_HDMIA;
>> +
>> +		res = of_property_read_string(output, "type", &hdmi_type);
>> +		if (res == 0 && !strcmp(hdmi_type, "b"))
>> +			ret = DRM_MODE_CONNECTOR_HDMIB;
>> +
>> +		drm_info(ddev, "connector%d is HDMI, type is %s\n", index, hdmi_type);
>> +	} else {
>> +		ret = DRM_MODE_CONNECTOR_Unknown;
>> +		drm_info(ddev, "The type of connector%d is unknown\n", index);
>> +	}
>> +
>> +	return ret;
>> +}
> Your ports and that you're using the connectors bindings either.
>
>> +struct lsdc_connector *lsdc_connector_init(struct lsdc_device *ldev, unsigned int index)
>> +{
>> +	struct drm_device *ddev = &ldev->drm;
>> +	struct device_node *np = ddev->dev->of_node;
>> +	struct device_node *output = NULL;
>> +	unsigned int connector_type = DRM_MODE_CONNECTOR_Unknown;
>> +	struct device_node *disp_tims_np;
>> +	struct lsdc_connector *lconn;
>> +	struct drm_connector *connector;
>> +	int ret;
>> +
>> +	lconn = devm_kzalloc(ddev->dev, sizeof(*lconn), GFP_KERNEL);
>> +	if (!lconn)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	lconn->index = index;
>> +	lconn->has_disp_tim = false;
>> +	lconn->ddc = NULL;
>> +
>> +	output = of_parse_phandle(np, "output-ports", index);
>> +	if (!output) {
>> +		drm_warn(ddev, "no output-ports property, please update dtb\n");
>> +		/*
>> +		 * Providing a blindly support even though no output-ports
>> +		 * property is provided in the dtb.
>> +		 */
>> +		goto DT_SKIPED;
>> +	}
> output-ports is not documented either.
Thanks for you take time review my patch, i will try to document it at 
next version.

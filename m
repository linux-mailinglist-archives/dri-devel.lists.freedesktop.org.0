Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B84DB39D7FB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 10:53:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3FB6E885;
	Mon,  7 Jun 2021 08:53:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from srv6.fidu.org (srv6.fidu.org [159.69.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008F16E882;
 Mon,  7 Jun 2021 08:53:47 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by srv6.fidu.org (Postfix) with ESMTP id A6B83C800E4;
 Mon,  7 Jun 2021 10:53:46 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at srv6.fidu.org
Received: from srv6.fidu.org ([127.0.0.1])
 by localhost (srv6.fidu.org [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id 0ltqZMD3laKR; Mon,  7 Jun 2021 10:53:46 +0200 (CEST)
Received: from [IPv6:2003:e3:7f4f:6000:f5f4:4cdd:8015:9770]
 (p200300E37F4f6000F5F44cDd80159770.dip0.t-ipconnect.de
 [IPv6:2003:e3:7f4f:6000:f5f4:4cdd:8015:9770])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: wse@tuxedocomputers.com)
 by srv6.fidu.org (Postfix) with ESMTPSA id 9487DC800C8;
 Mon,  7 Jun 2021 10:53:45 +0200 (CEST)
Subject: Re: [PATCH 2/4] drm/uAPI: Add "active bpc" as feedback channel for
 "max bpc" drm property
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20210604171723.10276-1-wse@tuxedocomputers.com>
 <20210604171723.10276-3-wse@tuxedocomputers.com>
 <20210607105234.4bb8aae6@eldfell>
From: Werner Sembach <wse@tuxedocomputers.com>
Message-ID: <f86b0eff-3383-7b0e-e893-3a1624b9271b@tuxedocomputers.com>
Date: Mon, 7 Jun 2021 10:53:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210607105234.4bb8aae6@eldfell>
Content-Type: multipart/alternative;
 boundary="------------A66A79D3B8FEF5BF8F35E20A"
Content-Language: en-US
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
Cc: sunpeng.li@amd.com, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, amd-gfx@lists.freedesktop.org, tzimmermann@suse.de,
 rodrigo.vivi@intel.com, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------A66A79D3B8FEF5BF8F35E20A
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


Am 07.06.21 um 09:52 schrieb Pekka Paalanen:
> On Fri,  4 Jun 2021 19:17:21 +0200
> Werner Sembach <wse@tuxedocomputers.com> wrote:
>
>> Add a new general drm property "active bpc" which can be used by graphic drivers
>> to report the applied bit depth per pixel back to userspace.
>>
>> While "max bpc" can be used to change the color depth, there was no way to check
>> which one actually got used. While in theory the driver chooses the best/highest
>> color depth within the max bpc setting a user might not be fully aware what his
>> hardware is or isn't capable off. This is meant as a quick way to double check
>> the setup.
>>
>> In the future, automatic color calibration for screens might also depend on this
>> information available.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   drivers/gpu/drm/drm_atomic_uapi.c |  2 ++
>>   drivers/gpu/drm/drm_connector.c   | 40 +++++++++++++++++++++++++++++++
>>   include/drm/drm_connector.h       | 15 ++++++++++++
>>   3 files changed, 57 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
>> index 268bb69c2e2f..7ae4e40936b5 100644
>> --- a/drivers/gpu/drm/drm_atomic_uapi.c
>> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
>> @@ -873,6 +873,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
>>   		*val = 0;
>>   	} else if (property == connector->max_bpc_property) {
>>   		*val = state->max_requested_bpc;
>> +	} else if (property == connector->active_bpc_property) {
>> +		*val = state->active_bpc;
>>   	} else if (connector->funcs->atomic_get_property) {
>>   		return connector->funcs->atomic_get_property(connector,
>>   				state, property, val);
>> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
>> index 7631f76e7f34..5f42a5be5822 100644
>> --- a/drivers/gpu/drm/drm_connector.c
>> +++ b/drivers/gpu/drm/drm_connector.c
>> @@ -1195,6 +1195,13 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
>>    *	drm_connector_attach_max_bpc_property() to create and attach the
>>    *	property to the connector during initialization.
>>    *
>> + * active bpc:
>> + *	This read-only range property is used by userspace check the bit depth
>> + *	actually applied by the GPU driver after evaluation all hardware
>> + *	capabilities and max bpc. Drivers to use the function
>> + *	drm_connector_attach_active_bpc_property() to create and attach the
>> + *	property to the connector during initialization.
>> + *
> Hi Werner,
>
> the idea looks good to me, but the above doc could be a little more
> fluent. May I suggest something like:
>
> 	This read-only range property tells userspace the pixel color
> 	bit depth actually used by the hardware display engine on "the
> 	cable" on a connector. The chosen value depends on hardware
> 	capabilities, both display engine and connected monitor, and
> 	the "max bpc" property. Drivers shall use
> 	drm_connector_attach_active_bpc_property() to install this
> 	property.
>
> There should also be something said about dithering done by the display
> engine (not monitor), but I'm not sure how that should be worded. It
> may also depend on if and how userspace can know about dithering. So if
> a dithering related property is added later, maybe add a note here too
> in that patch.
For this, and the DSC that Ville Syrjälä mentioned, I guess "the same 
behavior as max bpc" would be the most intuitive. But I don't know what 
that is and it's also not mentioned in the documentation.
>
>
> Thanks,
> pq
>
>
>>    * Connectors also have one standardized atomic property:
>>    *
>>    * CRTC_ID:
>> @@ -2150,6 +2157,39 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>>   }
>>   EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
>>   
>> +/**
>> + * drm_connector_attach_active_bpc_property - attach "active bpc" property
>> + * @connector: connector to attach active bpc property on.
>> + * @min: The minimum bit depth supported by the connector.
>> + * @max: The maximum bit depth supported by the connector.
>> + *
>> + * This is used to check the applied bit depth on a connector.
>> + *
>> + * Returns:
>> + * Zero on success, negative errno on failure.
>> + */
>> +int drm_connector_attach_active_bpc_property(struct drm_connector *connector,
>> +					  int min, int max)
>> +{
>> +	struct drm_device *dev = connector->dev;
>> +	struct drm_property *prop;
>> +
>> +	prop = connector->active_bpc_property;
>> +	if (!prop) {
>> +		prop = drm_property_create_range(dev, 0, "active bpc", min, max);
>> +		if (!prop)
>> +			return -ENOMEM;
>> +
>> +		connector->active_bpc_property = prop;
>> +	}
>> +
>> +	drm_object_attach_property(&connector->base, prop, 0);
>> +	connector->state->active_bpc = 0;
>> +
>> +	return 0;
>> +}
>> +EXPORT_SYMBOL(drm_connector_attach_active_bpc_property);
>> +
>>   /**
>>    * drm_connector_set_vrr_capable_property - sets the variable refresh rate
>>    * capable property for a connector
>> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
>> index 1922b278ffad..c58cba2b6afe 100644
>> --- a/include/drm/drm_connector.h
>> +++ b/include/drm/drm_connector.h
>> @@ -781,6 +781,13 @@ struct drm_connector_state {
>>   	 */
>>   	u8 max_bpc;
>>   
>> +	/**
>> +	 * @active_bpc: Read only property set by the GPU driver to the actually
>> +	 * applied bit depth of the pixels after evaluating all hardware
>> +	 * limitations.
>> +	 */
>> +	u8 active_bpc;
>> +
>>   	/**
>>   	 * @hdr_output_metadata:
>>   	 * DRM blob property for HDR output metadata
>> @@ -1380,6 +1387,12 @@ struct drm_connector {
>>   	 */
>>   	struct drm_property *max_bpc_property;
>>   
>> +	/**
>> +	 * @active_bpc_property: Default connector property for the active bpc
>> +	 * to be driven out of the connector.
>> +	 */
>> +	struct drm_property *active_bpc_property;
>> +
>>   #define DRM_CONNECTOR_POLL_HPD (1 << 0)
>>   #define DRM_CONNECTOR_POLL_CONNECT (1 << 1)
>>   #define DRM_CONNECTOR_POLL_DISCONNECT (1 << 2)
>> @@ -1698,6 +1711,8 @@ int drm_connector_set_panel_orientation_with_quirk(
>>   	int width, int height);
>>   int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
>>   					  int min, int max);
>> +int drm_connector_attach_active_bpc_property(struct drm_connector *connector,
>> +					  int min, int max);
>>   
>>   /**
>>    * struct drm_tile_group - Tile group metadata
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--------------A66A79D3B8FEF5BF8F35E20A
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">Am 07.06.21 um 09:52 schrieb Pekka
      Paalanen:<br>
    </div>
    <blockquote type="cite" cite="mid:20210607105234.4bb8aae6@eldfell">
      <pre class="moz-quote-pre" wrap="">On Fri,  4 Jun 2021 19:17:21 +0200
Werner Sembach <a class="moz-txt-link-rfc2396E" href="mailto:wse@tuxedocomputers.com">&lt;wse@tuxedocomputers.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Add a new general drm property "active bpc" which can be used by graphic drivers
to report the applied bit depth per pixel back to userspace.

While "max bpc" can be used to change the color depth, there was no way to check
which one actually got used. While in theory the driver chooses the best/highest
color depth within the max bpc setting a user might not be fully aware what his
hardware is or isn't capable off. This is meant as a quick way to double check
the setup.

In the future, automatic color calibration for screens might also depend on this
information available.

Signed-off-by: Werner Sembach <a class="moz-txt-link-rfc2396E" href="mailto:wse@tuxedocomputers.com">&lt;wse@tuxedocomputers.com&gt;</a>
---
 drivers/gpu/drm/drm_atomic_uapi.c |  2 ++
 drivers/gpu/drm/drm_connector.c   | 40 +++++++++++++++++++++++++++++++
 include/drm/drm_connector.h       | 15 ++++++++++++
 3 files changed, 57 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 268bb69c2e2f..7ae4e40936b5 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -873,6 +873,8 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 		*val = 0;
 	} else if (property == connector-&gt;max_bpc_property) {
 		*val = state-&gt;max_requested_bpc;
+	} else if (property == connector-&gt;active_bpc_property) {
+		*val = state-&gt;active_bpc;
 	} else if (connector-&gt;funcs-&gt;atomic_get_property) {
 		return connector-&gt;funcs-&gt;atomic_get_property(connector,
 				state, property, val);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 7631f76e7f34..5f42a5be5822 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1195,6 +1195,13 @@ static const struct drm_prop_enum_list dp_colorspaces[] = {
  *	drm_connector_attach_max_bpc_property() to create and attach the
  *	property to the connector during initialization.
  *
+ * active bpc:
+ *	This read-only range property is used by userspace check the bit depth
+ *	actually applied by the GPU driver after evaluation all hardware
+ *	capabilities and max bpc. Drivers to use the function
+ *	drm_connector_attach_active_bpc_property() to create and attach the
+ *	property to the connector during initialization.
+ *
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi Werner,

the idea looks good to me, but the above doc could be a little more
fluent. May I suggest something like:

	This read-only range property tells userspace the pixel color
	bit depth actually used by the hardware display engine on "the
	cable" on a connector. The chosen value depends on hardware
	capabilities, both display engine and connected monitor, and
	the "max bpc" property. Drivers shall use
	drm_connector_attach_active_bpc_property() to install this
	property.

There should also be something said about dithering done by the display
engine (not monitor), but I'm not sure how that should be worded. It
may also depend on if and how userspace can know about dithering. So if
a dithering related property is added later, maybe add a note here too
in that patch.</pre>
    </blockquote>
    For this, and the DSC that Ville Syrjälä mentioned, I guess "the
    same behavior as max bpc" would be the most intuitive. But I don't
    know what that is and it's also not mentioned in the documentation.<br>
    <blockquote type="cite" cite="mid:20210607105234.4bb8aae6@eldfell">
      <pre class="moz-quote-pre" wrap="">


Thanks,
pq


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">  * Connectors also have one standardized atomic property:
  *
  * CRTC_ID:
@@ -2150,6 +2157,39 @@ int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_connector_attach_max_bpc_property);
 
+/**
+ * drm_connector_attach_active_bpc_property - attach "active bpc" property
+ * @connector: connector to attach active bpc property on.
+ * @min: The minimum bit depth supported by the connector.
+ * @max: The maximum bit depth supported by the connector.
+ *
+ * This is used to check the applied bit depth on a connector.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_connector_attach_active_bpc_property(struct drm_connector *connector,
+					  int min, int max)
+{
+	struct drm_device *dev = connector-&gt;dev;
+	struct drm_property *prop;
+
+	prop = connector-&gt;active_bpc_property;
+	if (!prop) {
+		prop = drm_property_create_range(dev, 0, "active bpc", min, max);
+		if (!prop)
+			return -ENOMEM;
+
+		connector-&gt;active_bpc_property = prop;
+	}
+
+	drm_object_attach_property(&amp;connector-&gt;base, prop, 0);
+	connector-&gt;state-&gt;active_bpc = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_connector_attach_active_bpc_property);
+
 /**
  * drm_connector_set_vrr_capable_property - sets the variable refresh rate
  * capable property for a connector
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 1922b278ffad..c58cba2b6afe 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -781,6 +781,13 @@ struct drm_connector_state {
 	 */
 	u8 max_bpc;
 
+	/**
+	 * @active_bpc: Read only property set by the GPU driver to the actually
+	 * applied bit depth of the pixels after evaluating all hardware
+	 * limitations.
+	 */
+	u8 active_bpc;
+
 	/**
 	 * @hdr_output_metadata:
 	 * DRM blob property for HDR output metadata
@@ -1380,6 +1387,12 @@ struct drm_connector {
 	 */
 	struct drm_property *max_bpc_property;
 
+	/**
+	 * @active_bpc_property: Default connector property for the active bpc
+	 * to be driven out of the connector.
+	 */
+	struct drm_property *active_bpc_property;
+
 #define DRM_CONNECTOR_POLL_HPD (1 &lt;&lt; 0)
 #define DRM_CONNECTOR_POLL_CONNECT (1 &lt;&lt; 1)
 #define DRM_CONNECTOR_POLL_DISCONNECT (1 &lt;&lt; 2)
@@ -1698,6 +1711,8 @@ int drm_connector_set_panel_orientation_with_quirk(
 	int width, int height);
 int drm_connector_attach_max_bpc_property(struct drm_connector *connector,
 					  int min, int max);
+int drm_connector_attach_active_bpc_property(struct drm_connector *connector,
+					  int min, int max);
 
 /**
  * struct drm_tile_group - Tile group metadata
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">_______________________________________________
amd-gfx mailing list
<a class="moz-txt-link-abbreviated" href="mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-gfx</a>
</pre>
    </blockquote>
  </body>
</html>

--------------A66A79D3B8FEF5BF8F35E20A--
